clc;clear;close all;
frameSize=[612 816];
nPixels=prod(frameSize);
nPixels=612*816;

precision='uint8=>uint8';
fileId=fopen('data/S__88317954.jpg','r');
pictureGray=fread(fileId,nPixels,precision);

pictureGray=reshape(pictureGray,[612 816]);
imshow(pictureGray)
fclose(fileId);