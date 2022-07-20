clc;clear;close all;
nPoints=512;%DFTの点数
Ts=1/8;%標本化周期
duration=8;%時間幅
t=0:Ts:duration-Ts;
f3=2;
f5=6;
x3=cos(2*f3*pi*t);
x5=cos(2*f5*pi*t);
figure(1)
stem(t,x3)
figure(2)
freqz(x3,1,nPoints,1/Ts)
figure(3)
stem(t,x5)
figure(4)
freqz(x5,1,nPoints,1/Ts)