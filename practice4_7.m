clc;clear;close all;
parameterGamma=1.25;
picture=imread('data/hanashi.png');
pictureGray=rgb2gray(picture);
pictureGrayDouble=double(pictureGray)/255.0;
pictureCorrected=pictureGrayDouble.^parameterGamma;
imshow(pictureCorrected)