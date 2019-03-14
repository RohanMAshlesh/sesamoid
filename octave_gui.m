pkg load image

function myplot
  t_bw = 0.4745099;
  t_gry = 0.1;
  t_Noise = 1500;
  t_pause = 0.51;
  
  img_org = imread("images/1.jpg");
  imshow(img_org);  title('original imgage');  pause(t_pause);
  
  %%Check and convert to grey
  if ndims(img_org) == 3
    img = rgb2gray(img_org);
    %print("Image not in grayscale, converting.");
  else
    img = img_org;
  endif
  
  imshow(img);  title('grey only img');  pause(t_pause);
  
  %%Enhance the brightness
  img=imadjust(img,[t_gry,1],[]);
  imshow(img);
  title('grey enhanced img');
  pause(t_pause);
  
  %%To BW
  img = im2bw(img, t_bw); 
  imshow(img);
  title('BW img');
  pause(t_pause);
  
  %%Noise removal
  bwareaopen(img,t_Noise);
  imshow(img);
  %title('Noise free BW img');
  pause(t_pause);
  
  %% Label connected components
  [L Ne]=bwlabel(img);
  %% Measure properties of image regions
  propied=regionprops(L,'BoundingBox');
  hold on
  %% Plot Bounding Box
  for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
  end
  hold off
  img=img;
  imshow(img)
  title('Later ....');
  
  
end

myplot()