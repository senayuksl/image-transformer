% Yeni bir figure (pencere) oluştur
fig = uifigure('Name', 'Renk Tespiti ve Tanımlama', 'Position', [400 200 800 750]);


% "Ana Renk" butonunu ekle
btn1 = uibutton(fig, 'Text', 'ANA RENK TESPİTİ', 'Position', [450 550 300 100],'FontSize', 24,  'FontName', 'Times New Roman','BackgroundColor', [0.5 0.5 0.5], 'FontWeight', 'bold', 'ButtonPushedFcn', @(btn1,event) anaRenkler());

% "Ara Renk" butonunu ekle
btn2 = uibutton(fig, 'Text', 'ARA RENK TESPİTİ', 'Position', [50 550 300 100],'FontSize', 24,  'FontName', 'Times New Roman','BackgroundColor', [0.5 0.5 0.5], 'FontWeight', 'bold', 'ButtonPushedFcn', @(btn2,event) araRenkler());

% "Gri Tonlama" butonunu ekle
btn3 = uibutton(fig, 'Text', 'BULANIKLAŞTIRMA', 'Position', [50 150 300 100],'FontSize', 24,  'FontName', 'Times New Roman','BackgroundColor', [0.5 0.5 0.5], 'FontWeight', 'bold', 'ButtonPushedFcn', @(btn3,event)bulaniklastirma() );

% "Keskinleştirme" butonunu ekle
btn4 = uibutton(fig, 'Text', 'KESKİNLEŞTİRME', 'Position', [450 150 300 100],'FontSize', 24,  'FontName', 'Times New Roman','BackgroundColor',  [0.5 0.5 0.5], 'FontWeight', 'bold', 'ButtonPushedFcn', @(btn4,event) keskinlestirme());

% "Bulanıklaştırma" butonunu ekle
btn5 = uibutton(fig, 'Text', 'GRİ TONLAMA', 'Position', [50 350 300 100],'FontSize', 24,  'FontName', 'Times New Roman','BackgroundColor',  [0.5 0.5 0.5], 'FontWeight', 'bold', 'ButtonPushedFcn', @(btn5,event)griTonlama() );

% "Negatif Tonlama" butonunu ekle
btn6 = uibutton(fig, 'Text', 'NEGATİF TONLAMA', 'Position', [450 350 300 100],'FontSize', 24,  'FontName', 'Times New Roman','BackgroundColor',  [0.5 0.5 0.5], 'FontWeight', 'bold', 'ButtonPushedFcn', @(btn6,event) negatifTonlama())

function baslangicPenceresi() 
end


function griTonlama()
    % Dosya seç
    [dosyaAdi, dosyaYolu] = uigetfile({'*.jpg;*.png;*.bmp', 'Resim Dosyaları (*.jpg, *.png, *.bmp)'});
    
    % Seçilen dosyayı yükle
    if dosyaAdi ~= 0
        dosyaYoluVeAdi = fullfile(dosyaYolu, dosyaAdi);
        resim = imread(dosyaYoluVeAdi);
        
        % Gri tonlama işlemi
        griResim = rgb2gray(resim);
        
        % Orijinal ve gri tonlanmış resmi göster
        figure;
        subplot(1, 2, 1);
        imshow(resim);
        title('Orijinal Resim');
        
        subplot(1, 2, 2);
        imshow(griResim);
        title('Gri Tonlama');
        
        
    end
end


function keskinlestirme()
    % Dosya seç
    [dosyaAdi, dosyaYolu] = uigetfile({'*.jpg;*.png;*.bmp', 'Resim Dosyaları (*.jpg, *.png, *.bmp)'});
    
    % Seçilen dosyayı yükle
    if dosyaAdi ~= 0
        dosyaYoluVeAdi = fullfile(dosyaYolu, dosyaAdi);
        resim = imread(dosyaYoluVeAdi);
        
        % Keskinleştirme işlemi
        keskinResim = imsharpen(resim);
        
        % Orijinal ve keskinleştirilmiş resmi göster
        figure;
        subplot(1, 2, 1);
        imshow(resim);
        title('Orijinal Resim');
        
        subplot(1, 2, 2);
        imshow(keskinResim);
        title('Keskinleştirme');
    end
end

function bulaniklastirma()
    % Dosya seç
    [dosyaAdi, dosyaYolu] = uigetfile({'*.jpg;*.png;*.bmp', 'Resim Dosyaları (*.jpg, *.png, *.bmp)'});
    
    % Seçilen dosyayı yükle
    if dosyaAdi ~= 0
        dosyaYoluVeAdi = fullfile(dosyaYolu, dosyaAdi);
        resim = imread(dosyaYoluVeAdi);
        
        % Bulanıklaştırma işlemi
        bulanikResim = imgaussfilt(resim, 3);
        
        % Orijinal ve bulanıklaştırılmış resmi göster
        figure;
        subplot(1, 2, 1);
        imshow(resim);
        title('Orijinal Resim');
        
        subplot(1, 2, 2);
        imshow(bulanikResim);
        title('Bulanıklaştırma');
    end
