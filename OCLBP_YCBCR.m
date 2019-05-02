
clc;
clear all;
close all;
%imshow(i);
%img=rgb2gray(imga);

%imshow(i);
%imshow(j);






n=400;

for k=1:n  
         I=strcat('image (', num2str(k), ').jpg');
         imga=imread(I);
         
         [r,c,z]=size(imga);
         yuv=imga(:,:,1);
         cb=imga(:,:,2);
         cr=imga(:,:,3);
         % figure(1), imshow(yuv);
         % figure(2), imshow(cb);
         % figure(3), imshow(cr);
    for i=2:r-1
         for j=2:c-1

             centre=yuv(i,j);
             p1=yuv(i-1,j-1)>centre;
             p2=yuv(i-1,j)>centre;
             p3=yuv(i-1,j+1)>centre;
             p4=yuv(i,j+1)>centre;
             p5=yuv(i+1,j+1)>centre;
             p6=yuv(i+1,j)>centre;
             p7=yuv(i+1,j-1)>centre;
             p8=yuv(i,j-1)>centre;

               lbp1_yuv(i,j)=p1*2^0+p3*2^1+p5*2^2+p7*2^3;
           lbp2_yuv(i,j)=p2*2^0+p4*2^1+p6*2^2+p8*2^3;

          
         end
    end
k


%start of cb channel
for i=2:r-1
    for j=2:c-1
        
        centre=cb(i,j);
         p1=cb(i-1,j-1)>centre;
         p2=cb(i-1,j)>centre;
         p3=cb(i-1,j+1)>centre;
         p4=cb(i,j+1)>centre;
         p5=cb(i+1,j+1)>centre;
         p6=cb(i+1,j)>centre;
         p7=cb(i+1,j-1)>centre;
         p8=cb(i,j-1)>centre;
         
         
           lbp1_cb(i,j)=p1*2^0+p3*2^1+p5*2^2+p7*2^3;
       lbp2_cb(i,j)=p2*2^0+p4*2^1+p6*2^2+p8*2^3;
          
          
    end
end

k;

%close of cb channel
%************************************************************************************************************





%*******************************************************************************************************
%start of cr channel
for i=2:r-1
    for j=2:c-1
        
        centre=cr(i,j);
         p1=cr(i-1,j-1)>centre;
         p2=cr(i-1,j)>centre;
         p3=cr(i-1,j+1)>centre;
         p4=cr(i,j+1)>centre;
         p5=cr(i+1,j+1)>centre;
         p6=cr(i+1,j)>centre;
         p7=cr(i+1,j-1)>centre;
         p8=cr(i,j-1)>centre;
         
          
           lbp1_cr(i,j)=p1*2^0+p3*2^1+p5*2^2+p7*2^3;
       lbp2_cr(i,j)=p2*2^0+p4*2^1+p6*2^2+p8*2^3;
          
          
          
    end
end
k;
%close of cr channel

%*********************histogram**********************************%

% figure,hist(lbp1_cr);
% figure,hist(lbp2_cr);
% figure,hist(lbp1_cb);
% figure,hist(lbp2_cb);
% figure,hist(lbp1_yuv);
% figure,hist(lbp2_yuv);

[counts1yuv,x]= imhist(uint8(lbp1_yuv));
[counts2yuv,x]= imhist(uint8(lbp2_yuv));
[counts1cb,x]= imhist(uint8(lbp1_cb));
[counts2cb,x]= imhist(uint8(lbp2_cb));
[counts1cr,x]= imhist(uint8(lbp1_cr));
[counts2cr,x]= imhist(uint8(lbp2_cr));
counts1yuv=counts1yuv';
counts1cb=counts1cb';
counts1cr=counts1cr';
counts2yuv=counts2yuv';
counts2cb=counts2cb';
counts2cr=counts2cr';
for y=1:16
    Cy1(:,y)=counts1yuv(:,y);
    
end
for y=1:16
    Ccb1(:,y)=counts1cb(:,y);
    
end
for y=1:16
    Ccr1(:,y)=counts1cr(:,y);
    
end
for y=1:16
    Cy2(:,y)=counts2yuv(:,y);
    
end
for y=1:16
    Ccb2(:,y)=counts2cb(:,y);
    
end
for y=1:16
    Ccr2(:,y)=counts2cr(:,y);
    
end
    

%***************************************CONCATENATION!************************************%
oc_lbp_YCBCR(k,:)= [Cy1 Cy2 Ccb1  Ccb2 Ccr1  Ccr2 ];
k;
end

    save('OCLBP_YCBCR_FEATURE','oc_lbp_YCBCR')                                        

   
   
   
   
    
    
    













