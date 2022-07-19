clc;clear;close all;
picture=imread('data/hanashi.png');
imwrite(picture, 'hanashi.tif');
pictureGray=rgb2gray(picture);
imwrite(pictureGray, 'hanashi.jpg');

%% fwrite  こいつはbinary形式で書き込まれる
fileId=fopen('data/hanashikikoka.png','wb');
fwrite(fileId, pictureGray,'uint8');
fclose(fileId);