end

function negatifTonlama()
    % Dosya seç
    [dosyaAdi, dosyaYolu] = uigetfile({'*.jpg;*.png;*.bmp', 'Resim Dosyaları (*.jpg, *.png, *.bmp)'});
    
    % Seçilen dosyayı yükle
    if dosyaAdi ~= 0
        dosyaYoluVeAdi = fullfile(dosyaYolu, dosyaAdi);
        resim = imread(dosyaYoluVeAdi);
        
        
        % Negatif tonlama işlemi
        negatifResim = 255 - resim;
        
        % Orijinal ve negatif tonlanmış resmi göster
        figure;
        subplot(1, 2, 1);
        imshow(resim);
        title('Orijinal Resim');
        
        subplot(1, 2, 2);
        imshow(negatifResim);
        title('Negatif Tonlama');

    end
  
end


function anaRenkler()
    anaRenkFig = uifigure('Name', 'Ana Renkler', 'Position', [400 250 800 750]);
    
    % Kırmızı Butonu
    anaRenkBtn1 = uibutton(anaRenkFig, 'Text', 'Mavi', 'Position', [550 300 200 200], 'FontSize', 36, ...
        'FontName', 'Times New Roman','BackgroundColor', [0 0 1],'ButtonPushedFcn', @(anaRenkBtn1,event) tespit('mavi'));
    
    % Yeşil Butonu
    anaRenkBtn2 = uibutton(anaRenkFig, 'Text', 'Yeşil', 'Position', [300 300 200 200], 'FontSize', 36,  ...
        'FontName', 'Times New Roman','BackgroundColor', [0 1 0], 'ButtonPushedFcn', @(anaRenkBtn2,event) tespit('yesil'));
    
    % Mavi Butonu
    anaRenkBtn3 = uibutton(anaRenkFig, 'Text', 'Kırmızı', 'Position', [50 300 200 200],  'FontSize', 36,  ...
        'FontName', 'Times New Roman','BackgroundColor', [1 0 0], 'ButtonPushedFcn', @(anaRenkBtn3,event) tespit('kirmizi'));

    % Geri Dön Butonu
    geriDonBtn = uibutton(anaRenkFig, 'Text', 'Geri Dön', 'Position', [650 50 100 50], 'FontSize', 20, ...
        'FontName', 'Times New Roman','BackgroundColor', [0.5 0.5 0.5],'ButtonPushedFcn', @(geriDonBtn,event) geriDon());
    
    function geriDon()
        close(anaRenkFig); % Ana Renkler penceresini kapat
        baslangicPenceresi(); % Başlangıç penceresini aç
    end
end


function araRenkler()
    araRenkFig = uifigure('Name', 'Ara Renkler', 'Position', [400 250 800 750]);
    
    % Turuncu Butonu
    araRenkBtn1 = uibutton(araRenkFig, 'Text', 'Turuncu', 'Position', [550 300 200 200], 'FontSize', 36,  ...
        'FontName', 'Times New Roman','BackgroundColor', [1 0.5 0],'ButtonPushedFcn', @(araRenkBtn1,event) tespit('turuncu'));
    
    % Mor Butonu
    araRenkBtn2 = uibutton(araRenkFig, 'Text', 'Mor', 'Position', [300 300 200 200], 'FontSize', 36,  ...
        'FontName', 'Times New Roman','BackgroundColor', [0.5 0 0.5], 'ButtonPushedFcn', @(araRenkBtn2,event) tespit('mor'));
    
    % Sarı Butonu
    araRenkBtn3 = uibutton(araRenkFig, 'Text', 'Sarı', 'Position', [50 300 200 200],  'FontSize', 36,  ...
        'FontName', 'Times New Roman','BackgroundColor', [1 1 0], 'ButtonPushedFcn', @(araRenkBtn3,event) tespit('sari'));

     % Geri Dön Butonu
    geriDonBtn = uibutton(araRenkFig, 'Text', 'Geri Dön', 'Position', [650 50 100 50], 'FontSize', 20, ...
        'FontName', 'Times New Roman','BackgroundColor', [0.5 0.5 0.5], 'ButtonPushedFcn', @(geriDonBtn,event) geriDon());
    
    function geriDon()
        close(araRenkFig); % Ana Renkler penceresini kapat
        baslangicPenceresi(); % Başlangıç penceresini aç
    end
end


