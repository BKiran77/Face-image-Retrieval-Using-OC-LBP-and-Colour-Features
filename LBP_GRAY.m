clear all;
close all;
clc;
org=imread('image (1).jpg');
%imshow(i);
img=rgb2gray(org);

%imshow(i);
%imshow(j);
[r,c]=size(img)
bw=img(:,:,1);



for i=2:r-1
    for j=2:c-1
        
        centre=bw(i,j);
         p1=bw(i-1,j-1);
         p2=bw(i-1,j);
         p3=bw(i-1,j+1);
         p4=bw(i,j+1);
         p5=bw(i+1,j+1);
         p6=bw(i+1,j);
         p7=bw(i+1,j-1);
         p8=bw(i,j-1);
         
         if p1 > centre
             p1=1;
         else
             p1=0;
         end
             
          if p2 > centre
             p2=1;
         else
             p2=0;
          end
             
          if p3 > centre
             p3=1;
         else
             p3=0;
          end
             
          if p4 > centre
             p4=1;
         else
             p4=0;
          end
             
          if p5 > centre
             p5=1;
         else
             p5=0;
          end
             
          if p6 > centre
             p6=1;
         else
             p6=0;
          end   
             
          if p7 > centre
             p7=1;
         else
             p7=0;
          end
             
          
          if p8 > centre
             p8=1;
         else
             p8=0;
          end
        
          lbp1(i,j)=p1*2^0+p2*2^1+p3*2^2+p4*2^3+p5*2^4+p6*2^5+p7*2^6+p8*2^7; 
    
                   
         
         

     
        
        
    end
end
% figure,imshow(lbp);

 %         figure,hist(lbp);
               [counts,x]= imhist(uint8(lbp1));  
               
                                                           
   figure,subplot(1,3,1);
   imshow(org);
   title('ORIGINAL IMAGE');
   
   subplot(1,3,2);
   imshow(img);
   title('GRAY IMAGE');
   
                                               
   subplot(1,3,3);
   imshow(lbp1);
   title('LBP WINDOW');
   
  
