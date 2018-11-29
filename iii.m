
wp = 0.6*pi; 
ws = 0.7*pi; 
delta1 = 0.001; 
delta2 = 0.01;
A = -20*log10(0.001)
B = 0.1102*(A-8.7)
M = (A-8)/(2.285*0.1*pi)
Mc = ceil(M)
b = fir1(Mc,0.65,kaiser(Mc+1,B));
freqz(b,1,512);