function tespit(secilenRenk)
    % Resmi yükle
    resim = imread('3.jpg'); % Resmin dosya yolunu belirt
    % Resmi hsv'ye dönüştür
    hsv_image = rgb2hsv(resim);
    
    % Kırmızı rengi tespit et
    hsv_red_mask = (hsv_image(:,:,1) < 0.05 | hsv_image(:,:,1) > 0.95);
    rgb_red_mask = resim(:,:,1) > 165 & resim(:,:,2) < 100 & resim(:,:,3) < 100;
    combined_red_mask = hsv_red_mask & rgb_red_mask;

    % Yeşil rengi tespit et
    hsv_green_mask = (hsv_image(:,:,1) > 0.05 & hsv_image(:,:,1) < 0.75);
    rgb_green_mask = resim(:,:,1) < 100 & resim(:,:,2) >75 & resim(:,:,3) < 140;
    combined_green_mask = hsv_green_mask & rgb_green_mask;

    % Mavi rengi tespit et
    hsv_blue_mask = (hsv_image(:,:,1) > 0.5 & hsv_image(:,:,1) < 0.75);
    rgb_blue_mask = resim(:,:,1) < 100 & resim(:,:,2) < 150 & resim(:,:,3) > 50;
    combined_blue_mask = hsv_blue_mask & rgb_blue_mask;

    % Turuncu rengi tespit et
    hsv_orange_mask = (hsv_image(:,:,1) > 0.05 & hsv_image(:,:,1) < 0.1);
    rgb_orange_mask = (resim(:,:,1) > 200 & resim(:,:,2) > 120 & resim(:,:,3) < 100);
    combined_orange_mask = hsv_orange_mask & rgb_orange_mask;

    % Sarı rengi tespit et
    hsv_yellow_mask = (hsv_image(:,:,1) > 0.1 & hsv_image(:,:,1) < 0.45);
    rgb_yellow_mask = (resim(:,:,1) > 180 & resim(:,:,2) > 180 & resim(:,:,3) < 100);
    combined_yellow_mask = hsv_yellow_mask & rgb_yellow_mask;

    % Mor rengi tespit et
    hsv_purple_mask = (hsv_image(:,:,1) > 0.75 & hsv_image(:,:,1) < 0.95);
    rgb_purple_mask = (resim(:,:,1) > 140 & resim(:,:,2) < 100 & resim(:,:,3) > 100);
    combined_purple_mask = hsv_purple_mask & rgb_purple_mask;

    % Diğer renkleri siyah yap
    combined_red_only = bsxfun(@times, resim, cast(combined_red_mask, 'like', resim));
    combined_green_only = bsxfun(@times, resim, cast(combined_green_mask, 'like', resim));
    combined_blue_only = bsxfun(@times, resim, cast(combined_blue_mask, 'like', resim));
    combined_orange_only = bsxfun(@times, resim, cast(combined_orange_mask, 'like', resim));
    combined_yellow_only = bsxfun(@times, resim, cast(combined_yellow_mask, 'like', resim));
    combined_purple_only = bsxfun(@times, resim, cast(combined_purple_mask, 'like', resim));
    
    % Seçilen rengi göster
    switch secilenRenk
        case 'kirmizi'
            subplot(1, 2, 1); % Subplot oluştur
            imshow(resim); % Orijinal resmi göster
            title('ORİJİNAL RESİM'); % Subplot başlığı ekle
            subplot(1, 2, 2); % Subplot oluştur
            imshow(combined_red_only);
            title('KIRMIZI'); % Subplot başlığı ekle
        case 'yesil'
            subplot(1, 2, 1); % Subplot oluştur
            imshow(resim); % Orijinal resmi göster
            title('ORİJİNAL RESİM'); % Subplot başlığı ekle
            subplot(1, 2, 2); % Subplot oluştur
            imshow(combined_green_only);
            title('YEŞİL'); % Subplot başlığı ekle
        case 'mavi'
            subplot(1, 2, 1); % Subplot oluştur
            imshow(resim); % Orijinal resmi göster
            title('ORİJİNAL RESİM'); % Subplot başlığı ekle
            subplot(1, 2, 2); % Subplot oluştur
            imshow(combined_blue_only);
            title('MAVİ'); % Subplot başlığı ekle
        case 'turuncu'
            subplot(1, 2, 1); % Subplot oluştur
            imshow(resim); % Orijinal resmi göster
            title('ORİJİNAL RESİM'); % Subplot başlığı ekle
            subplot(1, 2, 2); % Subplot oluştur
            imshow(combined_orange_only);
            title('TURUNCU'); % Subplot başlığı ekle
        case 'sari'
            subplot(1, 2, 1); % Subplot oluştur
            imshow(resim); % Orijinal resmi göster
            title('ORİJİNAL RESİM'); % Subplot başlığı ekle
            subplot(1, 2, 2); % Subplot oluştur
            imshow(combined_yellow_only);
            title('SARI'); % Subplot başlığı ekle
        case 'mor'
            subplot(1, 2, 1); % Subplot oluştur
            imshow(resim); % Orijinal resmi göster
            title('ORİJİNAL RESİM'); % Subplot başlığı ekle
            subplot(1, 2, 2); % Subplot oluştur
            imshow(combined_purple_only);
            title('MOR'); % Subplot başlığı ekle
        otherwise
            % Seçilen renk yoksa orijinal görüntüyü göster
            subplot(1, 1, 1); % Varsayılan olarak orijinal resmi göster
            imshow(resim);
            title('Orijinal Resim');
    end
end
