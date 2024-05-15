-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 02 Oca 2024, 17:18:23
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `hms project`
--

DELIMITER $$
--
-- Yordamlar
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckUserPermissions` (IN `username` VARCHAR(255))   BEGIN
    DECLARE isAdmin BOOLEAN;

    -- Kullanıcının admin olup olmadığını kontrol et
    SELECT COUNT(*) INTO isAdmin
    FROM users
    WHERE username = username AND isAdmin = 1;

    -- Kullanıcı adminse, gerekli işlemleri gerçekleştir
    IF isAdmin THEN
        -- Admin özel işlemleri burada yapılabilir
        SELECT 'Admin olarak giriş yaptınız.';
    ELSE
        -- Admin değilse, normal kullanıcı işlemleri burada yapılabilir
        SELECT 'Normal kullanıcı olarak giriş yaptınız.';
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDoctorAppointments` (IN `doctorName` VARCHAR(255))   BEGIN
    SELECT doctor.*, appointment.*
    FROM doctor
    INNER JOIN appointment ON doctor.id = appointment.doctor_name
    WHERE doctor.first_name = doctorName OR doctor.last_name = doctorName;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `appointment`
--

CREATE TABLE `appointment` (
  `id` int(10) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `doctor_name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `appointment`
--

INSERT INTO `appointment` (`id`, `patient_name`, `department`, `doctor_name`, `date`, `time`, `email`, `phone`) VALUES
(11, 'Samet', 'Dentists', '', '18/01/2024', '7:25 AM', 'asdas@gmail.com', '1234567');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `complain`
--

CREATE TABLE `complain` (
  `id` int(10) NOT NULL,
  `message` varchar(500) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `subject` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `complain`
--

INSERT INTO `complain` (`id`, `message`, `name`, `email`, `subject`) VALUES
(1, 'wdawdws', 'awdawd', 'awdw', 'adwwd'),
(2, 'Definition of complain. intransitive verb. 1 : to express grief, pain, or discontent complaining about the weather. 2 : to make a formal accusation or charge He threatened to complain of him to the captain.', 'Isaiah L. Smith', 'gmhs13@yopmail.com', 'dafsgd'),
(3, 'redtfyguhijo', 'simanto', 'gmhs13@yopmail.com', 'ytguijopk['),
(4, 'abcabcbacbacbabc', 'Isaiah L. Smith', 'gmhs13@yopmail.com', 'dadsvfbgfng');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `department_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `departments`
--

INSERT INTO `departments` (`id`, `department_name`, `department_desc`) VALUES
(21, 'Nöroloji', 'Nöroloji, sinir sistemi hastalıkları ile ilgilenen tıp dalıdır. Beyin, omurilik, sinirler ve kasların bozukluklarını teşhis ve tedavi eder.'),
(22, 'Kanser Tedavileri', 'Kanser tedavileri, cerrahi, kemoterapi, radyoterapi gibi yöntemlerle kanserle mücadele eder; multidisipliner yaklaşım, hasta özelleştirilmiş tedaviyi vurgular.'),
(23, 'Göz Hastalıkları', '\r\nGöz Hastalıkları departmanı, gözle ilgili rahatsızlıkların tanı ve tedavisini yapan bir tıp alanıdır. Göz cerrahisi, retina tedavisi, katarakt ameliyatları gibi çeşitli alanlarda uzmanlaşmıştır.'),
(24, 'Psikiatri', 'Psikiatri, zihinsel sağlık sorunları ve duygusal bozukluklarla ilgilenen tıp dalıdır. Psikiyatristler, terapi, ilaç tedavisi ve diğer yöntemlerle hastaların mental sağlığını değerlendirir ve iyileştirme sürecine rehberlik ederler.\r\n\r\n\r\n\r\n\r\n\r\n\r\n');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `doctor`
--

CREATE TABLE `doctor` (
  `id` int(10) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `dob` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `image` text NOT NULL,
  `department` varchar(50) NOT NULL,
  `biography` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `doctor`
--

INSERT INTO `doctor` (`id`, `first_name`, `last_name`, `email`, `dob`, `gender`, `address`, `phone`, `image`, `department`, `biography`) VALUES
(43, 'Abdülsamet', 'Rözgar', 'asdas@gmail.com', '02/01/2024', 'undefined', 'acarlar mah özgür sok', '05342772804', 'samet.jpeg', 'Nöroloji', 'sdasdwqwe'),
(44, 'Ecemnur', 'Akatmacı', 'Ecem@gmail.com', '02/01/2000', 'female', 'acarlar mah özgür sok', '05342772804', 'ecem.jpeg', 'Nöroloji', 'sdfdssdfdsggsdsffdsg'),
(45, 'Kemal ', 'Beydilli', 'kemal@gmail.com', '02/01/1994', 'male', 'asfffffffffsdfsd', '05342772804', 'kemal.jpeg', 'Psikiatri', 'asddfsda'),
(46, 'Özgür Cagatay', 'Su', 'ozgur@gmail.com', '02/01/2000', 'male', 'sdfsdf', 'sdfsdfsdf', 'ozgur.jpeg', 'Göz Hastalıkları', 'sdfsdfsdf'),
(47, 'Ata ', 'Guler', 'ata@gmail.com', '02/01/2000', 'male', 'asfsdf', 'sdfsdf', 'black-cat-fire-eyes.jpg', 'Nöroloji', 'dfsdfsd');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `employee`
--

CREATE TABLE `employee` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `join_date` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `salary` varchar(10) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `leaves`
--

CREATE TABLE `leaves` (
  `id` int(10) NOT NULL,
  `employee` varchar(255) NOT NULL,
  `emp_id` int(10) NOT NULL,
  `leave_type` varchar(255) NOT NULL,
  `date_from` varchar(255) NOT NULL,
  `date_to` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `login`
--

CREATE TABLE `login` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `email`) VALUES
(1, 'test', 'test', 'gmhs13@yopmail.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `store`
--

CREATE TABLE `store` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `p_date` varchar(255) NOT NULL,
  `expire` varchar(255) NOT NULL,
  `expire_end` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `store`
--

INSERT INTO `store` (`id`, `name`, `p_date`, `expire`, `expire_end`, `price`, `quantity`) VALUES
(4, 'Napa', '20/03/2020', '2', '19/03/2020', '8', '100');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `temp`
--

CREATE TABLE `temp` (
  `id` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `temp`
--

INSERT INTO `temp` (`id`, `email`, `token`) VALUES
(19, 'test555@yopmail.com', '46fn0pl3'),
(19, 'test555@yopmail.com', 'w6pvf2oq'),
(21, 'te555@yopmail.com', '9sfs6gu8');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `email_status`) VALUES
(9, 'zihad', 'zihad.1d@yopmail.com', '123', 'verified'),
(19, 'test', 'test555@yopmail.com', '123', 'verified'),
(20, 'abc', 'gmhs13@yopmail.com', '12345', 'not_verified'),
(21, 'alamin', 'te555@yopmail.com', 'abc', 'verified');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `verify`
--

CREATE TABLE `verify` (
  `id` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `verify`
--

INSERT INTO `verify` (`id`, `username`, `email`, `token`) VALUES
(4, 'zihad', 'zihad.1d@yopmail.com', 'lp5ux5ik'),
(14, 'test', 'test555@yopmail.com', '3udlo9v6'),
(15, 'abc', 'gmhs13@yopmail.com', 'w2px024k'),
(16, 'alamin', 'te555@yopmail.com', 'ix8enxdh');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `complain`
--
ALTER TABLE `complain`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- Tablo için indeksler `verify`
--
ALTER TABLE `verify`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `complain`
--
ALTER TABLE `complain`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Tablo için AUTO_INCREMENT değeri `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Tablo için AUTO_INCREMENT değeri `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `login`
--
ALTER TABLE `login`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `store`
--
ALTER TABLE `store`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

ALTER TABLE `doctor`
  ADD CONSTRAINT `fk_doctor_department`
  FOREIGN KEY (`department`)
  REFERENCES `departments` (`id`)
  ON DELETE CASCADE;

ALTER TABLE `appointment`
  MODIFY COLUMN `email` varchar(255) NOT NULL;

ALTER TABLE `doctor`
  MODIFY COLUMN `first_name` varchar(255) NOT NULL;

ALTER TABLE `appointment`
  ADD CONSTRAINT `chk_email_lowercase`
  CHECK (BINARY `email` = LOWER(`email`));

ALTER TABLE `appointment`
  ADD CONSTRAINT `chk_phone_format`
  CHECK (LENGTH(`phone`) = 11 AND `phone` REGEXP '^[0-9]+$');

ALTER TABLE `appointment`
  ADD CONSTRAINT `chk_date_format`
  CHECK (STR_TO_DATE(`date`, '%d/%m/%Y') IS NOT NULL);

ALTER TABLE `departments`
  ADD CONSTRAINT `chk_department_name_length`
  CHECK (LENGTH(`department_name`) BETWEEN 3 AND 50);

ALTER TABLE `appointment`
  ADD CONSTRAINT `chk_time_range`
  CHECK (STR_TO_DATE(`time`, '%h:%i %p') BETWEEN STR_TO_DATE('07:00 AM', '%h:%i %p') AND STR_TO_DATE('08:00 PM', '%h:%i %p'));

ALTER TABLE doctor
  ADD CONSTRAINT chk_doctor_name_not_null
  CHECK (first_name IS NOT NULL AND TRIM(first_name) <> '');

  ALTER TABLE doctor
  ADD CONSTRAINT chk_doctor_last_name_not_null
  CHECK (last_name IS NOT NULL AND TRIM(last_name) <> '');

ALTER TABLE `users`
ADD CONSTRAINT `unique_email`
UNIQUE (`email`);
