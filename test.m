RGB=imread('E:\Document\S6\Pengenalan Pola\Gambar Tomat\Training\bmp\matang1.bmp');
%% Convert to gray scale
  Gray=rgb2gray(RGB);
%% Convert to binary image
threshold = graythresh(Gray);
imagen =~im2bw(Gray,threshold);
%% Remove all object containing fewer than 30 pixels
imagen = bwareaopen(imagen,30);
%% Label connected components
[L Ne]=bwlabel(imagen);
%% Measure properties of image regions
propied=regionprops(L,'BoundingBox','Area');
% %% Objects extraction
for n=1:Ne
  if(propied(n).Area>1000)
        [r,c] = find(L==n);
        switch (RGB)
            %%case 'RGB'
            %% get the image of the object 
               s_I =size(RGB);
               s = size(r);
               n1(:,:,1) = zeros(s_I(1),s_I(2));
               n1(:,:,2) = zeros(s_I(1),s_I(2));
               n1(:,:,3) = zeros(s_I(1),s_I(2));

                n1 (:,:,1) =255;
                n1 (:,:,2) = 255;
                n1 (:,:,3) = 255;

               for i=1:s
                   n1(r(i),c(i),1)=RGB(r(i),c(i),1);
                   n1(r(i),c(i),2)=RGB(r(i),c(i),2);
                   n1(r(i),c(i),3)=RGB(r(i),c(i),3);

               end;
               n1 = uint8(n1);
               % get the croped object from the image
               R = n1(min(r):max(r),min(c):max(c),1);
               G = n1(min(r):max(r),min(c):max(c),2);
               B = n1(min(r):max(r),min(c):max(c),3);
               n2 = cat(3,R,G,B);
               n2 = uint8(n2);
               imshow(n2);
        end
  end
end