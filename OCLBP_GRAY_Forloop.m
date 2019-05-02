
clc;
clear all;
close all;
image=imread('image (1).jpg');
%imshow(i);
imga=rgb2gray(image);

%imshow(i);
%imshow(j);



n=400;

for k=1:1 
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
             p1=red(i-1,j-1);
             p2=red(i-1,j);
             p3=red(i-1,j+1);
             p4=red(i,j+1);
             p5=red(i+1,j+1);
             p6=red(i+1,j);
             p7=red(i+1,j-1);
             p8=red(i,j-1);

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

               lbp1_red(i,j)=p1*2^0+p3*2^1+p5*2^2+p7*2^3;
           lbp2_red(i,j)=p2*2^0+p4*2^1+p6*2^2+p8*2^3;

          
         end
    end
k


%start of Green channel
for i=2:r-1
    for j=2:c-1
        
        centre=green(i,j);
         p1=green(i-1,j-1);
         p2=green(i-1,j);
         p3=green(i-1,j+1);
         p4=green(i,j+1);
         p5=green(i+1,j+1);
         p6=green(i+1,j);
         p7=green(i+1,j-1);
         p8=green(i,j-1);
         
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
        
         
           lbp1_green(i,j)=p1*2^0+p3*2^1+p5*2^2+p7*2^3;
       lbp2_green(i,j)=p2*2^0+p4*2^1+p6*2^2+p8*2^3;
          
          
    end
end



%close of green channel
%************************************************************************************************************





%*******************************************************************************************************
%start of blue channel
for i=2:r-1
    for j=2:c-1
        
        centre=blue(i,j);
         p1=blue(i-1,j-1);
         p2=blue(i-1,j);
         p3=blue(i-1,j+1);
         p4=blue(i,j+1);
         p5=blue(i+1,j+1);
         p6=blue(i+1,j);
         p7=blue(i+1,j-1);
         p8=blue(i,j-1);
         
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
        
          
           lbp1_blue(i,j)=p1*2^0+p3*2^1+p5*2^2+p7*2^3;
       lbp2_blue(i,j)=p2*2^0+p4*2^1+p6*2^2+p8*2^3;
          
          
          
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

[counts1blue,x]= imhist(uint8(lbp1_blue));
[counts2blue,x]= imhist(uint8(lbp2_blue));
[counts1green,x]= imhist(uint8(lbp1_green));
[counts2green,x]= imhist(uint8(lbp2_green));
[counts1red,x]= imhist(uint8(lbp1_red));
[counts2red,x]= imhist(uint8(lbp2_red));

%***************************************CONCATENATION!************************************%
oc_lbp(k,:)= [counts1blue' counts2blue' counts1green' counts2green' counts1red' counts2red'];

end

                                            
   figure,subplot(4,2,1);
   imshow(img);
   title('GRAY SCALE');
   
   subplot(4,2,2);
   imshow(imga);
   title('COLOR IMAGE');
   
   subplot(4,2,3);
   imshow(lbp1_red);
   title('R OC LBP IMAGE');
   
   subplot(4,2,4);
   imshow(lbp2_red);
   title('R OC LBP IMAGE');
   
   subplot(4,2,5);
   imshow(lbp1_green);
   title('G OC LBP IMAGE');
   
   subplot(4,2,6);
   imshow(lbp2_green);
   title('G OC LBP IMAGE');
   
   subplot(4,2,7);
   imshow(lbp1_blue);
   title('B OC LBP IMAGE');
   
   subplot(4,2,8);
   imshow(lbp2_blue);
   title('B OC LBP IMAGE');
   
   
   
   
    
    
    













