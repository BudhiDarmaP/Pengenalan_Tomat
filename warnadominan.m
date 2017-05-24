function [dom] = warnadominan(ImgDir);
Img=imread(ImgDir);
[tinggi, lebar, dim] = size(Img);

% Konversi ke HVS
    [H,S,V] = RGBkeHSV(Img(:,:,1),Img(:,:,2),Img(:,:,3));
    
    mem_val = 0.0; 
    
    condong_merah = 0.0; 
    condong_biru = 0.0;
    condong_cyan = 0.0;
    condong_hijau = 0.0; 
    condong_magenta = 0.0; 
    condong_oranye = 0.0; 
    condong_pink = 0.0; 
    condong_ungu = 0.0; 
    condong_putih = 0.0; 
    condong_hitam = 0.0; 
    condong_abu_abu = 0.0; 
    condong_kuning = 0.0; 

    for y=1: tinggi
        for x=1: lebar   
            h = H(y,x);
            s = S(y,x);
            v = V(y,x);
           
            mem_val = double(f_red(h,s,v));
            if mem_val > 0
                condong_merah = condong_merah + mem_val;
            end
           
            mem_val = double(f_blue(h,s,v));
            if mem_val > 0
                condong_biru = condong_biru + mem_val;
            end
           
            mem_val = double(f_cyan(h,s,v));
            if mem_val > 0
                condong_cyan = condong_cyan + mem_val;
            end
           
            mem_val = double(f_green(h,s,v));
            if mem_val > 0
                condong_hijau = condong_hijau + mem_val;
            end
 
            mem_val = double(f_magenta(h,s,v));
            if mem_val > 0
                condong_magenta = condong_magenta + mem_val;
            end
 
            mem_val = double(f_orange(h,s,v));
            if mem_val > 0
                condong_oranye = condong_oranye + mem_val;
            end
 
            mem_val = double(f_yellow(h,s,v));
            if mem_val > 0
                condong_kuning = condong_kuning + mem_val;
            end
 
            mem_val = double(f_pink(h,s,v));
            if mem_val > 0
                condong_pink = condong_pink + mem_val;
            end
 
            mem_val = double(f_purple(h,s,v));
            if mem_val > 0
                condong_ungu = condong_ungu + mem_val;
            end
           
            mem_val = double(f_white(h,s,v));
            if mem_val > 0
                condong_putih = condong_putih + mem_val;
            end
 
            mem_val = double(f_black(h,s,v));
            if mem_val > 0
                condong_hitam = condong_hitam + mem_val;
            end
 
            mem_val = double(f_gray(h,s,v));
            if mem_val > 0
                condong_abu_abu = condong_abu_abu + mem_val;
            end
       end
    end

    maks = max( ...
       [condong_merah condong_biru condong_cyan condong_hijau ...
        condong_magenta condong_oranye condong_pink ...
        condong_ungu condong_putih condong_abu_abu ...
        condong_hitam condong_kuning]); 
    
    disp('Hasil Perhitungan Warna setiap Pixelnya : ');
    disp('==========================================');
    dom.merah = condong_merah;
    dom.biru = condong_biru;
    dom.cyan = condong_cyan;
    dom.hijau = condong_hijau;
    dom.magenta = condong_magenta;
    dom.oranye = condong_oranye;
    dom.pink = condong_pink;
    dom.ungu = condong_ungu;
    dom.putih = condong_putih;
    dom.abu_abu = condong_abu_abu;
    dom.hitam = condong_hitam;
    dom.kuning = condong_kuning;
    
    dom.maks = maks;
   
    
return

function derajat=f_red(h, s, v)
   if (h==0) && (s==0)
       derajat = 0.0;
   else    
       derajat = f_segitiga_kanan(0,21, h) + ...   
                 f_segitiga_kiri(234,255, h);
   end      

function derajat=f_green(h, s, v)
   if (h==0) && (s==0)
       derajat = 0.0;
   else    
      derajat = f_trapesium(43,65,105,128, h);
   end; 

function derajat=f_yellow(h, s,v)
   if (h==0) && (s==0)
       derajat = 0.0;
   else    
       derajat = f_segitiga(21,43, 65, h);
   end    

function derajat=f_blue(h, s,v )
   if (h==0) && (s==0)
       derajat = 0.0;
   else    
       derajat = f_trapesium(128,155,180,191, h); 
   end;    

function derajat=f_purple(h,s,v)
   if (h==0) && (s==0)
       derajat = 0.0;
   else    
       derajat = f_segitiga(180,191,213, h);
   end

function derajat=f_cyan(h,s,v)
   if (h==0) && (s==0)
       derajat = 0.0;
   else    
       derajat = f_segitiga(105,128,155, h);
   end; 

function derajat=f_orange(h,s,v)
   if (h==0) && (s==0)
       derajat = 0.0;
   else    
       derajat = f_segitiga(0,21,43, h); 
   end; 

function derajat=f_magenta(h,s,v)
   if (h==0) && (s==0)
       derajat = 0.0;
   else    
       derajat = f_segitiga(191,213,234, h);
   end 

function derajat=f_pink(h,s,v)
   if (h==0) && (s==0)
       derajat = 0.0;
   else    
       derajat = f_segitiga(213,234,255, h);
   end;    

function derajat=f_white(h, s,v )
   if (s <= 10) && (v>245)
       derajat = 1.0;
   else
       
       derajat = 0.0;
   end;

function derajat=f_gray(h, s,v )
   if (h==0) && (s==0) && (v>0) && (v<250)
       derajat = 1.0;
   else    
       derajat = 0.0;
   end; 

function derajat=f_black(h, s,v )
   if (h==0) && (s==0) && (v<15)
       derajat = 1.0;
   else    
       derajat = 0.0;
   end; 

function derajat=f_trapesium(a,b,c,d,h)
 
    if (h>a) && (h<b)
        derajat=(h-a)/(b-a);
    else 
        if (h>c) && (h<d)
            derajat=(d-h)/(d-c);
        else
            if (h>=b) && (h<=c)
                derajat=1.0;
            else
                derajat = 0.0;
            end
        end
    end

function derajat=f_segitiga(a,b,c,h)
 
if h==b
    derajat=1.0;
else
    if (h>a) && (h<b)
        derajat=(h-a)/(b-a);
    else 
        if (h>b) && (h<c)
            derajat=(c-h)/(c-b);
        else
            derajat = 0.0;
        end
    end
end

function derajat=f_segitiga_kiri(a,b,h)

if h==b
    derajat=1.0;
else
    if (h>a) && (h<b)
        derajat=(h-a)/(b-a);
    else 
        derajat = 0.0;
    end
end

function derajat=f_segitiga_kanan(a,b,h)
 
if h==a
    derajat=1.0;
else
    if (h>a) && (h<b)
        derajat=(b-h)/(b-a);
    else 
        derajat = 0.0;
    end
end

