
wp = 0.6*pi; 
ws = 0.7*pi; 
delta1 = 0.001; 
delta2 = 0.01;
f=[0 0.6 0.7 1];
a=[1 1 0 0];
M = (-10*log10(delta1*delta2)-13)/(2.324*(ws-wp))
Mc = ceil(M)
b = firpm(Mc,f,a);
freqz(b,1,512);