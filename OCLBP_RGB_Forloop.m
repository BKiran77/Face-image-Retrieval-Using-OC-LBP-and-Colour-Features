
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
         red=imga(:,:,1);
         green=imga(:,:,2);
         blue=imga(:,:,3);
         % figure(1), imshow(red);
         % figure(2), imshow(green);
         % figure(3), imshow(blue);
    for i=2:r-1
         for j=2:c-1

             centre=red(i,j);
             p1=red(i-1,j-1)>centre;
             p2=red(i-1,j)>centre;
             p3=red(i-1,j+1)>centre;
             p4=red(i,j+1)>centre;
             p5=red(i+1,j+1)>centre;
             p6=red(i+1,j)>centre;
             p7=red(i+1,j-1)>centre;
             p8=red(i,j-1)>centre;

               lbp1_red(i,j)=p1*2^0+p3*2^1+p5*2^2+p7*2^3;
           lbp2_red(i,j)=p2*2^0+p4*2^1+p6*2^2+p8*2^3;

          
         end
    end
k


%start of Green channel
for i=2:r-1
    for j=2:c-1
        
        centre=green(i,j);
         p1=green(i-1,j-1)>centre;
         p2=green(i-1,j)>centre;
         p3=green(i-1,j+1)>centre;
         p4=green(i,j+1)>centre;
         p5=green(i+1,j+1)>centre;
         p6=green(i+1,j)>centre;
         p7=green(i+1,j-1)>centre;
         p8=green(i,j-1)>centre;
         
         
           lbp1_green(i,j)=p1*2^0+p3*2^1+p5*2^2+p7*2^3;
       lbp2_green(i,j)=p2*2^0+p4*2^1+p6*2^2+p8*2^3;
          
          
    end
end

k;

%close of green channel
%************************************************************************************************************





%*******************************************************************************************************
%start of blue channel
for i=2:r-1
    for j=2:c-1
        
        centre=blue(i,j);
         p1=blue(i-1,j-1)>centre;
         p2=blue(i-1,j)>centre;
         p3=blue(i-1,j+1)>centre;
         p4=blue(i,j+1)>centre;
         p5=blue(i+1,j+1)>centre;
         p6=blue(i+1,j)>centre;
         p7=blue(i+1,j-1)>centre;
         p8=blue(i,j-1)>centre;
         
          
           lbp1_blue(i,j)=p1*2^0+p3*2^1+p5*2^2+p7*2^3;
       lbp2_blue(i,j)=p2*2^0+p4*2^1+p6*2^2+p8*2^3;
          
          
          
    end
end
k;
%close of blue channel

%*********************histogram**********************************%

% figure,hist(lbp1_blue);
% figure,hist(lbp2_blue)
% figure,hist(lbp1_green);
% figure,hist(lbp2_green);
% figure,hist(lbp1_red);
% figure,hist(lbp2_red);

[counts1blue,x]= imhist(uint8(lbp1_blue));
[counts2blue,x]= imhist(uint8(lbp2_blue));
[counts1green,x]= imhist(uint8(lbp1_green));
[counts2green,x]= imhist(uint8(lbp2_green));
[counts1red,x]= imhist(uint8(lbp1_red));
[counts2red,x]= imhist(uint8(lbp2_red));
counts1blue=counts1blue';
counts1red=counts1red';
counts1green=counts1green';
counts2blue=counts2blue';
counts2red=counts2red';
counts2green=counts2green';
for y=1:16
    CB1(:,y)=counts1blue(:,y);
    
end
for y=1:16
    Cr1(:,y)=counts1red(:,y);
    
end
for y=1:16
    Cg1(:,y)=counts1green(:,y);
    
end
for y=1:16
    CB2(:,y)=counts2blue(:,y);
    
end
for y=1:16
    Cr2(:,y)=counts2red(:,y);
    
end
for y=1:16
    Cg2(:,y)=counts2green(:,y);
    
end
    

%***************************************CONCATENATION!************************************%
oc_lbp_RGB(k,:)= [CB1 CB2 Cg1 Cg2 Cr1 Cr2];
k;
end

    save('OCLBP_RGB_FEATURE','oc_lbp_RGB')                                        

   
   
   
   
    
    
    













