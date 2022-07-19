clc;clear;close all;
n=0:15;

x(n+1)=2*cos(pi/8*n)+4*cos(pi/4*n);
figure(1);
stem(n,x);
xlabel('n');ylabel('y');
title('initial');


ydft=fft(x);
figure(2);
stem(n,abs(ydft));
xlabel('n');ylabel('ydft');
title('DFT');

ydct=dct(x);
figure(3);
stem(n,ydct);
xlabel('n');ylabel('ydct');
title('DCT');