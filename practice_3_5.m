clc;clear;close all;
nPoints=64;%窓の長さ
Ts=1/8;
duration=8;
t=0:Ts:duration-Ts;
xc=cos(2*pi*t);
window=window(@hanning,nPoints);%窓関数
%窓関数を適用している
xr=xc(:);%ベクトル化している
xw=window(:).*xc(:);%対応する要素を乗算している
%時間領域表現
figure(1)
subplot(2, 1, 1)
stem(t,xc)
xlabel('窓関数適用前')
subplot(2,1,2)
stem(t,xw)
xlabel('窓関数適用後')

%周波数領域表現
figure(2)
freqz(xw,1,512,1/Ts)
hold on
%freqz(xr,1,512,1/Ts)
subplot(2,1,1)
axis([0 4 -100 50])
wvtool(window)