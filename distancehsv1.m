
  
clc;
clear all;
close all;


%imshow(i);
  
load('OCLBP_HSV_FEATURE.mat');
image_no=1:400;
classes=[];
sz=size(oc_lbp_HSV);
no_img=sz(1);
FV=oc_lbp_HSV;

distance_hsv = zeros(400,400);

for i=1:400
    for j=1:400
        g = FV(i,:);
        g2 = FV(j,:);
        v = g-g2;
        distance_hsv(i,j) =sqrt(sum((g - g2) .^ 2));% sqrt(v*v');
    end
    i
end


n_i_c=2; % no of images in a class;



for i=1:400
    [B(i,:),I(i,:)] = sort(distance_hsv(i,:),'Ascend');
end

for image_no=1:400;
    classes(image_no,:)=ceil(image_no/n_i_c); %found  class number for all image
   
   image_no
end



F_p=3;  % fucntion point

for i=1:F_p
    B1(:,i)=B(:,i);
    I1(:,i)=I(:,i);
    c_r(:,i)=ceil(I1(:,i)/n_i_c);  % retrievd 3 images and their clasees for 400 images
end

%c_r store classes of retrieved image
for im=1:400
    counter=0;
    for i=1:F_p
    if (classes(im)==c_r(im,i)) % class comparision 
        counter=counter+1;
        
    end
    end
    prec1(im,1)=(counter/F_p)*100;
    recall1(im,1)=(counter/n_i_c)*100;
    fscore(im,1)=(2.*(prec1(im,1)).*(recall1(im,1))/(prec1(im,1)+recall1(im,1)));
       
end

sum_pre = 0;
sum_rec = 0;
sum_fscore = 0;

a=1;

for i=1:2:400
    
    for j=i:i+1
        sum_pre = sum_pre + prec1(j,1);
        sum_rec = sum_rec + recall1(j,1);
        sum_fscore=sum_fscore + fscore(j,1);
    end
    
    if a<=200
        
        avg_pre(a,1)= (sum_pre/2);     
        avg_rec(a,1) = (sum_rec/2);
        avg_fscore(a,1)=(sum_fscore/2);
        
        a=a+1;
    end
    
    sum_pre = 0;
    sum_rec = 0;
    sum_fscore=0;
    i     
end
result_HSV_400=[avg_pre avg_rec avg_fscore]
save('HSV_400','avg_pre','avg_rec','avg_fscore','distance_hsv')
