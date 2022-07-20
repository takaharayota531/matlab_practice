clc;clear;close all;
x=[1 2 3 4];
h=[1 1 1 4]/4;
y=conv(x,h);
subplot(3,1,1)
stem(0:length(x)-1,x)
axis([0 length(y) 0 3])
xlabel('n');ylabel('x[n]')
subplot(3,1,2)
stem(0:length(h)-1,h)
axis([0 length(y) 0 3])
xlabel('n');ylabel('h[n]')
subplot(3,1,3)
stem(0:length(y)-1,y)
axis([0 length(y) 0 3])
xlabel('n');ylabel('y[n]')

%% 周波数応答
X=freqz(x,1,512);
H=freqz(h,1,512);
[Y,w]=freqz(y,1,512);
figure(4)
%周波数応答特性
plot(w/pi,abs(X),'b')
hold on
plot(w/pi,abs(H),'g:')
hold on
plot(w/pi,abs(Y),'r-.')
legend('X(e^{j\omega})','H(e^{j\omega})','Y(e^{j\omega})')
grid on
hold off