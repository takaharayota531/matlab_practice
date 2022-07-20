clc;clear;close all;
ires=[1 2 3;4 5 6;7 8 9];
conv2(ires,1,'full')


mask=[9 8 7;6 5 4;3 2 1];
filter2(mask,1,'full')