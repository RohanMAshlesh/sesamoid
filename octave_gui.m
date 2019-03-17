function octave_gui
    load templates_file;
    pkg load image
    t_bw = 0.44; %0.4745099; %0.42 %0.4745099; %0.215; %0.25;
    t_gry = 0.09; %0.087; 0.15;
    t_Noise = 80; %500;
    t_pause = 0.6;

    img_org = imread('images/5.jpg');
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
    pause(6);
    %% Lets go
    %% heres the magic
    re = img;
    output = '';
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
            img_r=imresize(n1,[80 98], 'nearest');
            % pause(0.4);
            %Uncomment line below to see letters one by one
            imshow(img_r);
            title('after resize');
            % pause(0.4);
            num_letras=columns(templates_file);
            letter=read_letter(img_r,num_letras);


            if any('A':'K' == letter)
              output = strcat(output, 'Found sesamoid bone.\n');
            else
              output = strcat(output, 'Sesamoid bone not present.\n');
            end

            %NEEDED IF
            %GENERATING TEMP
            %count = 1;
            % imwrite (img_r, sprintf('rawData/new%d.bmp', n));
        end

        % disp(letter);

    end
        printf(output);
            o_f = fopen('output.txt', 'w');
            fprintf(o_f, output);
            fclose(o_f);
    imshow(getme);
end

% octave_gui()
