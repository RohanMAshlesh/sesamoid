function varargout = MyGui(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MyGui_OpeningFcn, ...
                   'gui_OutputFcn',  @MyGui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
% --- Executes just before MyGui is made visible.
function MyGui_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes MyGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%--------------------------------------------------------------------------------------------------------------------------------------------------
%--------------------------------------------------------------------------------------------------------------------------------------------------
function varargout = MyGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%--------------------------------------------------------------------------------------------------------------------------------------------------
%--------------------------------------------------------------------------------------------------------------------------------------------------
% % % Function Names                  Image input      image used for computation          image out put
% % % exit fn                         -                       -                               -
% % % load fn                         imagen0        imagen0                                imagen0
% % % 
% % % crop fn                         imagen0        imagen0                                imagen0
% % % 
% % % rotate fn                       imagen0        imagen0                                imagen0
% % % 
% % % save org imagen_0               imagen0        imagen1=imagen0;imagen2=imagen1        imagen2
% % % 
% % % grey2 black& White              imagen2        imagen3                                imagen3
% % % 
% % % noise removal                   imagen3        imagen4                                imagen5
% % % 
% % % extract OCR                     imagen5        imagen5



% --- Exit button button5
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 
cla(handles.axes1,'reset');
cla(handles.axes2,'reset');
cla(handles.axes3,'reset');
clear
clear all
clc
close(gcbf)

%--------------------------------------------------------------------------------------------------------------------------------------------------


% --- load image over IP CAMERA   Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
global imagen0 imagen1 imagen2 imagen3 imagen4 imagen5 ss

%RESETING THE IMAGE DURING LOADING AND RELOADING
imagen0=[];
imagen1=[];
imagen2=[];
imagen3=[];
imagen4=[];
imagen5=[];
set(handles.sliderNum,'value',0);
set(handles.imadjust_Slider,'value',0);

set(handles.slider2,'value',0.5);
set(handles.textNum,'string',0);%set sliderNum
set(handles.text5,'string',0.5);%set slider2
     cla(handles.axes1,'reset');
     cla(handles.axes3,'reset');
     cla(handles.axes2,'reset');
     
     
    % LOADING THE IMAGE over        IP camera
    connector on newpass
    url = 'http://192.168.43.70:8080/photoaf.jpg';
    ss  = imread(url);
    fh = image(ss);
    ss  = imread(url);
    set(fh,'CData',ss);
    imagen0=ss;

%     if isempty(imagen0)
%      errordlg('Image not Loaded. Please check the network connection or load in the normal mode','Error');
%     else
    title('Loaded IMAGE Using IP camera');  
    axes(handles.axes1)
    imshow(imagen0)
    imagen1=imagen0;
    cla(handles.axes3,'reset');
    cla(handles.axes2,'reset');
%     end
%--------------------------------------------------------------------------------------------------------------------------------------------------

% ---loads image button1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imagen0 imagen1 imagen2 imagen3 imagen4 imagen5

%RESETING THE IMAGE DURING LOADING AND RELOADING
imagen0=[];
imagen1=[];
imagen2=[];
imagen3=[];
imagen4=[];
imagen5=[];
set(handles.sliderNum,'value',0);
set(handles.imadjust_Slider,'value',0);

set(handles.slider2,'value',0.5);
set(handles.textNum,'string',0);%set sliderNum
set(handles.text5,'string',0.5);%set slider2
     cla(handles.axes1,'reset');
    
     cla(handles.axes3,'reset');
       cla(handles.axes2,'reset');
     
     % LOADING THE IMAGE by browzing system
    [filename,pathname]=uigetfile({'*.jpg';'*.png';'*.bmp';'.gif';'.giff'},'File Selector');
    img_path=strcat(pathname,filename);
    imagen0=imread(img_path);
    title('Loaded IMAGE');  
    axes(handles.axes1)
    imshow(imagen0)
    cla(handles.axes3,'reset');
    cla(handles.axes2,'reset');
    imagen1=imagen0;
%--------------------------------------------------------------------------------------------------------------------------------------------------
%--------------------------------------------------------------------------------------------------------------------------------------------------

% --- Reset button button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imagen0 imagen1 imagen2 imagen3 imagen4 imagen5
imagen0=[];
imagen1=[];
imagen2=[];
imagen3=[];
imagen4=[];
imagen5=[];
set(handles.sliderNum,'value',0);
set(handles.slider2,'value',0.5);
set(handles.textNum,'string',0);%set sliderNum
set(handles.text5,'string',0.5);%set slider2
     cla(handles.axes1,'reset');
     cla(handles.axes2,'reset');
     cla(handles.axes3,'reset');
%--------------------------------------------------------------------------------------------------------------------------------------------------
%--------------------------------------------------------------------------------------------------------------------------------------------------


% --- crop image button2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imagen0 
 if isempty(imagen0)
     errordlg('Image not Loaded. Please click on the Load Image Button','Error');
 else
    title('IMAGE for CROPPING');
    axes(handles.axes1)
    imshow(imagen0);
    cla(handles.axes3,'reset');
    cla(handles.axes2,'reset'); 
    [imagen0, rect] = imcrop(imagen0);
    title('Cropped IMAGE');
    axes(handles.axes1)
    imshow(imagen0);
    cla(handles.axes3,'reset');
    cla(handles.axes2,'reset'); 
    
   
 end
 
%--------------------------------------------------------------------------------------------------------------------------------------------------
%--------------------------------------------------------------------------------------------------------------------------------------------------


% --- rotate anticlock wisse 90 pushbutton6.
 function pushbutton6_Callback(hObject, eventdata, handles)
 global imagen0
       if isempty(imagen0)
           errordlg('Image not Loaded. Please click on the Load Image Button','Error');
       else
           imagen0=imrotate(imagen0,(90),'bilinear');
           axes(handles.axes1)
           imshow(imagen0);
            cla(handles.axes3,'reset');
            cla(handles.axes2,'reset'); 
       end
            % --- clock wise rotate 90 pushbutton8.
            function pushbutton8_Callback(hObject, eventdata, handles)
            global imagen0
               if isempty(imagen0)
           errordlg('Image not Loaded. Please click on the Load Image Button','Error');
       else
                    imagen0=imrotate(imagen0,(-90),'bilinear');
                    axes(handles.axes1)
                    imshow(imagen0);
                     cla(handles.axes3,'reset');
                     cla(handles.axes2,'reset'); 
               end             
            % --- rotate anticlock wisse 10  pushbutton9.
            function pushbutton9_Callback(hObject, eventdata, handles)
            global imagen0
               if isempty(imagen0)
           errordlg('Image not Loaded. Please click on the Load Image Button','Error');
       else
                    imagen0=imrotate(imagen0,(2),'bilinear');
                    axes(handles.axes1)
                    imshow(imagen0);
                    cla(handles.axes3,'reset');
                     cla(handles.axes2,'reset');
               end
            % --- clock wise rotation 10 pushbutton10.
            function pushbutton10_Callback(hObject, eventdata, handles)
            global imagen0
               if isempty(imagen0)
           errordlg('Image not Loaded. Please click on the Load Image Button','Error');
       else
                    imagen0=imrotate(imagen0,(-2),'bilinear');
                    axes(handles.axes1)
                    imshow(imagen0);
                    cla(handles.axes3,'reset');
                     cla(handles.axes2,'reset');
               end
%-----------------------------------------------------------------------------------------------------------------------------------------------------------
%--------------------------------------------------------------------------------------------------------------------------------------------------



% --- to Reload: save org cropped and rot image and reappear,  press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
global imagen0 imagen1 imagen2 imagen3 imagen4 imagen5
imagen2=imagen1;%set 1 as default, 0 is cropped img
% imagen2=[];%set 2(empty)
imagen3=[];%set 3 empty
imagen4=[];%set4 all functions image as default(empty) 
imagen5=[];%set ocr as empty
   if isempty(imagen0)
           errordlg('Image not Loaded. Please click on the Load Image Button','Error');
   else 
       imagen1=[];
    imagen2=[];
    imagen3=[];
    imagen4=[];
    imagen5=[];
    set(handles.sliderNum,'value',0);
   
    set(handles. imadjust_Slider,'value',0.07);
    set(handles.slider2,'value',0.5);
    set(handles.textNum,'string',0);%set sliderNum
    set(handles.text5,'string',0.5);%set slider2
     cla(handles.axes1,'reset');
     cla(handles.axes2,'reset');
     cla(handles.axes3,'reset');
        title('IMAGE');   
        axes(handles.axes1)
        imshow(imagen0);
        cla(handles.axes3,'reset');
        cla(handles.axes2,'reset');
        
       
   end
%--------------------------------------------------------------------------------------------------------------------------------------------------
%--------------------------------------------------------------------------------------------------------------------------------------------------

% --- grey scale conversion slider movement.
function imadjust_Slider_Callback(hObject, eventdata, handles)

global imagen0 imagen1 imagen2 set_invert
imagen1=imagen0;
imagen2=imagen1;

if isempty(imagen1)
    errordlg('Image not Loaded. Please click on the Load Image Button','Error');
else 
    if size(imagen2,3)==3
        imagen2=rgb2gray(imagen2);
        axes(handles.axes1)
        imshow(imagen2)
        title ('GREY IMAGE');
        % FOR REFERENCE FOR IMAGE
        axes(handles.axes2)
        imshow(imagen0)
        cla(handles.axes3,'reset');
        
        title ('CROPPED IMAGE FOR REFERENCE');
        a=get(hObject,'Value');
        imagen2=imadjust(imagen2,[a,1],[]);
        axes(handles.axes1)
        imshow(imagen2)
        title ('GREY IMAGE');
        cla(handles.axes3,'reset');
        
        set(handles.text8,'String',num2str(a));
    end
end


% --- Executes during object creation, after setting all properties.
function imadjust_Slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%--------------------------------------------------------------------------------------------------------------------------------------------------
%--------------------------------------------------------------------------------------------------------------------------------------------------

% --- for threshold to black &white  image  on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'Value') returns position of slider get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global imagen0 imagen1 imagen2 imagen3  Thresh2BW radval      
Thresh2BW = get(hObject,'Value'); % fetch value of slider for bw thresh  

     
if isempty(imagen0)
    errordlg('Image not Loaded. Please click on the Load Image Button','Error');
