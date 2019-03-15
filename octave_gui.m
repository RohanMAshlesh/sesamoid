function octave_gui
    global templates_file = load('templates_file')
   pkg load image
    t_bw = 0.4745099; %0.4745099; %0.42 %0.4745099; %0.215; %0.25;
    t_gry = 0.087; %0.087; 0.15;
    t_Noise = 500; %500;
    t_pause = 0.1;

    img_org = imread('images/2f.jpg');
    imshow(img_org);  title('original image');  pause(t_pause);

    %%Check and convert to grey
    if ndims(img_org) == 3
      img = rgb2gray(img_org);
    %print("Image not in grayscale, converting.");
    else
      img = img_org;
    end

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
    img = bwareaopen(img,t_Noise);
    imshow(img);
    getme = img;
    %title('Noise free BW img');
    pause(t_pause);

    imshow(img)
    title('Later ....');
    comp_props = regionprops(img);

    bbs = cat(1, comp_props.BoundingBox);
    hold on
    for i = 1:size(bbs, 1)
      rectangle('Position', bbs(i,:), 'EdgeColor', 'g', 'LineWidth',2);
    end
    %plot(centroids(:,1),centroids(:,2), 'b*')
    hold off

    title('now ....');
    pause(3);
    %% Lets go
    %% heres the magic
    re = img;

    while 1
        if isempty(re)
            break
        end
        [fl, re] = lines(re);
        if isempty(fl)
            break
        end
        imgn=fl;
        imshow(fl);
        % Label and count connected components
        [L, Ne] = bwlabel(imgn);
        for n = 1 : Ne
            [r,c] = find(L==n);
            % Extract letter
            n1=imgn(min(r):max(r),min(c):max(c));

            % Resize letter (same size of template)
            imshow(n1);
            title(sprintf('%d %d %d', size(n1)));
            img_r=imresize(n1,[80 98]);
            % pause(5);
            %Uncomment line below to see letters one by one
            imshow(img_r);
            title('after resize');
            % pause(5);
            num_letras=size(templates_file,2);
            letter=read_letter(img_r,num_letras);
            disp(letter);


            %NEEDED IF
            %GENERATING TEMP
            %count = 1;
            % if n==1
            %     imwrite (img_r, 'rawData/new1.bmp');
            % elseif   n==2
            %     imwrite (img_r, 'rawData/new2.bmp');
            % elseif   n==3
            %     imwrite (img_r, 'rawData/new3.bmp');
            % elseif   n==4
            %     imwrite (img_r, 'rawData/new4.bmp');
            % elseif   n==5
            %     imwrite (img_r, 'rawData/new5.bmp');
            % elseif   n==6
            %     imwrite (img_r, 'rawData/new6.bmp');
            % elseif   n==7
            %     imwrite (img_r, 'rawData/new7.bmp');
            % elseif   n==8
            %     imwrite (img_r, 'rawData/new8.bmp');
            % elseif   n==9
            %     imwrite (img_r, 'rawData/new9.bmp');
            % elseif   n==10
            %     imwrite (img_r, 'rawData/new10.bmp');
            % elseif   n==11
            %     imwrite (img_r, 'rawData/new11.bmp');
            % elseif   n==12
            %     imwrite (img_r, 'rawData/new12.bmp');
            % elseif   n==13
            %     imwrite (img_r, 'rawData/new13.bmp');
            % elseif   n==14
            %     imwrite (img_r, 'rawData/new14.bmp');
            % elseif   n==15
            %     imwrite (img_r, 'rawData/new15.bmp');
            % elseif   n==16
            %     imwrite (img_r, 'rawData/new16.bmp');
            % elseif   n==17
            %     imwrite (img_r, 'rawData/new17.bmp');
            % elseif   n==18
            %     imwrite (img_r, 'rawData/new18.bmp');
            % elseif   n==19
            %     imwrite (img_r, 'rawData/new19.bmp');
            % elseif   n==20
            %     imwrite (img_r, 'rawData/new20.bmp');
            % end
        end
    end

    % imshow(getme);
end

% octave_gui()
