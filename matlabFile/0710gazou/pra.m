clc;clear all;close all;
img=imread('data\amane.jpg');
img=rgb2gray(img);
imshow(img)
FFT=fft2(img);
FFTShift=fftshift(FFT);
figure(2)
imagesc(20*log10(abs(FFT)));
figure  (3)
imagesc(20*log10(abs(FFTShift   )));

%% 
n = 2^10;                 % size of mask
M = zeros(n);
I = 1:n; 
x = I-n/2;                % mask x-coordinates 
y = n/2-I;                % mask y-coordinates
[X,Y] = meshgrid(x,y);    % create 2-D mask grid
R = 10;                   % aperture radius
A = (X.^2 + Y.^2 <= R^2); % circular aperture of radius R
M(A) = 1;                 % set mask elements inside aperture to 1
imagesc(M)                % plot mask
axis image

%%
% 画像の読み込み (256x256)
 I = img;
 
 % 画像に対してFFT
 J = fft2(I); %画像に対して 2次元FFT (周波数領域 0 ～ 2*pi)
 J = fftshift(J); % 周波数領域を-pi～piとする (DCを中央にする)
 figure(1);
 imagesc(20*log10(abs(J))) % 画像の振幅スペクトル表示
 
 % フィルタマスクの作成
 [f1,f2] = freqspace(256,'meshgrid'); % 画像FFT分の周波数領域メッシュを作成
 r = sqrt(f1.^2 + f2.^2); % DCからの距離を求める
 %mesh(f1,f2,r)
 Hd = ones(256);
 
 %Hd((r<0.1) | (r>0.5)) = 0; % バンドパスフィルタ (切り替え)
 Hd(r>0.2) = 0; % ローパスフィルタ (切り替え)
 
 figure(2);
 mesh(f1,f2,Hd) % 周波数領域のマスクを表示
 
 filtered_J = J.*Hd; % フィルタ処理 (周波数領域)
 filtered_J = ifftshift(filtered_J); % 周波数領域を 0 ～ 2*pi に戻す
 K = ifft2(filtered_J); % IFFT処理で空間領域へ変換
 
 figure(3),imshow(K,[]) % フィルタ後の画像表示