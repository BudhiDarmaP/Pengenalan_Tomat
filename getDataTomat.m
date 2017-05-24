function result = getDataTomat( gambar )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
image=imread(gambar);
%% resize tp 100x100
RGB=imresize(image, [100, 100]);
%% Convert to gray scale
Gray=rgb2gray(RGB);
%% Convert to binary image
threshold = graythresh(Gray);
imagen =~im2bw(Gray,threshold);
%% reduksi noise dengan pixels kurang dari 30
imagen = bwareaopen(imagen,30);
%% Label untuk menyambungkan komponen
[L Ne]=bwlabel(imagen);
%% Ukuran properties of image regions
propied=regionprops(L,'BoundingBox','Area');
% %% Objects extraction
for n=1:Ne
    if(propied(n).Area>1000)
        [r,c] = find(L==n);
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
               hasil = cat(3,R,G,B);
               hasil = uint8(hasil);
    end
end
%result=imcrop(hasil, [6 13 28 16]);
%%Menampilkan hasil croping%
figure,
subplot(1,2,1);
imshow(hasil);
subplot(1,2,2);
imshow(result);
end