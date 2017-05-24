function [jumlah] = jumlahwarna(ImgDir)
RGB = double(ImgDir);
[m,n,d] = size(RGB);

if (d ~= 3)
    disp('Citra harus berwarna');
    return;
end

RGB = double(RGB);
Data = zeros(1, m * n); % Array kosong

jum = 0;
for i=1:m
    for j=1:n
        jum = jum + 1;
       
        r = RGB(i,j,1);
        g = RGB(i,j,2);
        b = RGB(i,j,3);
        
        Data(jum) = bitshift(r,16) + bitshift(g, 8) + b;
    end
end

% Urutkan data pada array Data
Data = sort(Data);

% Hitung jumlah warna
jwarna = 1;
for i = 1 : jum - 1
    if Data(i) ~= Data(i+1)
        jwarna = jwarna + 1;
    end
end

jumlah = jwarna;