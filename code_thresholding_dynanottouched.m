% Lucas Sancéré, beginning 04/03/2019 AN, work on it, - 05/03 AN - 06/03 AN
% - 07/03 AN - 11/03 AN - 13/03 AN - 15/03 AN - 20/03 AN 
% - 
%(explanations of why I started late in file called "PFE")
% Code for cell pictures and movies analysis, using classical image
% processing, thresholding and pre/post-processing
% First goal: quantifiation of the degradation of gelatine induced by HUVEC
% cells without CCM complex


%% Loading images


close all 
clear



%Display image and histogram 

E1=imread('image test 1 (22).jpg');
Gray_value_E1=E1; %because E1 will be change and we need original E1 later

%[MULTIPE]
E2=imread('image test 2 (22).jpg');
Gray_value_E2=E2;
E3=imread('image test 3 (22).jpg');
Gray_value_E3=E3;
% E4=imread()
% Gray_value_E4=E4;
% E5=imread()
% Gray_value_E5=E5;
% E6=imread()
% Gray_value_E6=E6;
% E7=imread()
% Gray_value_E7=E7;
% E8=imread()
% Gray_value_E8=E8;
% E9=imread()
% Gray_value_E9=E9;
% E10=imread()
% Gray_value_E10=E10;

figure, imshow(E1), title('Original image 1')
figure, imhist(E1), axis tight; title('Original image 1 histogram')

%[MULTIPE]
figure, imshow(E2), title('Original image 2')
figure, imhist(E2), axis tight; title('Original image 2 histogram')
figure, imshow(E3), title('Original image 3')
figure, imhist(E3), axis tight; title('Original image 3 histogram')
%figure, imshow(E4), title('Original image 4')
% figure, imhist(E4), axis tight; title('Original image 4 histogram')
% figure, imshow(E5), title('Original image 5')
% figure, imhist(E5), axis tight; title('Original image 5 histogram')
% figure, imshow(E6), title('Original image 6')
% figure, imhist(E6), axis tight; title('Original image 6 histogram')
% figure, imshow(E7), title('Original image 7')
% figure, imhist(E7), axis tight; title('Original image 7 histogram')
% figure, imshow(E8), title('Original image 8')
% figure, imhist(E8), axis tight; title('Original image 8 histogram')
% figure, imshow(E9), title('Original image 9')
% figure, imhist(E9), axis tight; title('Original image 9 histogram')
% figure, imshow(E9), title('Original image 10')
% figure, imhist(E9), axis tight; title('Original image 10 histogram')


% figure, imshow(F), title('Cell')



%% Pre-processing: Histogram modifications, Noise removing 


% Histogram modifications

%Imadjust function:  stretches the histogram from values 0 to 255 

E1=imadjust(E1);
figure, imshow(E1); title('image adjust 1')
%%%% figure, imhist(E1), axis tight; title('image adjust histogram 1')

%[MULTIPE]
E2=imadjust(E2);
 figure, imshow(E2); title('image adjust 2')
% figure, imhist(E2), axis tight; title('image adjust histogram 2')
E3=imadjust(E3);
figure, imshow(E3); title('image adjust 3')
% figure, imhist(E3), axis tight; title('image adjust histogram 3')
% E4=imadjust(E4);
% figure, imshow(E4); title('image adjust 4')
% figure, imhist(E4), axis tight; title('image adjust histogram 4')
% E5=imadjust(E5);
% figure, imshow(E5); title('image adjust 5')
% figure, imhist(E5), axis tight; title('image adjust histogram 5')
% E6=imadjust(E6);
% figure, imshow(E6); title('image adjust 6')
% figure, imhist(E6), axis tight; title('image adjust histogram 6')
% E7=imadjust(E7);
% figure, imshow(E7); title('image adjust 7')
% figure, imhist(E7), axis tight; title('image adjust histogram 7')
% E8=imadjust(E8);
% figure, imshow(E8); title('image adjust 8')
% figure, imhist(E8), axis tight; title('image adjust histogram 8')
% E9=imadjust(E9);
% figure, imshow(E9); title('image adjust 9')
% figure, imhist(E9), axis tight; title('image adjust histogram 9')
% E10=imadjust(E10);
% figure, imshow(E10); title('image adjust 10')
% figure, imhist(E10), axis tight; title('image adjust histogram 10')

%Histeq function: another possibility for histogram modifications
% HI=histeq(E);
% figure, imshow(HI); title('image test 1 (22)equal')
% figure, imhist(HI), axis tight; title('image test 1 (22)equal histogram')


% Noise removing

