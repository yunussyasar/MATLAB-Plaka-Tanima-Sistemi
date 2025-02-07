clc;           
clear;        
close all;  

di=dir('letters_numbers'); % 'letters_numbers' klasöründeki dosyaları listeler
st={di.name}; % Dosya adlarını bir hücre dizisine alır
nam=st(3:end); % İlk iki giriş ('.' ve '..') hariç tutulur

imgfile=cell(2,length(nam)); % 2 satırlı bir hücre matrisi oluşturur (birinci satır görüntüler, ikinci satır karakterler için)

for i=1:length(nam)
   imgfile(1,i)={imread(['letters_numbers','\',cell2mat(nam(i))])}; % Her bir dosyayı okuyarak görüntüyü imgfile'ın ilk satırına ekler
   temp=cell2mat(nam(i)); % Dosya adını bir stringe dönüştürür
   imgfile(2,i)={temp(1)}; % Dosya adının ilk karakterini (ör. 'A', '1') imgfile'ın ikinci satırına ekler
end

save('imgfildata.mat','imgfile'); % imgfile hücre matrisini 'imgfildata.mat' dosyasına kaydeder
clear; % Çalışma alanını temizler