else
    if isempty(imagen2)
         errordlg('Please convert the image to GREY scale image, Click on the Grey scale scroll bar','Error');
    else
            imagen3 = imagen2;
            % ----------------------Convert to BW--------------------------------------
            %threshold = graythresh(imagen); automatic threshhold calculator
            imagen3 =~im2bw(imagen3,Thresh2BW);
            %---inver the bw image-----
          
            if radval == 1  % executed only if radio button is set and used only for a chassis and engine number 
                 imagen3 = ~imagen3;
                 imagen3 = 1-imagen3;
                 imagen3 = (imagen3 == 0);
            end
            axes(handles.axes1)
            imshow(imagen3);
            title('B/W converted image (binary image)');
            cla(handles.axes3,'reset');
            %% Label connected components
            [L Ne]=bwlabel(imagen3);
            %% Measure properties of image regions
            propied=regionprops(L,'BoundingBox');
            hold on
            %% Plot Bounding Box
            for n=1:size(propied,1)
                rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
            end
            hold off
            % to display the valuse of slider in textNum static text ...
             set(handles.text5,'String',num2str(Thresh2BW));
     
    end    
end
   
% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

%--------------------------------------------------------------------------------------------------------------------------------------------------
%--------------------------------------------------------------------------------------------------------------------------------------------------

