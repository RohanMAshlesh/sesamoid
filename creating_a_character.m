warning off %#ok<WNOFF>
% Clear all
clc, close all, clear all
% Read image6
imagen=imread ('C:\projects\MyGui\A1.bmp');
realimg=imread('C:\projects\MyGui\A1.bmp');
% Show image
imshow(imagen);
% 
% title('INPUT IMAGE')
% pause(1.0)
% % ----------------------Cropping the image to select region of interest----
% [imagen, rect] = imcrop(imagen);
% imshow(imagen);
% title('Cropped IMAGE ')
% % ----------------------Convert to gray scale------------------------------
% if size(imagen,3)==3 %RGB image
%     imagen=rgb2gray(imagen);
% end
% % ----------------------Convert to BW--------------------------------------
% threshold = graythresh(imagen);
% imagen =~im2bw(imagen,threshold);
% % NEXT LINE MY CODE
% imshow(imagen);
% % NEXT CHUNK OF CODE IN MY CODE
% imshow(imagen)
% % ---------------------Invert the image color from back to white-----------
% %----------------------Disable for number plates-------------------------
% imagen = ~imagen;
% imagen = 1-imagen;
% imagen = (imagen == 0);
% %---------------------Code to Resize to 24*42--------------------------
b= imresize(imagen,[294 168]);
% Show image
figure
imshow(b);
% ---------------------to save image--------------------------------------
figure
imhist(b)
imwrite (b, 'C:\projects\MyGui\A2.bmp');