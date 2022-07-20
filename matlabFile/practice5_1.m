clc;clear;close all;
pictureDefault=imread('data/hanashi.png');
pictureChanged=imnoise(pictureDefault, 'salt & pepper');
figure(1)
imshow(pictureChanged);

%% 移動平均処理フィルタ
moveAverageMask=fspecial('average',[3 3]);
pictureFiltered=imfilter(pictureChanged,moveAverageMask);
figure(2)
imshow(pictureFiltered);
moveAverageMaskGaussian=fspecial('gaussian',[3 3]);
pictureGaussian=imnoise(pictureDefault,'gaussian');
figure(3)
imshow(pictureGaussian);

%% 順序統計フィルタ
pictureGray=rgb2gray(pictureDefault);
figure(4)
imshow(pictureGray)
[nRows ,nCols]=size(pictureGray);
d=zeros(nRows,1);
pictureNoisy=[zeros(nRows,1) pictureGray zeros(nRows,1)];
pictureNoisy=[zeros(1,nCols+2);pictureNoisy;zeros(1,nCols+2)];
pictureMedian=zeros(nRows,nCols);
for icol=1:nCols
    for irow=1:nRows
      
        subdomain=pictureNoisy(irow:irow+2,icol:icol+2);
        pictureMedian(irow,icol)=median(subdomain(:));
    
    end
end
figure(5)
imshow(pictureMedian);
pictureGrayChanged=rgb2gray(pictureChanged);
pictureMedianFilter=medfilt2(pictureGrayChanged);
figure(6)
imshow(pictureGrayChanged)
figure(7)
imshow(pictureMedianFilter);

%% 先鋭化処理ラプラシアンフィルタ

laplacianMask=[1 1 1;1 -8 1; 1 1 1];
pictureFiltered=uint8(filter2(laplacianMask,pictureGray))+128;
figure(8)
imshow(pictureFiltered)

%% Prewittフィルタ
H=fspecial('prewitt');
picturePrewittHorizontal=imfilter(pictureGray,H,'replicate');
picturePrewittVertical=imfilter(pictureGray,H.','replicate');
figure(9)
imshow(picturePrewittHorizontal)
figure(10)
imshow(picturePrewittVertical)
figure(11)
imshow(picturePrewittHorizontal+picturePrewittVertical)