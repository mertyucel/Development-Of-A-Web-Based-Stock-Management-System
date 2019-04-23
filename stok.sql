-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 23 Nis 2019, 11:55:21
-- Sunucu sürümü: 10.1.29-MariaDB
-- PHP Sürümü: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `stok`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `faturalar`
--

CREATE TABLE `faturalar` (
  `id` int(11) NOT NULL,
  `musteriid` int(11) NOT NULL,
  `fatura_no` varchar(255) NOT NULL,
  `tutar` varchar(255) NOT NULL,
  `aciklama` text,
  `tip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `faturalar`
--

INSERT INTO `faturalar` (`id`, `musteriid`, `fatura_no`, `tutar`, `aciklama`, `tip`) VALUES
(1, 1, '55555', '11000', 'Ödeme', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kasa`
--

CREATE TABLE `kasa` (
  `id` int(11) NOT NULL,
  `ad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kasa`
--

INSERT INTO `kasa` (`id`, `ad`) VALUES
(1, 'Nakit'),
(2, 'Vadeli');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `ad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kategori`
--

INSERT INTO `kategori` (`id`, `ad`) VALUES
(1, 'Okul'),
(2, 'Hastane'),
(3, 'Banka');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteriler`
--

CREATE TABLE `musteriler` (
  `id` int(11) NOT NULL,
  `ad` varchar(250) NOT NULL,
  `soyad` varchar(250) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefon` varchar(255) DEFAULT NULL,
  `adres` varchar(250) NOT NULL,
  `tc` varchar(11) DEFAULT NULL,
  `notu` text,
  `sirket` varchar(250) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `musteriler`
--

INSERT INTO `musteriler` (`id`, `ad`, `soyad`, `email`, `telefon`, `adres`, `tc`, `notu`, `sirket`, `date`) VALUES
(1, 'Mert', 'Yücel', 'mertycl10@gmail.com', '506 623 15 10', 'Gaziantep', '21439110455', 'Anlık', 'Asc Aş', '2019-04-23'),
(2, 'Ali', 'Yılmaz', 'tayfunerbilen@gmail.com', '506 623 15 11', 'istanbul', '21439110454', 'Deneme', 'Hizmet AŞ', '2019-04-23');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `stok`
--

CREATE TABLE `stok` (
  `id` int(11) NOT NULL,
  `urun_id` int(11) NOT NULL,
  `islem_tipi` int(11) NOT NULL,
  `adet` int(11) NOT NULL,
  `fiyat` double NOT NULL,
  `date` date NOT NULL,
  `musteri_id` int(11) NOT NULL,
  `kasa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `stok`
--

INSERT INTO `stok` (`id`, `urun_id`, `islem_tipi`, `adet`, `fiyat`, `date`, `musteri_id`, `kasa_id`) VALUES
(1, 1, 0, 500, 1, '2019-04-23', 1, 1),
(2, 2, 0, 100, 4, '2019-04-23', 1, 2),
(3, 3, 1, 500, 1000, '2019-04-23', 2, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunler`
--

CREATE TABLE `urunler` (
  `id` int(11) NOT NULL,
  `ad` varchar(250) NOT NULL,
  `kategoriId` int(11) NOT NULL,
  `ozellikler` text,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `urunler`
--

INSERT INTO `urunler` (`id`, `ad`, `kategoriId`, `ozellikler`, `date`) VALUES
(1, 'Kitap', 1, '[{\"name\":\"Ders Kitab\\u0131\",\"value\":\"Tarih\"},{\"name\":\"Soru Bankas\\u0131\",\"value\":\"Co\\u011frafya\"},{\"name\":\"Deneme Testi\",\"value\":\"Matematik\"}]', '2019-04-23'),
(2, 'İlaç', 2, '[{\"name\":\"Grip \\u0130lac\\u0131\",\"value\":\"Abc Markas\\u0131\"}]', '2019-04-23'),
(3, 'İğne', 0, '[{\"name\":\"A\\u011fr\\u0131 Kesici\",\"value\":\"Aferin\"},{\"name\":\"Antibiyotik\",\"value\":\"Cerman\"}]', '2019-04-23'),
(4, 'Vadeli Hesapları', 3, '[{\"name\":\"Emeklilik hesab\\u0131\",\"value\":\"Ay\\u015fe Han\\u0131m\"},{\"name\":\"\\u00d6\\u011frenici Hesab\\u0131\",\"value\":\"Emre Bey\"},{\"name\":\"Memur Hesab\\u0131\",\"value\":\"Ali Bey\"},{\"name\":\"\\u00d6\\u011fretmen Hesab\\u0131\",\"value\":\"Fatma Han\\u0131m\"}]', '2019-04-23');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uyeler`
--

CREATE TABLE `uyeler` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `uyeler`
--

INSERT INTO `uyeler` (`id`, `name`, `email`, `password`) VALUES
(1, 'Mert ', 'mertycl10@gmail.com', '21232f297a57a5a743894a0e4a801fc3');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `faturalar`
--
ALTER TABLE `faturalar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kasa`
--
ALTER TABLE `kasa`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `musteriler`
--
ALTER TABLE `musteriler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `urunler`
--
ALTER TABLE `urunler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `uyeler`
--
ALTER TABLE `uyeler`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `faturalar`
--
ALTER TABLE `faturalar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `kasa`
--
ALTER TABLE `kasa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `musteriler`
--
ALTER TABLE `musteriler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `stok`
--
ALTER TABLE `stok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `urunler`
--
ALTER TABLE `urunler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `uyeler`
--
ALTER TABLE `uyeler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
