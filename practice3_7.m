clc;clear;close all;
x=[1 2 3];
[re,im]=meshgrid(-2:.1:2,-2:.1:2);
z=re+j*im;
X=0;
for sample=1:length(x);
    X=X+x(sample)*z.^(1-sample);%z変換
end



figure(1)
mesh(re,im,abs(X))
xlabel('Real')
ylabel('Imaginary')
zlabel('|X(z)|')
axis([-2 2 -2 2 0 10])

figure(2)
zplane(x)