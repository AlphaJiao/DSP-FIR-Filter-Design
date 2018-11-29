
Fs=200; %% Sampling Frequency
win_len=0.3; %% default setting for window length;
winsize =win_len*Fs; % actual window size for STFT;
nfft = 1024;   % # FFT points
[P, f] = stft(y1, winsize, nfft, Fs);

figure(1)
plot(t,y1);
xlabel('Time (s)')
ylabel('Amplitude')
ylim([-1.5 1.5])

figure(2)
imagesc(t,f,P)
colorbar
xlabel('Time (s)')
ylabel('Frequency (Hz)')
title(strcat('window size = ',num2str(win_len)))
axis xy
grid on
set(gca,'ylim',[1 100]) % set the limits of frequency in the plot

