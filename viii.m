
figure
y = myconv(x,h);
for i=1:length(t)
    y1(i) = y(i);
end
plot(t,y1);
xlabel('Time (s)')
ylabel('Amplitude')
ylim([-1.5 1.5])

function c = myconv(x1,h1);
M = length(x1);
N = length(h1);
c = zeros(1,N+M-1);
for n=2:(N+M)
    tmp_max = min(n-1,M);
    tmp_min = max(n-N,1);
    for k = tmp_min:1:tmp_max;
        c(n-1)= c(n-1)+x1(k)*h1(n-k);
    end
end
end



