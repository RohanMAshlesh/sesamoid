function letter=read_letter(imagn,num_letras)
% Computes the correlation between template and input image
% and its output is a string containing the letter.
% Size of 'imagn' must be 294 x 168 pixels
% Example:
% imagn=imread('D.bmp');
% letter=read_letter(imagn)
global templates_file
comp=[ ];
for n=1:num_letras
    sem=corr2(templates_file{1,n},imagn);
    comp=[comp sem];
end
vd=find(comp==max(comp));
%*-*-*-*-*-*-*-*-*-*-*-*-*-
    if 	vd==1	letter='A';
elseif 	vd==2	letter='B';
elseif 	vd==3	letter='C';
elseif 	vd==4	letter='D';

elseif 	vd==5	letter='n';
elseif 	vd==6	letter='n';
elseif 	vd==7	letter='n';
elseif 	vd==8	letter='n';
elseif 	vd==9	letter='n';
elseif 	vd==10	letter='n';
elseif 	vd==11	letter='n';
elseif 	vd==12	letter='n';
elseif 	vd==13	letter='n';
elseif 	vd==14	letter='n';
elseif 	vd==15	letter='n';
elseif 	vd==16	letter='n';
elseif 	vd==17	letter='n';
elseif 	vd==18	letter='n';
elseif 	vd==19	letter='n';
elseif 	vd==20	letter='n';
elseif 	vd==21	letter='n';
elseif 	vd==22	letter='n';
elseif 	vd==23	letter='n';
elseif 	vd==24	letter='n';
elseif 	vd==25	letter='n';
elseif 	vd==26	letter='n';
elseif 	vd==27	letter='n';
elseif 	vd==18	letter='n';
elseif 	vd==19	letter='n';
elseif 	vd==30	letter='n';
elseif 	vd==31	letter='n';
elseif 	vd==32	letter='n';
elseif 	vd==33	letter='n';
elseif 	vd==34	letter='n';
elseif 	vd==35	letter='n';
elseif 	vd==36	letter='n';
elseif 	vd==37	letter='n';
elseif 	vd==38	letter='n';
elseif 	vd==39	letter='n';
elseif 	vd==40	letter='n';
elseif 	vd==41	letter='n';
elseif 	vd==42	letter='n';
elseif 	vd==43	letter='n';
elseif 	vd==44	letter='n';
elseif 	vd==45	letter='n';
elseif 	vd==46	letter='n';
elseif 	vd==47	letter='n';
elseif 	vd==48	letter='n';
elseif 	vd==49	letter='n';
elseif 	vd==50	letter='n';
elseif 	vd==51	letter='n';
elseif 	vd==52	letter='n';
elseif 	vd==53	letter='n';
elseif 	vd==54	letter='n';
elseif 	vd==55	letter='n';
elseif 	vd==56	letter='n';
elseif 	vd==57	letter='n';



    % default,,,,,,,,,,,,,,,,,,,,,,,,,,
else
    letter='i';    % if not found
end

