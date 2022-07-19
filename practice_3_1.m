clc;clear;close all;
%% 標本化
f=1;%基本周波数
Ts=1/8;%標本化周期
t=0:Ts:8-Ts;
xc=cos(2*pi*f*t);
%stem(t,xc);
%% 量子化
delta=1/4;
x=delta*round(xc/delta);
stem(t,xc,'filled')
hold on 
stem(t,x)
hold off
%% 周波数特性
nPoints=512;
figure(2)
freqz(xc,1,nPoints)
figure(3)
freqz(xc,1,nPoints,1/Ts)