
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
         hsv1=rgb2hsv(imga);
         [r,c,z]=size(imga);
         hue=hsv1(:,:,1);
         saturation=hsv1(:,:,2);
         value=hsv1(:,:,3);
         % figure(1), imshow(red);
         % figure(2), imshow(green);
         % figure(3), imshow(blue);
    for i=2:r-1
         for j=2:c-1

             centre=hue(i,j);
             p1=hue(i-1,j-1)>centre;
             p2=hue(i-1,j)>centre;
             p3=hue(i-1,j+1)>centre;
             p4=hue(i,j+1)>centre;
             p5=hue(i+1,j+1)>centre;
             p6=hue(i+1,j)>centre;
             p7=hue(i+1,j-1)>centre;
             p8=hue(i,j-1)>centre;
% 
%              if p1 > centre
%                  p1=1;
%              else
%                  p1=0;
%              end
% 
%               if p2 > centre
%                  p2=1;
%              else
%                  p2=0;
%               end
% 
%               if p3 > centre
%                  p3=1;
%              else
%                  p3=0;
%               end
% 
%               if p4 > centre
%                  p4=1;
%              else
%                  p4=0;
%               end
% 
%               if p5 > centre
%                  p5=1;
%              else
%                  p5=0;
%               end
% 
%               if p6 > centre
%                  p6=1;
%              else
%                  p6=0;
%               end   
% 
%               if p7 > centre
%                  p7=1;
%              else
%                  p7=0;
%               end
% 
% 
%               if p8 > centre
%                  p8=1;
%              else
%                  p8=0;
%               end

               lbp1_hue(i,j)=p1*2^0+p3*2^1+p5*2^2+p7*2^3;
           lbp2_hue(i,j)=p2*2^0+p4*2^1+p6*2^2+p8*2^3;

          
         end
    end
k


%start of Green channel
for i=2:r-1
    for j=2:c-1
        
        centre=saturation(i,j);
         p1=saturation(i-1,j-1)>centre;
         p2=saturation(i-1,j)>centre;
         p3=saturation(i-1,j+1)>centre;
         p4=saturation(i,j+1)>centre;
         p5=saturation(i+1,j+1)>centre;
         p6=saturation(i+1,j)>centre;
         p7=saturation(i+1,j-1)>centre;
         p8=saturation(i,j-1)>centre;
         
%          if p1 > centre
%              p1=1;
%          else
%              p1=0;
%          end
%              
%           if p2 > centre
%              p2=1;
%          else
%              p2=0;
%           end
%              
%           if p3 > centre
%              p3=1;
%          else
%              p3=0;
%           end
%              
%           if p4 > centre
%              p4=1;
%          else
%              p4=0;
%           end
%              
%           if p5 > centre
%              p5=1;
%          else
%              p5=0;
%           end
%              
%           if p6 > centre
%              p6=1;
%          else
%              p6=0;
%           end   
%              
%           if p7 > centre
%              p7=1;
%          else
%              p7=0;
%           end
%              
%           
%           if p8 > centre
%              p8=1;
%          else
%              p8=0;
%           end
%         
%          
           lbp1_saturation(i,j)=p1*2^0+p3*2^1+p5*2^2+p7*2^3;
       lbp2_saturation(i,j)=p2*2^0+p4*2^1+p6*2^2+p8*2^3;
          
          
    end
end

k;

%close of green channel
%************************************************************************************************************





%*******************************************************************************************************
%start of blue channel
for i=2:r-1
    for j=2:c-1
        
        centre=value(i,j);
         p1=value(i-1,j-1)>centre;
         p2=value(i-1,j)>centre;
         p3=value(i-1,j+1)>centre;
         p4=value(i,j+1)>centre;
         p5=value(i+1,j+1)>centre;
         p6=value(i+1,j)>centre;
         p7=value(i+1,j-1)>centre;
         p8=value(i,j-1)>centre;
         
%          if p1 > centre
%              p1=1;
%          else
%              p1=0;
%          end
%              
%           if p2 > centre
%              p2=1;
%          else
%              p2=0;
%           end
%              
%           if p3 > centre
%              p3=1;
%          else
%              p3=0;
%           end
%              
%           if p4 > centre
%              p4=1;
%          else
%              p4=0;
%           end
%              
%           if p5 > centre
%              p5=1;
%          else
%              p5=0;
%           end
%              
%           if p6 > centre
%              p6=1;
%          else
%              p6=0;
%           end   
%              
%           if p7 > centre
%              p7=1;
%          else
%              p7=0;
%           end
%              
%           
%           if p8 > centre
%              p8=1;
%          else
%              p8=0;
%           end
%         
%           
           lbp1_value(i,j)=p1*2^0+p3*2^1+p5*2^2+p7*2^3;
       lbp2_value(i,j)=p2*2^0+p4*2^1+p6*2^2+p8*2^3;
          
          
          
    end
end
%close of blue channel

%*********************histogram**********************************%

% figure,hist(lbp1_blue);
% figure,hist(lbp2_blue);
% figure,hist(lbp1_green);
% figure,hist(lbp2_green);
% figure,hist(lbp1_red);
% figure,hist(lbp2_red);

[counts1hue,x]= imhist(uint8(lbp1_hue));
[counts2hue,x]= imhist(uint8(lbp2_hue));
[counts1saturation,x]= imhist(uint8(lbp1_saturation));
[counts2saturation,x]= imhist(uint8(lbp2_saturation));
[counts1value,x]= imhist(uint8(lbp1_value));
[counts2value,x]= imhist(uint8(lbp2_value));
counts1hue=counts1hue';
counts1saturation=counts1saturation';
counts1value=counts1value';
counts2hue=counts2hue';
counts2saturation=counts2saturation';
counts2value=counts2value';
for y=1:16
    Ch1(:,y)=counts1hue(:,y);
    
end
for y=1:16
    Cs1(:,y)=counts1saturation(:,y);
    
end
for y=1:16
    Cv1(:,y)=counts1value(:,y);
    
end
for y=1:16
    Ch2(:,y)=counts2hue(:,y);
    
end
for y=1:16
    Cs2(:,y)=counts2saturation(:,y);
    
end
for y=1:16
    Cv2(:,y)=counts2value(:,y);
    
end
    

%***************************************CONCATENATION!************************************%
oc_lbp_HSV(k,:)= [Ch1 Ch2 Cv1 Cv2  Cs1 Cs2 Cv2];
k;
end

    save('OCLBP_hsv_FEATURE','oc_lbp_HSV')                                        

   
   
   
   
    
    
    













