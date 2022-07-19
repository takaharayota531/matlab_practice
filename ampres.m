function A=ampres(x,nPoints)
%AMPRES:display amplitude
f=0:2/nPoints:2-2/nPoints;
A=20*log10(abs(fft(x,512)));
plot(f,A)
xlabel('Normalized Frequency')
ylabel('Magnitude(dB)')