function [A,P]=freqres(x,nPoints)
f=0:2/nPoints:2-2/nPoints;
X=fft(x,nPoints);
A=20*log10(abs(X));
P=180*angle(X)/pi;
subplot(2,1,1);plot(f,A);
xlabel(['Normalized Frequency','(\times\pi rad)'])
ylabel('Magnitude(dB)')
subplot(2,1,2);plot(f,P);
ylabel('Phase(degress)')