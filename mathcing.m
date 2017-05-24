%%template matching
%baca gambar
gambar='E:\Document\S6\Pengenalan Pola\Gambar Tomat\Testing\bmp\mentah7.bmp';
%preprocesing
pre=autoCrop(gambar);
%statistik warna
statistik=statistikwarna(gambar);
%panggil database
% dbwarna{i,1}=mean_red;
% dbwarna{i,2}=mean_green;
% dbwarna{i,3}=mean_blue;
% dbwarna{i,4}='mentah';
% i=i+1;
%load warna
load('db.mat');
%jumlah seluruh database
jum_dbase=size(dbwarna,1);
%convert cell ke array numerik
array=cell2mat(dbwarna(1,1));
%size matriks array
[r,g,b]=size(array);
%inisialisasi nilai RGB
R=r;
G=g;
B=b;
% G=cell2mat(dbwarna(1,2));
% B=cell2mat(dbwarna(1,3));
D1 = sqrt((sum(R-mean_red).^2)+(sum(G-mean_green).^2)+(sum(B-mean_blue).^2));
ind_min=1;
 for i=2:jum_dbase
     R=cell2mat(dbwarna(i,1));
     G=cell2mat(dbwarna(i,2));
     B=cell2mat(dbwarna(i,3));
     D2=sqrt((sum(R-mean_red).^2)+(sum(G-mean_green).^2)+(sum(B-mean_blue).^2));
     if D2<D1
        D1=D2;
        ind_min=i;
     end
 end
 display('adalah : ');
     display(dbwarna(ind_min,4));
% %bandingkan statistik keduanya
% %post result