function [ hasil ] = autoCrop(gambar)
%fungsi untuk memotong gambar tomat secara otomatis
%   Fungsi ini berfungsi memotong buah tomat dalam preporsesing ini
%   terdapat beberapa fungsi dari matlab untuk membantu proses dalam fungsi
%   ini.
%   autoCrop(alamat gambar);
%   Contoh: autoCrop('E:\Document\S6\Pengenalan Pola\Gambar
%   Tomat\Testing\bmp\matang6.bmp')
%baca gambar
I=imread(gambar);
%grayscale
G=rgb2gray(I);
%cari nilai threshhold
level = graythresh(I);
%binerisasi dengan nilai threshold level
testBW = im2bw(G,level);
%invers gambar
inversBW = ~testBW;
%opening gambar
erosi =  imerode(inversBW,strel('disk', 10));
opening =  imdilate(erosi,strel('disk', 15));
%cari titik koordinat X dan Y
projX = any(opening,1);
projY = any(opening,2);
%cari titik awal dan akhir X
fx=find(projX,1,'first');
lx=find(projX,1,'last');
%cari titik awal dan akhir Y
fy=find(projY,1,'first');
ly=find(projY,1,'last');
%gabungkan semua koordinat
cropRect=[fx,fy,lx-fx+1,ly-fy+1];
crop=imcrop(I,cropRect);
hasil=imcrop(crop, [200 200 200 200]);
%show hasil
figure,
subplot(2,2,1);
imshow(I);
title('Original')
subplot(2,2,2);
imshow(G);
title('Grayscale')
subplot(2,2,3);
imshow(testBW);
title('Biner')
subplot(2,2,4);
imshow(inversBW);
title('Invers Biner')
figure
imshow(hasil);
title('Hasil Croping')
end