% --- slider to fetch the threshold for noise removal slider movement.
function sliderNum_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
 global  imagen0 imagen2 imagen3 imagen4 imagen5
 imagen4 = imagen3; 
        
if isempty(imagen0)
    errordlg('Image not Loaded. Please click on the Load Image Button','Error');
else
    if isempty(imagen2)
         errordlg('Please convert the image to GREY scale image, Click on the Grey scale scroll bar','Error');
    else 
                 if isempty(imagen4)
                           errordlg('Please convert the image to B/W, Click on the B/W scroll bar','Error');
                       else
                             Thresh_Noise = get(hObject,'Value');
                             Thresh_Noise= floor( Thresh_Noise);

                             assignin('base','float_Thresh_N',Thresh_Noise);
                             % to display the valuse of slider in textNum static text ...
                             set(handles.textNum,'String',num2str(Thresh_Noise));

                            % Thresh_N = typecast(float_Thresh_Noise =Thresh_Noise;

                            imagen4 = bwareaopen(imagen4,Thresh_Noise);
                            axes(handles.axes1)
                            imshow(imagen4);
                            title('NOISE FREE IMAGE');
                        %% Label connected components
                            [L Ne]=bwlabel(imagen4);
                        %% Measure properties of image regions
                            propied=regionprops(L,'BoundingBox');
                            hold on
                        %% Plot Bounding Box
                            for n=1:size(propied,1)
                                rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
                            end
                            hold off
                            imagen5=imagen4; % settig imagen5 to be used by OCR
                 end
        end
end
        

% do not disturb below function  
% create function for slidet to get threshold for noise removal.
% --- Executes during object creation, after setting all properties.
function sliderNum_CreateFcn(hObject, eventdata, handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
    
end

%-----------------------------------------------------------------------------------------------------------------------------------------------------------
%--------------------------------------------------------------------------------------------------------------------------------------------------


% --- Extract the char using OCR pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
global imagen0 imagen2 imagen4 imagen5 templates_file
load templates_file
if isempty(imagen0)
    errordlg('Image not Loaded. Please click on the Load Image Button','Error');
else
    if isempty(imagen2)
         errordlg('Please convert the image to GREY scale image, Click on the Grey scale scroll bar','Error');
    else 
                 if isempty(imagen4)
                           errordlg('Please convert the image to B/W, Click on the B/W scroll bar','Error');
                       else
                                    if isempty(imagen5)
                                               errordlg('Please Perform Noise removal, Click on the Noise removal scroll bar','Error');
                                           else

                                                re=imagen5;
                                                word=[ ];
                                                %---------------------Opens text.txt as file for write---------------------
%                                           here      fid = fopen('text.txt', 'wt');
                                                % Compute the number of letters in template file
                                                num_letras=size(templates_file,2);

                                                while 1
                                                    %Fcn 'lines' separate lines in text
                                                    [fl re]=lines(re);
                                                    imgn=fl;
                                                    %Uncomment line below to see lines one by one
                                                    axes(handles.axes2)
                                                    imshow(fl);
                                    %               pause(0.1)    
                                                    %-----------------------------------------------------------------     
                                                    % Label and count connected components
                                                    [L Ne] = bwlabel(imgn);    
                                                    for n=1:Ne
                                                        [r,c] = find(L==n);
                                                        % Extract letter
                                                        n1=imgn(min(r):max(r),min(c):max(c));  
                                                        % Resize letter (same size of template)
                                                        img_r=imresize(n1,[ 168 294]);
                                                        %Uncomment line below to see letters one by one
                                                        axes(handles.axes3)
                                                        imshow(img_r);
                                                        %NEEDED IF
                                                        %GENERATING TEMP
                                                        %count = 1;
                                                            if 	n==1	
                                                                imwrite (img_r, 'C:\projects\refbmp\new1.bmp'); 
                                                        elseif 	n==2	
                                                            imwrite (img_r, 'C:\projects\refbmp\new2.bmp');
                                                        elseif 	n==3	
                                                            imwrite (img_r, 'C:\projects\refbmp\new3.bmp');
                                                        elseif 	n==4	
                                                            imwrite (img_r, 'C:\projects\refbmp\new4.bmp');
                                                        elseif 	n==5	
                                                            imwrite (img_r, 'C:\projects\refbmp\new5.bmp');
                                                        elseif 	n==6	
                                                            imwrite (img_r, 'C:\projects\refbmp\new6.bmp');
                                                        elseif 	n==7	
                                                            imwrite (img_r, 'C:\projects\refbmp\new7.bmp');
                                                        elseif 	n==8	
                                                            imwrite (img_r, 'C:\projects\refbmp\new8.bmp');
                                                        elseif 	n==9	
                                                            imwrite (img_r, 'C:\projects\refbmp\new9.bmp');
                                                        elseif 	n==10	
                                                            imwrite (img_r, 'C:\projects\refbmp\new10.bmp');
                                                        elseif 	n==11	
                                                            imwrite (img_r, 'C:\projects\refbmp\new11.bmp');
                                                        elseif 	n==12	
                                                            imwrite (img_r, 'C:\projects\refbmp\new12.bmp');
                                                        elseif 	n==13	
                                                            imwrite (img_r, 'C:\projects\refbmp\new13.bmp');
                                                        elseif 	n==14	
                                                            imwrite (img_r, 'C:\projects\refbmp\new14.bmp');
                                                        elseif 	n==15	
                                                            imwrite (img_r, 'C:\projects\refbmp\new15.bmp');
                                                        elseif 	n==16	
                                                            imwrite (img_r, 'C:\projects\refbmp\new16.bmp');
                                                        elseif 	n==17	
                                                            imwrite (img_r, 'C:\projects\refbmp\new17.bmp');
                                                        elseif 	n==18	
                                                            imwrite (img_r, 'C:\projects\refbmp\new18.bmp');
                                                        elseif 	n==19	
                                                            imwrite (img_r, 'C:\projects\refbmp\new19.bmp');
                                                          else 	n==20	
                                                              imwrite (img_r, 'C:\projects\refbmp\new20.bmp');
                                                            end
                                                        %imwrite (img_r, 'C:\projects\refbmp\A20.bmp');
                                    %                   pause(0.1)
                                                        %-------------------------------------------------------------------
                                                        % Call fcn to convert image to text
                                                        letter=read_letter(img_r,num_letras);
                                                        % Letter concatenation
                                                        word=[word letter];
                                                    end
                                                    %fprintf(fid,'%s\n',lower(word));%Write 'word' in text file (lower)
%                                              here       fprintf(fid,'%s\n','extractedTheBones');%Write 'word' in text file (upper)
                                                    % Clear 'word' variable
                                                 % here   word=[ ];
                                                    %*When the sentences finish, breaks the loop
                                                    if isempty(re)  %See variable 're' in Fcn 'lines'
                                                        break
                                                    end    
                                                end
%                                 here                fclose(fid);
                                                %Open 'text.txt' file
                                   %here             winopen('text.txt')
                                                %imshow(realimg);
                                                %clear all
                                    end
                                    
                 end
    end
end

%  dos('start http://127.0.0.1/Vehicle_Regestration_Server/');
%%-----------------------------------------------------------------------------------------------------------------------------------------------------------
%--------------------------------------------------------------------------------------------------------------------------------------------------

% --- Executes during object deletion, before destroying properties.
function sliderNum_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to sliderNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------


% --- RADIO button press TO selected if the image is a chassis or a engine
% number  in radiobutton5. || not to be selected for number plate or light
% color engine numbers
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
global radval;
radval = get(hObject,'Value');


% --------------------------------------------------------------------


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear
clear all
clc
close(gcbf)