% Remove Salt and pepper noise with medfilt2()with 3x3 neighborhood (more
% nxn is elevated (exemple [5 5] more the noise is removed but the image is blurred)
E1 = medfilt2(E1,[3 3]);
figure, imshow(E1); title('3*3 Neighborhood 1');

%[MULTIPE]
E2 = medfilt2(E2,[3 3]);
E2avantverif = E2;
figure, imshow(E2); title('3*3 Neighborhood 2');
E3 = medfilt2(E3,[3 3]);
figure, imshow(E3); title('3*3 Neighborhood 3');
% E4 = medfilt2(E4,[3 3]);
% figure, imshow(E4); title('3*3 Neighborhood 4');
% E5 = medfilt2(E5,[3 3]);
% figure, imshow(E5); title('3*3 Neighborhood 5');
% E6 = medfilt2(E6,[3 3]);
% figure, imshow(E6); title('3*3 Neighborhood 6');
% E7 = medfilt2(E7,[3 3]);
% figure, imshow(E7); title('3*3 Neighborhood 7');
% E8 = medfilt2(E8,[3 3]);
% figure, imshow(E8); title('3*3 Neighborhood 8');
% E9 = medfilt2(E9,[3 3]);
% figure, imshow(E9); title('3*3 Neighborhood 9');
% E10 = medfilt2(E10,[3 3]);
% figure, imshow(E10); title('3*3 Neighborhood 10');

% Didn't try: adaptative filter. But love the previous easy one so...



% Center images in the same point
% idea shift images until reach a maximum of similitude ISEQUAL and J = imtranslate(I,[15, 25]);

% % imshowpair(E1, E2,'Scaling','joint');
% [optimizer, metric]  = imregconfig('multimodal');
% % metric = registration.metric.MeanSquares;
% % optimizer = registration.optimizer.RegularStepGradientDescent;
% E2new = imregister(E2,E1,'translation',optimizer, metric);
% % trans2 = imregtform(E2,E1,'translation', optimizer, metric)
% % imregister, first argument: image we want to move, second argument, fixed image
% figure, imshow(E2), title ('Image 2 centered') 
% 
% %[MULTIPE]
% E3 = imregister(E3,E1,'translation',optimizer, metric);
% figure, imshow(E3)
% E4 = imregister(E4,E1,'translation',optimizer, metric);
% figure, imshow(E4)
% E5 = imregister(E5,E1,'translation',optimizer, metric);
% figure, imshow(E5)
% E6 = imregister(E6,E1,'translation',optimizer, metric);
% figure, imshow(E6)
% E7 = imregister(E7,E1,'translation',optimizer, metric);
% figure, imshow(E7)
% E8 = imregister(E8,E1,'translation',optimizer, metric);
% figure, imshow(E8)
% E9 = imregister(E9,E1,'translation',optimizer, metric);
% figure, imshow(E9)
% E10 = imregister(E10,E1,'translation',optimizer, metric);
% figure, imshow(E10)



%% Thresholding 


% **** Threshold choice ****

% issues for finding the best threshold


f = msgbox({'By default the threshold is set at 20% of the 256 grey values';'If you want to change it, you can write the threshod you want line X'},'Threshold');
% prompt = {'Tentative A'};
% title = 'Tentative B';
% dims = [1 100];
% definput = {'0.2'};
% input1 = inputdlg(prompt,title,dims,definput);
% input1 = str2num(input1{1});


Th_old = 0.2; 


  
% **** Threshold the degradation areas and conversion into a binary image ****



E1=imbinarize(E1,Th_old);
figure, imshow (E1); title('Image 1 after thresholding');

%[MULTIPLE]
E2=imbinarize(E2,Th_old);
figure, imshow (E2); title('Image 2 after thresholding');
E3=imbinarize(E3,Th_old);
figure, imshow (E3); title('Image 3 after thresholding')
% E4=imbinarize(E4,Th_old);
% figure, imshow (E4); title('Image 4 after thresholding')
% E5=imbinarize(E5,Th_old);
% figure, imshow (E5); title('Image 5 after thresholding')
% E6=imbinarize(E6,Th_old);
% figure, imshow (E6); title('Image 6 after thresholding')
% E7=imbinarize(E7,Th_old);
% figure, imshow (E7); title('Image 7 after thresholding')
% E8=imbinarize(E8,Th_old);
% figure, imshow (E8); title('Image 8 after thresholding')
% E9=imbinarize(E9,Th_old);
% figure, imshow (E9); title('Image 9 after thresholding')
% E10=imbinarize(E10,Th_old);
% figure, imshow (E10); title('Image 10 after thresholding')
 
 

%% Post-processing




% **** Improvement of the segmented image: remove of small objects ****


[M,N] = size(E1);
for i=1:M
   for j=1:N
    if E1(i,j)==1
     E1(i,j)=0;
    else
      E1(i,j)=1;
    end
   end
end
% figure, imshow (E1); 
E1 = bwareaopen(E1,12);
figure; imshow (E1); title('Binarized and cleared image 1 (remove all small objects)');

%[MULTIPE]
[M,N] = size(E2);
for i=1:M
   for j=1:N
    if E2(i,j)==1
     E2(i,j)=0;
    else
      E2(i,j)=1;
    end
   end
end
E2 = bwareaopen(E2,12);
figure; imshow (E2); title('Binarized and cleared image 2 (remove all small objects)');

%[MULTIPE]
[M,N] = size(E3);
for i=1:M
   for j=1:N
    if E3(i,j)==1
     E3(i,j)=0;
    else
      E3(i,j)=1;
    end
   end
end
E3 = bwareaopen(E3,12);
figure; imshow (E3); title('Binarized and cleared image 3 (remove all small objects)');
% [M,N] = size(E4);
% for i=1:M
%    for j=1:N
%     if E4(i,j)==1
%      E4(i,j)=0;
%     else
%       E4(i,j)=1;
%     end
%    end
% end
% % figure, imshow (E1); 
% E4 = bwareaopen(E4,12);
% figure; imshow (E4); title('Binarized and cleared image 4 (remove all small objects)');
% [M,N] = size(E5);
% for i=1:M
%    for j=1:N
%     if E5(i,j)==1
%      E5(i,j)=0;
%     else
%       E5(i,j)=1;
%     end
%    end
% end
% % figure, imshow (E1); 
% E5 = bwareaopen(E5,12);
% figure; imshow (E5); title('Binarized and cleared image 5 (remove all small objects)');
% [M,N] = size(E6);
% for i=1:M
%    for j=1:N
%     if E6(i,j)==1
%      E6(i,j)=0;
%     else
%       E6(i,j)=1;
%     end
%    end
% end
% % figure, imshow (E1); 
% E6 = bwareaopen(E6,12);
% figure; imshow (E6); title('Binarized and cleared image 6 (remove all small objects)');
% [M,N] = size(E7);
% for i=1:M
%    for j=1:N
%     if E7(i,j)==1
%      E7(i,j)=0;
%     else
%       E7(i,j)=1;
%     end
%    end
% end
% % figure, imshow (E1); 
% E7 = bwareaopen(E7,12);
% figure; imshow (E7); title('Binarized and cleared image 7 (remove all small objects)');
% [M,N] = size(E8);
% for i=1:M
%    for j=1:N
%     if E8(i,j)==1
%      E8(i,j)=0;
%     else
%       E8(i,j)=1;
%     end
%    end
% end
% % figure, imshow (E1); 
% E8 = bwareaopen(E8,12);
% figure; imshow (E8); title('Binarized and cleared image 8 (remove all small objects)');
% [M,N] = size(E9);
% for i=1:M
%    for j=1:N
%     if E9(i,j)==1
%      E9(i,j)=0;
%     else
%       E9(i,j)=1;
%     end
%    end
% end
% % figure, imshow (E1); 
% E9 = bwareaopen(E9,12);
% figure; imshow (E9); title('Binarized and cleared image 9 (remove all small objects)');
% [M,N] = size(E10);
% for i=1:M
%    for j=1:N
%     if E10(i,j)==1
%      E10(i,j)=0;
%     else
%       E10(i,j)=1;
%     end
%    end
% end
% % figure, imshow (E1); 
% E10 = bwareaopen(E10,12);
% figure; imshow (E10); title('Binarized and cleared image 10 (remove all small objects)');  



% **** Use of homemade function for deleting meaningless areas (see below the description) ****


% Z1=not_touched_areas_beginning('image cell 1 (22).jpg');
% EBW_RED1=zeros(M,N); 
% for i=1:M
%    for j=1:N
%        EBW_RED1(i,j)=E1(i,j)*Z1(i,j);  
%    end
% end
% E1 = EBW_RED1;
% figure, imshow(EBW_RED1), title ('Binarized and cleared image 1 (remove not touched areas)');
% 
% Z2=not_touched_areas_current('image cell 2 (22).jpg');
% EBW_RED2=zeros(M,N); 
% Ztot = Z1;
% for i=1:M
%    for j=1:N
%        if Z2(i,j)==1 && Ztot(i,j)==0
%            Ztot(i,j)=1;        
%        end       
%    end
% end
% for i=1:M
%    for j=1:N
%        EBW_RED2(i,j)=E2(i,j)*Ztot(i,j);  
%    end
% end
% E2 = EBW_RED2;
% figure, imshow(E2), title ('Binarized and cleared image 2 (remove not touched areas)');
% 
% %[MULTIPLE]
% Z3=not_touched_areas_current('image cell 3 (22).jpg');
% EBW_RED3=zeros(M,N); 
% for i=1:M
%    for j=1:N
%        if Z3(i,j)==1 && Ztot(i,j)==0
%            Ztot(i,j)=1;        
%        end       
%    end
% end
% for i=1:M
%    for j=1:N
%        EBW_RED3(i,j)=E3(i,j)*Z1(i,j);  
%    end
% end
% E3 = EBW_RED3;
% figure, imshow(E3), title ('Binarized and cleared image 1 (remove not touched areas)')







% **** Fill each degradated area with holes ****



E1 = imfill(E1);
figure, imshow(E1); title('Image 1 After filling areas')

%[MULTIPE]
E2 = imfill(E2);
 figure, imshow(E2); title('Image 2 After filling areas')
E3 = imfill(E3);
figure, imshow(E3); title('Image 3 After filling areas')
% E4 = imfill(E4);
% figure, imshow(E4); title('Image 4 After filling areas')
% E5 = imfill(E5);
% figure, imshow(E5); title('Image 5 After filling areas')
% E6 = imfill(E6);
% figure, imshow(E6); title('Image 6 After filling areas')
% E7 = imfill(E7);
% figure, imshow(E7); title('Image 7 After filling areas')
% E8 = imfill(E8);
% figure, imshow(E8); title('Image 8 After filling areas')
% E9 = imfill(E9);
% figure, imshow(E9); title('Image 9 After filling areas')
% E10 = imfill(E10);
% figure, imshow(E10); title('Image 10 After filling areas')




% **** second removing of small objects ****


E1 = bwareaopen(E1,12);
%%%% figure; imshow (E1); title('Image 1 last clearing');
%[MULTIPE]
E2 = bwareaopen(E2,12);
%%%% figure; imshow (E2); title('Image 2 last clearing');
E3 = bwareaopen(E3,12);
% figure; imshow (E3); title('Image 3 last clearing')
% E4 = bwareaopen(E4,12);
% figure; imshow (E4); title('Image 4 last clearing')
% E5 = bwareaopen(E5,12);
% figure; imshow (E5); title('Image 5 last clearing')
% E6 = bwareaopen(E6,12);
% figure; imshow (E6); title('Image 6 last clearing')
% E7 = bwareaopen(E7,12);
% figure; imshow (E7); title('Image 7 last clearing')
% E8 = bwareaopen(E8,12);
% figure; imshow (E8); title('Image 8 last clearing')
% E9 = bwareaopen(E9,12);
% figure; imshow (E9); title('Image 9 last clearing')
% E10 = bwareaopen(E10,12);
% figure; imshow (E10); title('Image 10 last clearing')




% %If you want to invert black/white at this stage (only for visualisation)
% 
% EBWFNEGATIVEY = zeros(M,N);
% for i=1:M
%     for j=1:N
%      if E1(i,j)==1
%       EBWFNEGATIVEY(i,j)=0;
%      else
%        EBWFNEGATIVEY(i,j)=1;
%      end
%     end
%  end
% %figure, imshow(EBWFNEGATIVEY); title('Image 1 After filling areas "negative"')
 
 
 

 

% **** Label each degradation areas by connected component analysis ****

%(a faster function taking less memory could be bwconncomp)


[CC1,n1] = bwlabeln(E1);

%[MULTIPE]
[CC2,n2] = bwlabeln(E2);
[CC3,n3] = bwlabeln(E3);
% [CC4,n4] = bwlabeln(E4);
% [CC5,n5] = bwlabeln(E5);
% [CC6,n6] = bwlabeln(E6);
% [CC7,n7] = bwlabeln(E7);
% [CC8,n8] = bwlabeln(E8);
% [CC9,n9] = bwlabeln(E9);
% [CC10,n10] = bwlabeln(E10);





% **** Associate same areas in different times ****

% problem with fusion of degradation areas and with new areas  


for k=1:n2
    for i1=1:M
        for j1=1:N
            if  CC2(i1,j1) == k && CC1(i1,j1) ~= 0
                for i2=1:M
                    for j2=1:N
                        if CC2(i2,j2) == k
                           CC2(i2,j2) = double(CC1(i1,j1))+500; 
                        end
                    end
                end
            end
        end
    end
end 


for y = 500:1000
    for i=1:M
        for j=1:N
            if CC2(i,j)== y
                CC2(i,j)=y-500;
            end
        end
    end
end

                           
                        
                
                


% **** show final images resulting from segmentation ****


%  If we use: figure, imshow(label2rgb(CC1));  title('Image 1 Labelled degradation areas');
% for the segmentation of the image, 
% each color will correspond to a label, but we won't know which one will
% correspond to wich label,
% We have t choose a clearest map:
% thanks to the following color map we can associate an area with its number
% 

figure, imshow(label2rgb(CC1,@autumn));  title('Image 1 Labelled degradation areas');
figure, imshow(label2rgb(CC2,@autumn));  title('Image 2 Labelled degradation areas');
figure, imshow(label2rgb(CC3,@autumn));  title('Image 3 Labelled degradation areas');
% figure, imshow(label2rgb(CC4,@autumn));  title('Image 4 Labelled degradation areas');
% figure, imshow(label2rgb(CC5,@autumn));  title('Image 5 Labelled degradation areas');
% figure, imshow(label2rgb(CC6,@autumn));  title('Image 6 Labelled degradation areas');
% figure, imshow(label2rgb(CC7,@autumn));  title('Image 7 Labelled degradation areas');
% figure, imshow(label2rgb(CC8,@autumn));  title('Image 8 Labelled degradation areas');
% figure, imshow(label2rgb(CC9,@autumn));  title('Image 9 Labelled degradation areas');
% figure, imshow(label2rgb(CC10,@autumn));  title('Image 10 Labelled degradation areas');


% display(n1)
% % cmap=autumn;
% % cmap(:,1)=cmap(:,1)*255;
% % cmap(:,2)=round(cmap(:,2)*255);
Mautumn1=label2rgb(CC1,@autumn);
Mautumn2=label2rgb(CC2,@autumn);
Mautumn3=label2rgb(CC3,@autumn);
% Mautumn4=label2rgb(CC4,@autumn);
% Mautumn5=label2rgb(CC5,@autumn);
% Mautumn6=label2rgb(CC6,@autumn);
% Mautumn7=label2rgb(CC7,@autumn);
% Mautumn8=label2rgb(CC8,@autumn);
% Mautumn9=label2rgb(CC9,@autumn);
% Mautumn10=label2rgb(CC10,@autumn);


% A REFLECHIR 
% % imshowpair(E1, E2,'Scaling','joint');
% metric = registration.metric.MeanSquares;
% % optimizer = registration.optimizer.RegularStepGradientDescent;
% [optimizer, metric]  = imregconfig('multimodal');
% E2new = imregister(Mautumn2,Mautumn1,'translation',optimizer, metric);
% % trans2 = imregtform(CC2,E1,'translation', optimizer, metric)
% % % imregister, first argument: image we want to move, second argument, fixed image
% figure, imshow(E2new), title ('test') 
%  



%% Analysis and quantification



% ****  calculate moment matrix ****


s1= regionprops(CC1,{'Centroid','MajorAxisLength','MinorAxisLength','Orientation'});
%Display histogram of each parameter
% figure, hM1 = histogram([s1.MajorAxisLength]); title('Major Axis Lenght LOL degradation area');
% figure, hm1 = histogram([s1.MinorAxisLength]); title('Minor Axis Lenght LOL degradation area');
figure, ho1 = histogram([s1.Orientation]); title('Orientation degradation area Image 1');

% %Save a text file with the computed parameters
% writetable(struct2table(s1), 'Label and computed parameters.txt')

%[MULTIPLE]

s2= regionprops(CC2,{'Centroid','MajorAxisLength','MinorAxisLength','Orientation'});
%Display histogram of each parameter
% figure, hM2 = histogram([s2.MajorAxisLength]); title('Major Axis Lenght LOL degradation area');
% figure, hm2 = histogram([s2.MinorAxisLength]); title('Minor Axis Lenght LOL degradation area');
figure, ho2 = histogram([s2.Orientation]); title('Orientation degradation area Image 2');
% %Save a text file with the computed parameters
% writetable(struct2table(s2), 'Label and computed parameters.txt')
s3= regionprops(CC3,{'Centroid','MajorAxisLength','MinorAxisLength','Orientation'});
%Display histogram of each parameter
% figure, hM3 = histogram([s3.MajorAxisLength]); title('Major Axis Lenght LOL degradation area');
% figure, hm3 = histogram([s3.MinorAxisLength]); title('Minor Axis Lenght LOL degradation area');
figure, ho3 = histogram([s3.Orientation]); title('Orientation degradation area Image 3');
% %Save a text file with the computed parameters
% writetable(struct2table(s3), 'Label and computed parameters.txt')
%s4= regionprops(CC4,{'Centroid','MajorAxisLength','MinorAxisLength','Orientation'});
%Display histogram of each parameter
% figure, hM4 = histogram([s4.MajorAxisLength]); title('Major Axis Lenght LOL degradation area');
% figure, hm4 = histogram([s4.MinorAxisLength]); title('Minor Axis Lenght LOL degradation area');
%figure, ho4 = histogram([s4.Orientation]); title('Orientation degradation area Image 4');
% %Save a text file with the computed parameters
% writetable(struct2table(s4), 'Label and computed parameters.txt')
%s5= regionprops(CC5,{'Centroid','MajorAxisLength','MinorAxisLength','Orientation'});
%Display histogram of each parameter
% figure, hM5 = histogram([s5.MajorAxisLength]); title('Major Axis Lenght LOL degradation area');
% figure, hm5 = histogram([s5.MinorAxisLength]); title('Minor Axis Lenght LOL degradation area');
%figure, ho5 = histogram([s5.Orientation]); title('Orientation degradation area Image 5');
% %Save a text file with the computed parameters
% writetable(struct2table(s5), 'Label and computed parameters.txt')
%s6= regionprops(CC6,{'Centroid','MajorAxisLength','MinorAxisLength','Orientation'});
%Display histogram of each parameter
% figure, hM6 = histogram([s6.MajorAxisLength]); title('Major Axis Lenght LOL degradation area');
% figure, hm6 = histogram([s6.MinorAxisLength]); title('Minor Axis Lenght LOL degradation area');
%figure, ho6 = histogram([s6.Orientation]); title('Orientation degradation area Image 6');
% %Save a text file with the computed parameters
% writetable(struct2table(s6), 'Label and computed parameters.txt')
%s7= regionprops(CC7,{'Centroid','MajorAxisLength','MinorAxisLength','Orientation'});
%Display histogram of each parameter
% figure, hM7 = histogram([s7.MajorAxisLength]); title('Major Axis Lenght LOL degradation area');
% figure, hm7 = histogram([s7.MinorAxisLength]); title('Minor Axis Lenght LOL degradation area');
%figure, ho7 = histogram([s7.Orientation]); title('Orientation degradation area Image 7');
% %Save a text file with the computed parameters
% writetable(struct2table(s7), 'Label and computed parameters.txt')
%s8= regionprops(CC8,{'Centroid','MajorAxisLength','MinorAxisLength','Orientation'});
%Display histogram of each parameter
% figure, hM8 = histogram([s8.MajorAxisLength]); title('Major Axis Lenght LOL degradation area');
% figure, hm8 = histogram([s8.MinorAxisLength]); title('Minor Axis Lenght LOL degradation area');
%figure, ho8 = histogram([s8.Orientation]); title('Orientation degradation area Image 8');
% %Save a text file with the computed parameters
% writetable(struct2table(s8), 'Label and computed parameters.txt')
%s9= regionprops(CC9,{'Centroid','MajorAxisLength','MinorAxisLength','Orientation'});
%Display histogram of each parameter
% figure, hM9 = histogram([s9.MajorAxisLength]); title('Major Axis Lenght LOL degradation area');
% figure, hm9 = histogram([s9.MinorAxisLength]); title('Minor Axis Lenght LOL degradation area');
%figure, ho9 = histogram([s9.Orientation]); title('Orientation degradation area Image 9');
% %Save a text file with the computed parameters
% writetable(struct2table(s9), 'Label and computed parameters.txt')
%s10= regionprops(CC10,{'Centroid','MajorAxisLength','MinorAxisLength','Orientation'});
%Display histogram of each parameter
% figure, hM10 = histogram([s10.MajorAxisLength]); title('Major Axis Lenght LOL degradation area');
% figure, hm10 = histogram([s10.MinorAxisLength]); title('Minor Axis Lenght LOL degradation area');
%figure, ho10 = histogram([s10.Orientation]); title('Orientation degradation area Image 10');
% %Save a text file with the computed parameters
% writetable(struct2table(s10), 'Label and computed parameters.txt')




% **** conversion pixel/meters, dialog box for user input ****


prompt = {'Enter pixel size in micrometer (X micrometers per pixel)'};
title = 'Measurement dimensions';
dims = [1 75];
definput = {'0.0986'};
pixel_size = inputdlg(prompt,title,dims,definput);
pixel_size = str2double(pixel_size{1});
display(pixel_size,'pixel size in micrometers')




% **** calcul of total area of degradation in micrometers ****


 total_area_compter1 = 0;
 for i=1:M
    for j=1:N
        if CC1(i,j) ~= 0
            total_area_compter1 = total_area_compter1+ 1;         
        end
     end
 end
total_area_micrometers1=total_area_compter1*(pixel_size^2);
display(total_area_micrometers1)

%[MULTIPLE]
 total_area_compter2 = 0;
 for i=1:M
    for j=1:N
        if CC2(i,j) ~= 0
            total_area_compter2 = total_area_compter2+ 1;         
        end
     end
 end
total_area_micrometers2=total_area_compter2*(pixel_size^2);
display(total_area_micrometers2)
total_area_compter3 = 0;
 for i=1:M
    for j=1:N
        if CC3(i,j) ~= 0
            total_area_compter3 = total_area_compter3+ 1;         
        end
     end
 end
total_area_micrometers3=total_area_compter3*(pixel_size^2);
display(total_area_micrometers3)
% total_area_compter4 = 0;
%  for i=1:M
%     for j=1:N
%         if CC4(i,j) ~= 0
%             total_area_compter4 = total_area_compter4+ 1;         
%         end
%      end
% end
% total_area_micrometers4=total_area_compter4*((pixel_size)^2);
% display(total_area_micrometers4)
%  total_area_compter5 = 0;
%  for i=1:M
%     for j=1:N
%         if CC5(i,j) ~= 0
%             total_area_compter5 = total_area_compter5+ 1;         
%         end
%      end
% end
% total_area_micrometers5=total_area_compter5*((pixel_size)^2);
% display(total_area_micrometers5)
%  total_area_compter6 = 0;
%  for i=1:M
%     for j=1:N
%         if CC6(i,j) ~= 0
%             total_area_compter6 = total_area_compter6+ 1;         
%         end
%      end
% end
% total_area_micrometers6=total_area_compter6*((pixel_size)^2);
% display(total_area_micrometers6)
%  total_area_compter7 = 0;
%  for i=1:M
%     for j=1:N
%         if CC7(i,j) ~= 0
%             total_area_compter7 = total_area_compter7+ 1;         
%         end
%      end
% end
% total_area_micrometers7=total_area_compter7*((pixel_size)^2);
% display(total_area_micrometers7)
%  total_area_compter8 = 0;
%  for i=1:M
%     for j=1:N
%         if CC8(i,j) ~= 0
%             total_area_compter8 = total_area_compter8+ 1;         
%         end
%      end
% end
% total_area_micrometers8=total_area_compter8*((pixel_size)^2);
% display(total_area_micrometers8)
%  total_area_compter9 = 0;
%  for i=1:M
%     for j=1:N
%         if CC9(i,j) ~= 0
%             total_area_compter9 = total_area_compter9+ 1;         
%         end
%      end
% end
% total_area_micrometers9=total_area_compter9*((pixel_size)^2);
% display(total_area_micrometers9)
%  total_area_compter10 = 0;
%  for i=1:M
%     for j=1:N
%         if CC10(i,j) ~= 0
%             total_area_compter10 = total_area_compter10+ 1;         
%         end
%      end
% end
% total_area_micrometers10=total_area_compter10*((pixel_size)^2);
% display(total_area_micrometers10)
 
 
 





% **** Specific areas of degradation and intensities ****


% matrix with: first column: index of each degradation zone, second
% column: area of the degradation zone in pixel,third
% column: area of the degradation zone in micrometers, fourth column:
% intensity of black in pourcent (total black is 100%, total white is 0%)

specific_areas_matrix1=zeros(n1,4);
for i=1:M
   for j=1:N
       for k=1:n1
           if CC1(i,j) == k 
               specific_areas_matrix1(k,1)=Mautumn1(i,j,2);
               specific_areas_matrix1(k,2)=specific_areas_matrix1(k,2)+1;
               specific_areas_matrix1(k,4)= (255 - double(Gray_value_E1(i,j)))+specific_areas_matrix1(k,4);
           end
           specific_areas_matrix1(k,3)=specific_areas_matrix1(k,2)*(pixel_size^2);
                 
       end
   end
end 

%I don't know why but specific_areas_matrix1(k,4)=specific_areas_matrix1(k,4)/
%specific_areas_matrix1(k,2); doesn't work after the first end of the
%previous loop.... So I did another one.

for k=1:n1
    specific_areas_matrix1(k,4)=specific_areas_matrix1(k,4)/ specific_areas_matrix1(k,2);
    specific_areas_matrix1(k,4)=specific_areas_matrix1(k,4)/255;
end 

%[MULTIPLE]
specific_areas_matrix2=zeros(n2,4);
for i=1:M
   for j=1:N
       for k=1:n2
           if CC2(i,j) == k 
               specific_areas_matrix2(k,1)=Mautumn2(i,j,2);
               specific_areas_matrix2(k,2)=specific_areas_matrix2(k,2)+1;
               specific_areas_matrix2(k,4)=(255 - double(Gray_value_E2(i,j)))+specific_areas_matrix2(k,4);
           end
           specific_areas_matrix2(k,3)=specific_areas_matrix2(k,2)*(pixel_size^2);
       end
   end
end 
for k=1:n2
    specific_areas_matrix2(k,4)=specific_areas_matrix2(k,4)/ specific_areas_matrix2(k,2);
    specific_areas_matrix2(k,4)=specific_areas_matrix2(k,4)/255;
end 
specific_areas_matrix3=zeros(n3,4);
for i=1:M
   for j=1:N
       for k=1:n3
           if CC3(i,j) == k 
               specific_areas_matrix3(k,1)=Mautumn3(i,j,2);
               specific_areas_matrix3(k,2)=specific_areas_matrix3(k,2)+1;
               (255 - double(Gray_value_E3(i,j)))+specific_areas_matrix3(k,4);
           end
           specific_areas_matrix3(k,3)=specific_areas_matrix3(k,2)*(pixel_size^2);
       end
   end
end 
for k=1:n3
    specific_areas_matrix3(k,4)=specific_areas_matrix3(k,4)/ specific_areas_matrix3(k,2);
    specific_areas_matrix3(k,4)=specific_areas_matrix3(k,4)/255;
end 
% specific_areas_matrix4=zeros(n4,4);
% for i=1:M
%    for j=1:N
%        for k=1:n4
%            if CC4(i,j) == k 
%                specific_areas_matrix4(k,1)=Mautumn4(i,j,2);
%                specific_areas_matrix4(k,2)=specific_areas_matrix4(k,2)+1;
%                (255 - double(Gray_value_E4(i,j)))+specific_areas_matrix4(k,4);
%            end
%            specific_areas_matrix4(k,3)=specific_areas_matrix4(k,2)*(pixel_size^2);
%        end
%    end
% end 
% for k=1:n4
%     specific_areas_matrix4(k,4)=specific_areas_matrix4(k,4)/ specific_areas_matrix4(k,2);
%     specific_areas_matrix4(k,4)=specific_areas_matrix4(k,4)/255;
% end 
% specific_areas_matrix5=zeros(n5,4);
% for i=1:M
%    for j=1:N
%        for k=1:n5
%            if CC5(i,j) == k 
%                specific_areas_matrix5(k,1)=Mautumn5(i,j,2);
%                specific_areas_matrix5(k,2)=specific_areas_matrix5(k,2)+1;
%                (255 - double(Gray_value_E5(i,j)))+specific_areas_matrix5(k,4);
%            end
%            specific_areas_matrix5(k,3)=specific_areas_matrix5(k,2)*(pixel_size^2);
%        end
%    end
% end 
% for k=1:n5
%     specific_areas_matrix5(k,4)=specific_areas_matrix5(k,4)/ specific_areas_matrix5(k,2);
%     specific_areas_matrix5(k,4)=specific_areas_matrix5(k,4)/255;
% end 
% specific_areas_matrix6=zeros(n6,4);
% for i=1:M
%    for j=1:N
%        for k=1:n6
%            if CC6(i,j) == k 
%                specific_areas_matrix6(k,1)=Mautumn6(i,j,2);
%                specific_areas_matrix6(k,2)=specific_areas_matrix6(k,2)+1;
%                (255 - double(Gray_value_E6(i,j)))+specific_areas_matrix6(k,4);
%            end
%            specific_areas_matrix6(k,3)=specific_areas_matrix6(k,2)*(pixel_size^2);
%        end
%    end
% end 
% for k=1:n6
%     specific_areas_matrix6(k,4)=specific_areas_matrix6(k,4)/ specific_areas_matrix6(k,2);
%     specific_areas_matrix6(k,4)=specific_areas_matrix6(k,4)/255;
% end 
% specific_areas_matrix7=zeros(n7,4);
% for i=1:M
%    for j=1:N
%        for k=1:n7
%            if CC7(i,j) == k 
%                specific_areas_matrix7(k,1)=Mautumn7(i,j,2);
%                specific_areas_matrix7(k,2)=specific_areas_matrix7(k,2)+1;
%                (255 - double(Gray_value_E7(i,j)))+specific_areas_matrix7(k,4);
%            end
%            specific_areas_matrix7(k,3)=specific_areas_matrix7(k,2)*(pixel_size^2);
%        end
%    end
% end 
% for k=1:n7
%     specific_areas_matrix7(k,4)=specific_areas_matrix7(k,4)/ specific_areas_matrix7(k,2);
%     specific_areas_matrix7(k,4)=specific_areas_matrix7(k,4)/255;
% end 
% specific_areas_matrix8=zeros(n8,4);
% for i=1:M
%    for j=1:N
%        for k=1:n8
%            if CC8(i,j) == k 
%                specific_areas_matrix8(k,1)=Mautumn8(i,j,2);
%                specific_areas_matrix8(k,2)=specific_areas_matrix8(k,2)+1;
%                (255 - double(Gray_value_E8(i,j)))+specific_areas_matrix8(k,4);
%            end
%            specific_areas_matrix8(k,3)=specific_areas_matrix8(k,2)*(pixel_size^2);
%        end
%    end
% end 
% for k=1:n8
%     specific_areas_matrix8(k,4)=specific_areas_matrix8(k,4)/ specific_areas_matrix8(k,2);
%     specific_areas_matrix8(k,4)=specific_areas_matrix8(k,4)/255;
% end 
% specific_areas_matrix9=zeros(n9,4);
% for i=1:M
%    for j=1:N
%        for k=1:n9
%            if CC9(i,j) == k 
%                specific_areas_matrix9(k,1)=Mautumn9(i,j,2);
%                specific_areas_matrix9(k,2)=specific_areas_matrix9(k,2)+1;
%                (255 - double(Gray_value_E9(i,j)))+specific_areas_matrix9(k,4);
%            end
%            specific_areas_matrix9(k,3)=specific_areas_matrix9(k,2)*(pixel_size^2);
%        end
%    end
% end 
% for k=1:n9
%     specific_areas_matrix9(k,4)=specific_areas_matrix9(k,4)/ specific_areas_matrix9(k,2);
%     specific_areas_matrix9(k,4)=specific_areas_matrix9(k,4)/255;
% end 
% specific_areas_matrix10=zeros(n10,4);
% for i=1:M
%    for j=1:N
%        for k=1:n10
%            if CC10(i,j) == k 
%                specific_areas_matrix10(k,1)=Mautumn10(i,j,2);
%                specific_areas_matrix10(k,2)=specific_areas_matrix10(k,2)+1;
%                (255 - double(Gray_value_E10(i,j)))+specific_areas_matrix10(k,4);
%            end
%            specific_areas_matrix10(k,3)=specific_areas_matrix10(k,2)*(pixel_size^2);
%        end
%    end
% end 
% for k=1:n10
%     specific_areas_matrix10(k,4)=specific_areas_matrix10(k,4)/ specific_areas_matrix10(k,2);
%     specific_areas_matrix10(k,4)=specific_areas_matrix10(k,4)/255;
% end 















% % verification of the specific_areas_matrix
% verif_somme=0;
% for i=1:n
%     verif_somme = verif_somme + specific_areas_matrix(i,2);
% end
% 
% if verif_somme == total_area_compter
%         disp ('verification matrix ok');
% else 
%         disp('attention there is a problem between total area compter and the sum of each lines in specific_areas_matrix')
% end
%            



%%  Homemade functions


 
function[A] = not_touched_areas_beginning(Image)


%Delete the area keeped after thresholding who can't be degadation because
%It's not under the cell (first loop) neither around the cell (second loop)


%Display image and histogram%
F=imread(Image);
%figure, imshow(F); title('Original image')
F=imadjust(F);
figure, imhist(F); axis tight; title('New histogram')
% figure,imshow(F); title('New image')

[M1,N1] = size(F);
A = zeros(M1,N1);

% creation of a matrix with value one for the pixel located in the cell and
% 0 outside

for i=1:M1
   for j=1:N1
    if F(i,j)>=20
     A(i,j)=1;
    else
      A(i,j)=0;
    end
   end
end


% Put ones in a larger area around the cell (pixel value chosen in a quite random
% way....)

for i=6:M1-5
   for j=6:N1-5
    if  A(i,j)==1 
           for k=1:5
                for l=1:5
                    A(i-k,j-l)=1;
                end
            end
    
    else
      A(i,j)=0;
    end
   end
end
    
end 


function[B] = not_touched_areas_current(Image)


%Delete the area keeped after thresholding who can't be degadation because
%It's not under the cell (first loop) neither around the cell (second loop)

%Display image and histogram%
F=imread(Image);
% figure, imshow(F); title('Original image')
F=imadjust(F);
figure, imhist(F); axis tight; title('New histogram')
% figure,imshow(F); title('New image')

[M1,N1] = size(F);
B = zeros(M1,N1);

% creation of a matrix with value one for the pixel located in the cell and
% 0 outside

for i=1:M1
   for j=1:N1
    if F(i,j)>=20
     B(i,j)=1;
    else
      B(i,j)=0;
    end
   end
end   
       
end 


