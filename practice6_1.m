clc;clear;close all;
picture=imread('data/amane.jfif');
pictureGray=rgb2gray(picture);
figure(1)
imshow(picture)
pictureGrayDownsampled=picture(1:4:end,1:4:end,:);
figure(2)
imshow(pictureGrayDownsampled)
pictureDownsampled=picture(1:2:end,1:2:end,:);
figure(3)
imshow(pictureDownsampled)
sizeNew=size(pictureGray)./[2 2 ]
size(sizeNew)
pictureChanged=imresize(pictureGray, sizeNew);
figure(4)
imshow(pictureChanged)

%% 平均処理
pictureDecimated=uint8((double(picture(1:2:end,1:2:end,:))+double(picture(2:2:end,1:2:end,:))+double(picture(1:2:end,2:2:end,:))+double(picture(2:2:end,2:2:end,:)))/4);
figure(5)
imshow(pictureDecimated)

pictureGrayDecimated=uint8((double(pictureGray(1:2:end,1:2:end))+double(pictureGray(2:2:end,1:2:end))+double(pictureGray(1:2:end,2:2:end))+double(pictureGray(2:2:end,2:2:end)))/4);
figure(6)
imshow(pictureGrayDecimated)