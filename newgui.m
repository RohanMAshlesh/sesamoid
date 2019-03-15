pkg load image

function myplot
  t_bw = 0.4745099;
  t_gry = 0.08;
  t_dnse = 10;
  
  img_org = imread('images/1.jpg');
  imshow(img_org);  title('original imgage');  pause(2);
  
  %%Check and convert to grey
  if ndims(img_org) == 3
    img = rgb2gray(img_org);
    %print("Image not in grayscale, converting.");
  else
    img = img_org;
  endif
  
  imshow(img);  title('grey only img');  pause(2);
  imwrite(img, "grey_only_img.jpg");
  %%Enhance the brightness
  img=imadjust(img,[t_gry,1],[]);
  imwrite(img, "grey_enhanced_img.jpg");
  imshow(img);
  title('grey enhanced img');
  pause(2);
  
  %%To BW
  img = im2bw(img, t_bw); 
  imwrite(img, "BW_imadjust.jpg");
  imshow(img);
  title('BW imadjust');
  pause(2);
  
  img = bwareaopen(img, t_dnse);
  comp_props = regionprops(img);
  bbs = cat(1, comp_props.BoundingBox);
  centroids = cat(1, comp_props.Centroid);
  imwrite(img, "bbs.jpg");  
  imshow(img)
  title('grey img with bbs');
  hold on
  for i = 1:rows(bbs)
    rectangle('Position', bbs(i,:), 'EdgeColor', 'g', 'LineWidth',1);
  endfor
  %plot(centroids(:,1),centroids(:,2), 'b*') 
  hold off  
  pause(2);
  
  

  
  
end

myplot()