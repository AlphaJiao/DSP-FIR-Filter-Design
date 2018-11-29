% Design of Type-II linear-phase highpass FIR filters 

N = 31;                     % N: filter length
wp = [0.8 1]*pi;            % wp: passband
ws = [0 0.6]*pi;            % ws: stopband

tau = (N-1)/2;              % Group delay

w_vec = (0:0.001:1).'*pi;   % discretized digital frequencies

% Passband
p_index = find(w_vec >= wp(1) & w_vec <= wp(2));
wp_vec = w_vec(p_index);

% Stopband
s_index = find(w_vec >= ws(1) & w_vec <= ws(2));
ws_vec = w_vec(s_index);

% Ideal passband and stopband responses
ideal_resp = [exp(-j*wp_vec*tau); zeros(size(ws_vec))];

w_resp = exp(-j*kron([wp_vec;ws_vec], [0:N-1]));

cvx_begin
    variable h(N,1) % Filter coefficients to be determined
    
    % Frequency repsonse of the target FIR filter is w_resp*h
    minimize( max(abs(w_resp*h - ideal_resp)) )
    
    subject to
        % Coefficient symmetry in type II linear-phase FIR filter
        h(1:N/2) == h(N:-1:N/2+1);
cvx_end

fvtool(h)

