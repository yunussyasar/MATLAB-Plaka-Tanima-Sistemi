function np=number_plate(img)
%Görüntü korelasyon yöntemi
%2 matris karşılaştırır
load('imgfildata.mat');
[~,cc]=size(img);
picture=imresize(img,[300 500]);

if size(picture,3)==3
  picture=rgb2gray(picture);  %Gri değerler 0 ile 1 veya 0 ile 255 arasında olur
end

threshold = graythresh(picture);  %Gri tonlu görüntünün eşik değerini belirler
picture =~im2bw(picture,threshold);   %İkili (siyah-beyaz) görüntüye dönüştürür ve beyaz ile siyah değerlerini ters çevirir
picture = bwareaopen(picture,30);  %30 pikselden küçük olan nesneler kaldırılır

if cc>2000
    picture1=bwareaopen(picture,3500);  %3500 pikselden küçük olan nesneler kaldırılır (plaka hariç)
else
picture1=bwareaopen(picture,3000);  %3000 pikselden küçük olan nesneler kaldırılır (plaka hariç)
end

picture2=picture-picture1;  %Sadece plaka kısmı kalır


picture2=bwareaopen(picture2,200);   %Plaka üzerindeki yalnızca metinler kalır


[L,Ne]=bwlabel(picture2);  %L matrisi plaka bilgilerini içerir, Ne ise karakter veya rakam sayısını verir


final_output=[];
t=[];
for n=1:Ne
  [r,c] = find(L==n);   
  n1=picture(min(r):max(r),min(c):max(c));   %L'deki n. nesneyi kesip alır
  n1=imresize(n1,[42,24]);     %Veritabanındaki boyut 42x24 olduğu için aynı boyuta yeniden ölçeklenir
 
  
  x=[ ];

totalLetters=size(imgfile,2);

 for k=1:totalLetters
    
    y=corr2(imgfile{1,k},n1); %Korelasyon katsayısını hesaplar
    x=[x y];
    
 end
%  t=[t max(x)];
 if max(x)>.35
 z=find(x==max(x));
 out=cell2mat(imgfile(2,z));

final_output=[final_output out];
end
end

np=final_output;


end
