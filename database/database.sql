-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 09, 2022 at 01:42 AM
-- Server version: 5.7.24
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_wablash2`
--

-- --------------------------------------------------------

--
-- Table structure for table `midtrans_payment_notification`
--

CREATE TABLE `midtrans_payment_notification` (
  `id` int(11) NOT NULL,
  `transaction_time` varchar(100) DEFAULT NULL,
  `transaction_status` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(200) DEFAULT NULL,
  `store` varchar(200) DEFAULT NULL,
  `status_message` varchar(100) DEFAULT NULL,
  `status_code` varchar(50) DEFAULT NULL,
  `signature_key` varchar(200) DEFAULT NULL,
  `payment_type` varchar(40) DEFAULT NULL,
  `payment_code` varchar(50) DEFAULT NULL,
  `order_id` varchar(100) DEFAULT NULL,
  `merchant_id` varchar(100) DEFAULT NULL,
  `gross_amount` int(50) DEFAULT NULL,
  `fraud_status` varchar(200) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `eci` int(11) DEFAULT NULL,
  `channel_response_message` varchar(50) DEFAULT NULL,
  `channel_response_code` varchar(50) DEFAULT NULL,
  `card_type` varchar(40) DEFAULT NULL,
  `bank` varchar(40) DEFAULT NULL,
  `approval_code` varchar(20) DEFAULT NULL,
  `masked_card` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `midtrans_transaction_detail`
--

CREATE TABLE `midtrans_transaction_detail` (
  `id` int(11) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `gross_amount` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_autoreply`
--

CREATE TABLE `tb_autoreply` (
  `id` int(11) NOT NULL,
  `instance_key` varchar(50) NOT NULL,
  `receive` varchar(200) NOT NULL,
  `reply` varchar(200) NOT NULL,
  `type` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_autoreply`
--

INSERT INTO `tb_autoreply` (`id`, `instance_key`, `receive`, `reply`, `type`, `status`) VALUES
(3, '3J9MsD6vd2d0', 'hello', 'hai', '1', 1),
(4, 'in73vy6JbUxI', 'hai', 'hello', '1', 0),
(5, 'in73vy6JbUxI', '!hello', 'hai', '1', 0),
(6, 'K0fhwvBKQIw5', '!hello', 'gege', '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_broadcast`
--

CREATE TABLE `tb_broadcast` (
  `id` int(11) NOT NULL,
  `broadcast_name` varchar(100) NOT NULL,
  `instance_id` int(11) NOT NULL,
  `id_list` int(11) NOT NULL,
  `message` text NOT NULL,
  `date_time` datetime NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_broadcast`
--

INSERT INTO `tb_broadcast` (`id`, `broadcast_name`, `instance_id`, `id_list`, `message`, `date_time`, `id_user`, `status`) VALUES
(12, 'Calon Member 2', 16, 2, 'popo', '2021-12-28 13:20:00', 18, 3),
(14, 'Calon Member', 17, 4, 'yuyu', '2021-12-28 13:33:00', 19, 3),
(15, 'Calon Member 2', 17, 4, 'bro', '2021-12-28 13:34:00', 19, 3),
(16, 'Calon Member', 17, 4, 'das', '2021-12-28 13:35:00', 19, 3),
(17, 'Calon Member 7', 19, 4, 'oioi', '2021-12-28 21:05:00', 19, 3),
(18, 'Calon Member', 19, 4, 'hello', '2021-12-28 21:10:00', 19, 3),
(19, 'Calon Member', 1, 4, 'hello', '2021-12-29 08:38:00', 19, 3),
(20, 'Calon Member 4', 2, 4, 'hello', '2021-12-29 09:07:00', 19, 3),
(21, 'Calon Member 2', 2, 4, 'ii', '2021-12-29 09:10:00', 19, 3),
(22, 'Calon Member 2', 3, 4, 'yuyu', '2021-12-29 09:26:00', 19, 3),
(23, 'Calon Member', 14, 4, 'hello', '2022-01-07 23:47:00', 19, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_broadcast_detail`
--

CREATE TABLE `tb_broadcast_detail` (
  `id` int(11) NOT NULL,
  `id_broadcast` int(11) NOT NULL,
  `id_message` varchar(100) DEFAULT NULL,
  `sender` varchar(50) NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `response` text NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_broadcast_detail`
--

INSERT INTO `tb_broadcast_detail` (`id`, `id_broadcast`, `id_message`, `sender`, `receiver`, `status`, `response`, `date_time`) VALUES
(89, 12, NULL, '16', '7', 1, 'response', '2021-12-28 13:20:00'),
(90, 12, NULL, '16', '8', 1, 'response', '2021-12-28 13:20:00'),
(91, 12, NULL, '16', '11', 1, 'response', '2021-12-28 13:20:00'),
(92, 12, NULL, '16', '13', 1, 'response', '2021-12-28 13:20:00'),
(93, 12, NULL, '16', '14', 1, 'response', '2021-12-28 13:20:00'),
(94, 12, NULL, '16', '15', 1, 'response', '2021-12-28 13:20:00'),
(95, 12, NULL, '16', '16', 1, 'response', '2021-12-28 13:20:00'),
(96, 12, NULL, '16', '17', 1, 'response', '2021-12-28 13:20:00'),
(97, 12, NULL, '16', '18', 1, 'response', '2021-12-28 13:20:00'),
(98, 12, NULL, '16', '19', 1, 'response', '2021-12-28 13:20:00'),
(99, 12, NULL, '16', '20', 1, 'response', '2021-12-28 13:20:00'),
(102, 14, NULL, '17', '28', 1, 'response', '2021-12-28 13:33:02'),
(103, 14, NULL, '17', '29', 1, 'response', '2021-12-28 13:33:02'),
(104, 15, NULL, '17', '28', 1, 'response', '2021-12-28 13:34:00'),
(105, 15, NULL, '17', '29', 1, 'response', '2021-12-28 13:34:00'),
(106, 16, NULL, '17', '28', 1, 'response', '2021-12-28 13:36:59'),
(107, 16, NULL, '17', '29', 1, 'response', '2021-12-28 13:36:59'),
(108, 17, NULL, '19', '28', 3, 'response', '2021-12-28 21:05:00'),
(109, 17, NULL, '19', '29', 3, 'response', '2021-12-28 21:05:00'),
(110, 18, NULL, '19', '29', 3, 'response', '2021-12-28 21:10:00'),
(111, 19, NULL, '1', '29', 1, 'response', '2021-12-29 08:39:01'),
(112, 20, NULL, '2', '29', 1, 'response', '2021-12-29 09:07:00'),
(113, 21, NULL, '2', '29', 3, 'response', '2021-12-29 09:10:00'),
(114, 22, NULL, '3', '29', 1, 'response', '2021-12-29 09:27:00'),
(115, 22, NULL, '3', '30', 1, 'response', '2021-12-29 09:27:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_contact`
--

CREATE TABLE `tb_contact` (
  `id` int(11) NOT NULL,
  `id_group` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(100) NOT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_contact`
--

INSERT INTO `tb_contact` (`id`, `id_group`, `name`, `number`, `block`, `id_user`) VALUES
(7, 2, 'Nova', '62895361034833', 0, 18),
(8, 2, 'Nono', '62895361034833', 0, 18),
(11, 2, 'Boro', '62895361034833', 0, 18),
(12, 0, 'Sika', '62895361034833', 0, 18),
(13, 2, 'Siki', '62895361034833', 0, 18),
(14, 2, 'Boru', '62895361034833', 0, 18),
(15, 2, 'Nono', '62895361034833', 0, 18),
(16, 2, 'mimin', '62895361034833', 0, 18),
(17, 2, 'Nova', '62895361034833', 0, 18),
(18, 2, 'Nono', '62895361034833', 0, 18),
(19, 2, 'Nova', '62895361034833', 0, 18),
(20, 2, 'Nonou', '62895361034833', 0, 18),
(26, 3, 'Nova', '62895361034833', 0, 18),
(27, 3, 'Nono', '62895361034833', 0, 18),
(29, 4, 'Nono', '6285156345912', 0, 19),
(30, 4, 'kejarkoding', '62895361034833', 0, 19),
(31, 5, 'Nova', '62895361034833', 0, 19),
(32, 5, 'Nono', '62895361034833', 0, 19),
(33, 5, '08912318391', '6285156345912', 0, 19);

-- --------------------------------------------------------

--
-- Table structure for table `tb_device`
--

CREATE TABLE `tb_device` (
  `id` int(11) NOT NULL,
  `device_name` varchar(100) NOT NULL,
  `api_key` varchar(50) NOT NULL,
  `qr_code` varchar(200) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `reg_date` date DEFAULT NULL,
  `data` text,
  `multidevice` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_device`
--

INSERT INTO `tb_device` (`id`, `device_name`, `api_key`, `qr_code`, `id_user`, `status`, `reg_date`, `data`, `multidevice`) VALUES
(13, 'demo5@gmail.com_Device Bas', 'er0MbKUG8IXG', NULL, 19, 1, '2022-01-07', NULL, 0),
(14, 'demo5@gmail.com_Device Ba', 'in73vy6JbUxI', NULL, 19, 2, '2022-01-07', NULL, 0),
(15, 'demo5@gmail.com_Device B', 'EIHb6yFJS2rT', NULL, 19, 1, '2022-01-10', NULL, 0),
(16, 'demo5@gmail.com_ASDF', 'z7vSRZZbOwTp', NULL, 19, 1, '2022-01-10', NULL, 0),
(17, 'demo5@gmail.com_asdaasa', '0IYR7uO5Dg27', NULL, 19, 1, '2022-01-10', NULL, 0),
(18, 'demo7_Device A', 'K0fhwvBKQIw5', NULL, 21, 1, '2022-01-11', NULL, 0),
(19, 'demo17@gmail.com_Device A', 'EbMtPQfI3GXu', NULL, 30, 1, '2022-01-11', NULL, 0),
(20, 'demo17@gmail.com_Device B', 'rKVXQkaijYuA', NULL, 30, 1, '2022-01-11', NULL, 0),
(21, 'demo17@gmail.com_Device Baru', 'Ob4WYN8jZdKz', NULL, 30, 1, '2022-01-11', NULL, 0),
(22, 'demo17@gmail.com_device 1', '9bVRekKPZCHZ', NULL, 30, 1, '2022-01-11', NULL, 0),
(23, 'demo17@gmail.com_dodo', 'nKNl7vxaEHib', NULL, 30, 1, '2022-01-11', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_group`
--

CREATE TABLE `tb_group` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_group`
--

INSERT INTO `tb_group` (`id`, `name`, `deskripsi`, `status`, `id_user`) VALUES
(2, 'Calon Member', 'calon member cabang b ya', 1, 18),
(3, 'kejarkoding', 'asdas', 1, 18),
(4, 'kejarkoding', 'htyt', 1, 19),
(5, 'kejarkoding', 'adfa', 1, 19);

-- --------------------------------------------------------

--
-- Table structure for table `tb_message`
--

CREATE TABLE `tb_message` (
  `id` int(11) NOT NULL,
  `instance_key` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `recipient` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_time` timestamp NOT NULL,
  `data_message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_message`
--

INSERT INTO `tb_message` (`id`, `instance_key`, `message`, `recipient`, `type`, `status`, `date_time`, `data_message`) VALUES
(1, 'HmW1WUnR3gC7', 'hello mas apa kabs', '', 'chat-text', 'received', '2021-09-14 18:09:55', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}'),
(2, 'HmW1WUnR3gC7', '{\"contactMessage\":{\"vcard\":\"BEGIN:VCARD\\nVERSION:3.0\\nFN:Nova Ariyanto\\nORG:whatsva;\\nTEL;type=CELL;type=VOICE;waid=62895361034833:+62895361034833\\nEND:VCARD\"}}', '', 'chat-vcard', 'received', '2021-09-14 18:09:13', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"contactMessage\":{\"vcard\":\"BEGIN:VCARD\\nVERSION:3.0\\nFN:Nova Ariyanto\\nORG:whatsva;\\nTEL;type=CELL;type=VOICE;waid=62895361034833:+62895361034833\\nEND:VCARD\"}}}'),
(3, 'HmW1WUnR3gC7', 'hello mas apa kabs', '', 'chat-text', 'received', '2021-09-14 19:09:06', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}'),
(4, 'HmW1WUnR3gC7', 'https://www.greenscene.co.id/wp-content/uploads/2021/09/One-Piece-11-696x497.jpg', '', 'chat-image', 'received', '2021-09-14 19:09:12', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"imageMessage\":{\"url\":\"https:\\/\\/mmg.whatsapp.net\\/d\\/f\\/Aq40kaCvig7w-Bt0o0bXixIndN3jz9OmVmpABWGwW02q.enc\",\"mimetype\":\"image\\/jpeg\",\"caption\":\"hello mas apa kabs\",\"fileSha256\":\"tkTGXNPkOoP6uCudglTgbXLqlR+W8lxdeIJsG1KklF4=\",\"fileLength\":\"54197\",\"mediaKey\":\"VM73GrJv4ozLwmhULl7XWHegrMCjNzIBhTqS+Zpyvow=\",\"fileEncSha256\":\"3sPpUR4Afbj0YtaUKe1KzKpq64GrXg2W4416bXed2wM=\",\"jpegThumbnail\":\"\\/9j\\/2wBDABALDA4MChAODQ4SERATGCgaGBYWGDEjJR0oOjM9PDkzODdASFxOQERXRTc4UG1RV19iZ2hnPk1xeXBkeFxlZ2P\\/2wBDARESEhgVGC8aGi9jQjhCY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2P\\/wgARCAAwADADASIAAhEBAxEB\\/8QAGQAAAwEBAQAAAAAAAAAAAAAAAwQFAgEA\\/8QAGAEAAwEBAAAAAAAAAAAAAAAAAAECAwT\\/2gAMAwEAAhADEAAAASlMHm2EvXnlo0Jp98mVjT40tZm7JbXyWlhWqFsHe0yJHnOC\\/8QAHhAAAgMAAgMBAAAAAAAAAAAAAQIAAxESIgQhMRP\\/2gAIAQEAAQUCVFjVgjjxDWPo+q9YC5h8itJwlgyEZFtZIj5LWUlL9Bn5kxqXhOi1uy\\/ORgYqe9k4y4d1TqU9YYAQ2gR15LXoJHTiNHpv\\/8QAGREBAQADAQAAAAAAAAAAAAAAAQAQETEh\\/9oACAEDAQE\\/AfYdzduTGwnH\\/8QAGhEBAAEFAAAAAAAAAAAAAAAAAQACECAhYf\\/aAAgBAgEBPwHbDtgjTDD\\/xAAhEAACAgIBBAMAAAAAAAAAAAAAARARITEyAhJCYSJBof\\/aAAgBAQAGPwLcfBlRiKcU9R6hPtyV5HUc\\/wAPoawUsIvyNlnOlF0KbPZZT0YMJx\\/\\/xAAgEAEAAwABBQADAAAAAAAAAAABABEhQRAxUWGRgbHB\\/9oACAEBAAE\\/IQlC\\/MulfIImr+xlmQGla5lbv8ltgiGtr8iEs0ZcTvgw1VwgMfCKNohAD5Mr0AMSK1Ypyzgh8xU7\\/EXnB3joxTIhtNb3lmNPUopYK0H1S6RXIHqclcRkArv0YbJBzZCv6zIizxFMj09D\\/9oADAMBAAIAAwAAABDeKhKmmhP\\/AP\\/EABgRAAMBAQAAAAAAAAAAAAAAAAABETEh\\/9oACAEDAQE\\/EE6ojlDxwxS9w6x0ah4M6WYf\\/8QAGREAAwEBAQAAAAAAAAAAAAAAAAERIRBB\\/9oACAECAQE\\/EE2YXcCV01oxvBIe9\\/\\/EACIQAQACAgMAAQUBAAAAAAAAAAEAESFBMVFhgXGRscHR4f\\/aAAgBAQABPxDHAvmOU4bwZkwMo8fCVxb7jxcHbJ3MaJtVbGhF9DAPHDiwdyjAPGdQDlsBmn03FDQPXEJNDaq+OpSToziFmDYVj76fyN1+DpgsWNARpJF6MRHK5awr7bjAyQMMPcZyjAfmCi8pw1X6hbR9KoESQy7fK6g2iM1pvc5+6RlMPABtRWZyAVdSoJia4dMAAXq4bhpyJggsNbT2IXaPL\\/iHxCyXCeQFXpcRQcmjqf\\/Z\"}}}'),
(5, 'HmW1WUnR3gC7', 'hello mas apa kabs', '', 'chat-text', 'received', '2021-09-14 19:09:15', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}'),
(6, 'HmW1WUnR3gC7', 'hello mas apa kabs', '', 'chat-text', 'received', '2021-09-14 19:09:17', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}'),
(7, 'HmW1WUnR3gC7', 'hello mas apa kabs', '', 'chat-text', 'received', '2021-09-14 19:09:20', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}'),
(8, 'HmW1WUnR3gC7', 'hello mas apa kabs', '', 'chat-text', 'received', '2021-09-14 19:09:22', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}'),
(9, 'HmW1WUnR3gC7', 'hello mas apa kabs', '', 'chat-text', 'received', '2021-09-14 19:09:24', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}'),
(10, 'HmW1WUnR3gC7', 'hello mas apa kabs', '', 'chat-text', 'received', '2021-09-14 19:09:26', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}'),
(11, 'HmW1WUnR3gC7', 'hello mas apa kabs', '', 'chat-text', 'received', '2021-09-14 19:09:28', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}'),
(12, 'HmW1WUnR3gC7', 'hello mas apa kabs', '', 'chat-text', 'received', '2021-09-14 19:09:38', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}'),
(13, 'HmW1WUnR3gC7', 'hello mas apa kabs', '', 'chat-text', 'received', '2021-09-14 19:09:40', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}'),
(14, 'HmW1WUnR3gC7', 'hello mas apa kabs', '', 'chat-text', 'received', '2021-09-14 21:09:00', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}'),
(15, 'HmW1WUnR3gC7', 'https://www.greenscene.co.id/wp-content/uploads/2021/09/One-Piece-11-696x497.jpg', '', 'chat-image', 'received', '2021-09-14 21:09:14', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"imageMessage\":{\"url\":\"https:\\/\\/mmg.whatsapp.net\\/d\\/f\\/Am3hMQLokciOsYxM0EQ1YfneXKMqn27BvKK_eDEINt3d.enc\",\"mimetype\":\"image\\/jpeg\",\"caption\":\"hello mas apa kabs\",\"fileSha256\":\"tkTGXNPkOoP6uCudglTgbXLqlR+W8lxdeIJsG1KklF4=\",\"fileLength\":\"54197\",\"mediaKey\":\"Jmzr95gR2GJ9QIFIQDslJvPmAn2YyR9Nt9UgOUMhVbI=\",\"fileEncSha256\":\"ajopQPe93mvMRmFz\\/1FY1qZ+HPdeXfJ8N\\/EHN2mLeSI=\",\"jpegThumbnail\":\"\\/9j\\/2wBDABALDA4MChAODQ4SERATGCgaGBYWGDEjJR0oOjM9PDkzODdASFxOQERXRTc4UG1RV19iZ2hnPk1xeXBkeFxlZ2P\\/2wBDARESEhgVGC8aGi9jQjhCY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2P\\/wgARCAAwADADASIAAhEBAxEB\\/8QAGQAAAwEBAQAAAAAAAAAAAAAAAwQFAgEA\\/8QAGAEAAwEBAAAAAAAAAAAAAAAAAAECAwT\\/2gAMAwEAAhADEAAAASlMHm2EvXnlo0Jp98mVjT40tZm7JbXyWlhWqFsHe0yJHnOC\\/8QAHhAAAgMAAgMBAAAAAAAAAAAAAQIAAxESIgQhMRP\\/2gAIAQEAAQUCVFjVgjjxDWPo+q9YC5h8itJwlgyEZFtZIj5LWUlL9Bn5kxqXhOi1uy\\/ORgYqe9k4y4d1TqU9YYAQ2gR15LXoJHTiNHpv\\/8QAGREBAQADAQAAAAAAAAAAAAAAAQAQETEh\\/9oACAEDAQE\\/AfYdzduTGwnH\\/8QAGhEBAAEFAAAAAAAAAAAAAAAAAQACECAhYf\\/aAAgBAgEBPwHbDtgjTDD\\/xAAhEAACAgIBBAMAAAAAAAAAAAAAARARITEyAhJCYSJBof\\/aAAgBAQAGPwLcfBlRiKcU9R6hPtyV5HUc\\/wAPoawUsIvyNlnOlF0KbPZZT0YMJx\\/\\/xAAgEAEAAwABBQADAAAAAAAAAAABABEhQRAxUWGRgbHB\\/9oACAEBAAE\\/IQlC\\/MulfIImr+xlmQGla5lbv8ltgiGtr8iEs0ZcTvgw1VwgMfCKNohAD5Mr0AMSK1Ypyzgh8xU7\\/EXnB3joxTIhtNb3lmNPUopYK0H1S6RXIHqclcRkArv0YbJBzZCv6zIizxFMj09D\\/9oADAMBAAIAAwAAABDeKhKmmhP\\/AP\\/EABgRAAMBAQAAAAAAAAAAAAAAAAABETEh\\/9oACAEDAQE\\/EE6ojlDxwxS9w6x0ah4M6WYf\\/8QAGREAAwEBAQAAAAAAAAAAAAAAAAERIRBB\\/9oACAECAQE\\/EE2YXcCV01oxvBIe9\\/\\/EACIQAQACAgMAAQUBAAAAAAAAAAEAESFBMVFhgXGRscHR4f\\/aAAgBAQABPxDHAvmOU4bwZkwMo8fCVxb7jxcHbJ3MaJtVbGhF9DAPHDiwdyjAPGdQDlsBmn03FDQPXEJNDaq+OpSToziFmDYVj76fyN1+DpgsWNARpJF6MRHK5awr7bjAyQMMPcZyjAfmCi8pw1X6hbR9KoESQy7fK6g2iM1pvc5+6RlMPABtRWZyAVdSoJia4dMAAXq4bhpyJggsNbT2IXaPL\\/iHxCyXCeQFXpcRQcmjqf\\/Z\"}}}'),
(16, 'HmW1WUnR3gC7', 'http://pustaka.unp.ac.id/file/abstrak_kki/EBOOKS/23%20kiat%20hidup%20bahagia.pdf', '', 'chat-document', 'received', '2021-09-14 21:09:19', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"documentMessage\":{\"url\":\"https:\\/\\/mmg.whatsapp.net\\/d\\/f\\/Ah34hLmpQIoXKmab49htBy160EuFBusBjps5VMq7ZOkd.enc\",\"mimetype\":\"application\\/pdf\",\"fileSha256\":\"dJMdYxibDftF+V82a3uI4PE0cB61OoFr252C8mKDZxU=\",\"fileLength\":\"233206\",\"mediaKey\":\"RzTh53+s15CZoPgbsEKYZ93h5hw+shbFQgjwdKocFIw=\",\"fileName\":\"23%20kiat%20hidup%20bahagia.pdf\",\"fileEncSha256\":\"k5RAWS2Dce3ukMAT0Q4PkeYyeNyHyu8p3VmsfaGeo\\/4=\"}}}'),
(17, 'HmW1WUnR3gC7', 'https://www.onirikal.com/videos/mp4/nestlegold.mp4', '', 'chat-video', 'received', '2021-09-14 21:09:41', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"videoMessage\":{\"url\":\"https:\\/\\/mmg.whatsapp.net\\/d\\/f\\/Ai41c11VjJcRYiakUVRrMfpsBTYJpY6rDFj22kFm8wCm.enc\",\"mimetype\":\"video\\/mp4\",\"fileSha256\":\"1qU2e\\/Z8Pxcj7+QLFUAgrj2vnIhHa\\/rJ9XMt4x5f\\/F8=\",\"fileLength\":\"1454520\",\"mediaKey\":\"kHZBeLltf6sJTG4gIbggo+UMg+CYERgBvJyPDcx4vf4=\",\"caption\":\"hello mas apa kabs\",\"fileEncSha256\":\"ZBrmX4Km7maYvAYBCeFriMWAIXsf2ZVEhL0hpPpW9Ds=\"}}}'),
(18, 'HmW1WUnR3gC7', 'hello mas apa kabs', '', 'chat-text', 'received', '2021-09-14 21:09:58', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}'),
(19, 'HmW1WUnR3gC7', 'hello mas apa kabs', '', 'chat-text', 'received', '2021-09-14 22:09:16', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}'),
(20, 'F7ZdxS7EyIDG', '6285156345912', '', 'chat-text', 'received', '2021-09-15 23:09:31', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"6285156345912\"}}}'),
(21, 'F7ZdxS7EyIDG', '6285156345912', '', 'chat-text', 'received', '2021-09-15 23:09:07', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"6285156345912\"}}}'),
(22, 'F7ZdxS7EyIDG', '6285156345912', '', 'chat-text', 'received', '2021-09-15 23:09:10', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"6285156345912\"}}}'),
(23, 'F7ZdxS7EyIDG', '6285156345912', '', 'chat-text', 'received', '2021-09-15 23:09:32', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"6285156345912\"}}}'),
(24, 'F7ZdxS7EyIDG', '6285156345912', '', 'chat-text', 'received', '2021-09-15 23:09:35', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"6285156345912\"}}}'),
(25, 'F7ZdxS7EyIDG', '6285156345912', '', 'chat-text', 'received', '2021-09-15 23:09:38', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"6285156345912\"}}}'),
(26, 'F7ZdxS7EyIDG', ' complete: callback', '', 'chat-text', 'received', '2021-09-15 23:09:19', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\" complete: callback\"}}}'),
(27, 'F7ZdxS7EyIDG', ' complete: callback', '', 'chat-text', 'received', '2021-09-15 23:09:24', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\" complete: callback\"}}}'),
(28, 'F7ZdxS7EyIDG', '6285156345912', '', 'chat-text', 'received', '2021-09-15 23:09:26', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"6285156345912\"}}}'),
(29, 'F7ZdxS7EyIDG', 'fasd', '', 'chat-text', 'received', '2021-09-15 23:09:56', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"fasd\"}}}'),
(30, 'F7ZdxS7EyIDG', 'asdasd', '', 'chat-text', 'received', '2021-09-15 23:09:37', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"asdasd\"}}}'),
(31, 'F7ZdxS7EyIDG', 'hello', '', 'chat-text', 'received', '2021-09-15 23:09:40', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}'),
(32, 'F7ZdxS7EyIDG', 'helo', '', 'chat-text', 'received', '2021-09-15 23:09:27', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"helo\"}}}'),
(33, 'F7ZdxS7EyIDG', 'geki', '', 'chat-text', 'received', '2021-09-15 23:09:39', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"geki\"}}}'),
(34, 'F7ZdxS7EyIDG', 'hello', '', 'chat-text', 'received', '2021-09-15 23:09:08', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}'),
(35, 'F7ZdxS7EyIDG', 'hello', '', 'chat-text', 'received', '2021-09-15 23:09:25', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}'),
(36, 'F7ZdxS7EyIDG', 'helo', '', 'chat-text', 'received', '2021-09-15 23:09:32', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"helo\"}}}'),
(37, 'F7ZdxS7EyIDG', 'hry', '', 'chat-text', 'received', '2021-09-15 23:09:33', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hry\"}}}'),
(38, 'F7ZdxS7EyIDG', 'hry', '', 'chat-text', 'received', '2021-09-15 23:09:44', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hry\"}}}'),
(39, 'F7ZdxS7EyIDG', 'helo', '', 'chat-text', 'received', '2021-09-15 23:09:58', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"helo\"}}}'),
(40, 'F7ZdxS7EyIDG', 'heki', '', 'chat-text', 'received', '2021-09-15 23:09:16', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"heki\"}}}'),
(41, 'F7ZdxS7EyIDG', 'asfd', '', 'chat-text', 'received', '2021-09-15 23:09:52', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"asfd\"}}}'),
(42, 'F7ZdxS7EyIDG', 'sdad', '', 'chat-text', 'received', '2021-09-15 23:09:14', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"sdad\"}}}'),
(43, 'F7ZdxS7EyIDG', 'asdsa', '', 'chat-text', 'received', '2021-09-15 23:09:40', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"asdsa\"}}}'),
(44, 'F7ZdxS7EyIDG', 'hello gaes', '', 'chat-text', 'received', '2021-09-15 23:09:28', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello gaes\"}}}'),
(45, 'F7ZdxS7EyIDG', 'hello gaes', '', 'chat-text', 'received', '2021-09-15 23:09:51', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello gaes\"}}}'),
(46, 'F7ZdxS7EyIDG', 'hello', '', 'chat-text', 'received', '2021-09-15 23:09:04', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}'),
(47, 'F7ZdxS7EyIDG', 'hello mas apa kabs', '', 'chat-text', 'received', '2021-09-16 19:09:59', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}'),
(48, 'F7ZdxS7EyIDG', 'hello mas apa kabs', '', 'chat-text', 'received', '2021-09-16 21:09:08', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}'),
(49, 'F7ZdxS7EyIDG', 'hello mas apa kabs', '', 'chat-text', 'received', '2021-09-16 21:09:41', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}'),
(50, 'LCm0JCGv8SN4', 'hello', '', 'chat-text', 'received', '2021-09-17 20:09:28', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}'),
(51, 'izPYCnxY9BRV', 'hello', '6285156345912', 'chat-text', 'received', '2021-09-19 21:09:37', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}'),
(52, 'izPYCnxY9BRV', 'hello gaes', '6285156345912', 'chat-text', 'received', '2021-09-19 21:09:17', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello gaes\"}}}'),
(53, 'izPYCnxY9BRV', 'hello 3', '6285156345912', 'chat-text', 'received', '2021-09-19 21:09:55', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello 3\"}}}'),
(54, 'izPYCnxY9BRV', 'hello', '6285156345912', 'chat-text', 'received', '2021-09-19 20:09:16', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}'),
(55, 'GXjLhnzrzBry', 'hello', '62895361034833', 'chat-text', 'received', '2021-09-20 18:09:59', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB05CE8741EF2D09481\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}}'),
(56, 'LqL5mhSYPZmT', 'hello', '6285156345912', 'chat-text', 'received', '2021-09-21 19:09:53', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB01C5AF651194FED7A\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}}'),
(57, 'LqL5mhSYPZmT', '[{\"label\":\"Google\",\"url\":\"https:\\/\\/google.com\"},{\"label\":\"Facebook\",\"url\":\"https:\\/\\/facebook.com\"}]', '6285156345912', 'chat-button-link-mes', 'received', '2021-09-21 19:09:41', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB03AAC23DEB073AD59\",\"message\":{\"templateMessage\":{\"hydratedTemplate\":{\"hydratedContentText\":\"Kemana kamu mau pergi ?\",\"hydratedButtons\":[{\"urlButton\":{\"displayText\":\"Google\",\"url\":\"https:\\/\\/google.com\"},\"index\":0},{\"urlButton\":{\"displayText\":\"Facebook\",\"url\":\"https:\\/\\/facebook.com\"},\"index\":1}]}}}}}'),
(58, 'LqL5mhSYPZmT', '[{\"label\":\"Google\",\"url\":\"https:\\/\\/google.com\"},{\"label\":\"Facebook\",\"url\":\"https:\\/\\/facebook.com\"}]', '6285156345912', 'chat-button-link-mes', 'received', '2021-09-21 19:09:14', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB07C5751666E76BE4C\",\"message\":{\"templateMessage\":{\"hydratedTemplate\":{\"hydratedContentText\":\"Kemana kamu mau pergi ?\",\"hydratedButtons\":[{\"urlButton\":{\"displayText\":\"Google\",\"url\":\"https:\\/\\/google.com\"},\"index\":0},{\"urlButton\":{\"displayText\":\"Facebook\",\"url\":\"https:\\/\\/facebook.com\"},\"index\":1}]}}}}}'),
(59, 'LqL5mhSYPZmT', '[{\"label\":\"Google\",\"url\":\"https:\\/\\/google.com\"},{\"label\":\"Facebook\",\"url\":\"https:\\/\\/facebook.com\"}]', '6285156345912', 'chat-button-link-mes', 'received', '2021-09-21 19:09:10', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0EB7F2BE72F8A4C46\",\"message\":{\"templateMessage\":{\"hydratedTemplate\":{\"hydratedContentText\":\"Kemana kamu mau pergi ?\",\"hydratedButtons\":[{\"urlButton\":{\"displayText\":\"Google\",\"url\":\"https:\\/\\/google.com\"},\"index\":0},{\"urlButton\":{\"displayText\":\"Facebook\",\"url\":\"https:\\/\\/facebook.com\"},\"index\":1}]}}}}}'),
(60, 'LqL5mhSYPZmT', 'hello mas apa kabs', '62851563459122-1631023555@g.us', 'chat-text', 'received', '2021-09-21 20:09:25', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB001DCF709B9F85712\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello mas apa kabs\"}}}}'),
(61, 'LqL5mhSYPZmT', 'https://www.greenscene.co.id/wp-content/uploads/2021/09/One-Piece-11-696x497.jpg', '62851563459122-1631023555@g.us', 'chat-image', 'received', '2021-09-21 20:09:57', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0D2ECA7F90BFD5150\",\"message\":{\"imageMessage\":{\"url\":\"https:\\/\\/mmg.whatsapp.net\\/d\\/f\\/AqPB5lRgK5vdf97RmsTAAU-_UE2PbJZpWQM74Ep8KTeb.enc\",\"mimetype\":\"image\\/jpeg\",\"caption\":\"hello mas apa kabs\",\"fileSha256\":\"tkTGXNPkOoP6uCudglTgbXLqlR+W8lxdeIJsG1KklF4=\",\"fileLength\":\"54197\",\"mediaKey\":\"CfKuxsqy8FiVJRqd7F1I\\/4LGoPl2aCv\\/llsOfWgh4BI=\",\"fileEncSha256\":\"nR96lAHszYSSCO9hGzyZj06BUy4bA6\\/JYNuPPHllObQ=\",\"jpegThumbnail\":\"\\/9j\\/2wBDABALDA4MChAODQ4SERATGCgaGBYWGDEjJR0oOjM9PDkzODdASFxOQERXRTc4UG1RV19iZ2hnPk1xeXBkeFxlZ2P\\/2wBDARESEhgVGC8aGi9jQjhCY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2P\\/wgARCAAwADADASIAAhEBAxEB\\/8QAGQAAAwEBAQAAAAAAAAAAAAAAAwQFAgEA\\/8QAGAEAAwEBAAAAAAAAAAAAAAAAAAECAwT\\/2gAMAwEAAhADEAAAASlMHm2EvXnlo0Jp98mVjT40tZm7JbXyWlhWqFsHe0yJHnOC\\/8QAHhAAAgMAAgMBAAAAAAAAAAAAAQIAAxESIgQhMRP\\/2gAIAQEAAQUCVFjVgjjxDWPo+q9YC5h8itJwlgyEZFtZIj5LWUlL9Bn5kxqXhOi1uy\\/ORgYqe9k4y4d1TqU9YYAQ2gR15LXoJHTiNHpv\\/8QAGREBAQADAQAAAAAAAAAAAAAAAQAQETEh\\/9oACAEDAQE\\/AfYdzduTGwnH\\/8QAGhEBAAEFAAAAAAAAAAAAAAAAAQACECAhYf\\/aAAgBAgEBPwHbDtgjTDD\\/xAAhEAACAgIBBAMAAAAAAAAAAAAAARARITEyAhJCYSJBof\\/aAAgBAQAGPwLcfBlRiKcU9R6hPtyV5HUc\\/wAPoawUsIvyNlnOlF0KbPZZT0YMJx\\/\\/xAAgEAEAAwABBQADAAAAAAAAAAABABEhQRAxUWGRgbHB\\/9oACAEBAAE\\/IQlC\\/MulfIImr+xlmQGla5lbv8ltgiGtr8iEs0ZcTvgw1VwgMfCKNohAD5Mr0AMSK1Ypyzgh8xU7\\/EXnB3joxTIhtNb3lmNPUopYK0H1S6RXIHqclcRkArv0YbJBzZCv6zIizxFMj09D\\/9oADAMBAAIAAwAAABDeKhKmmhP\\/AP\\/EABgRAAMBAQAAAAAAAAAAAAAAAAABETEh\\/9oACAEDAQE\\/EE6ojlDxwxS9w6x0ah4M6WYf\\/8QAGREAAwEBAQAAAAAAAAAAAAAAAAERIRBB\\/9oACAECAQE\\/EE2YXcCV01oxvBIe9\\/\\/EACIQAQACAgMAAQUBAAAAAAAAAAEAESFBMVFhgXGRscHR4f\\/aAAgBAQABPxDHAvmOU4bwZkwMo8fCVxb7jxcHbJ3MaJtVbGhF9DAPHDiwdyjAPGdQDlsBmn03FDQPXEJNDaq+OpSToziFmDYVj76fyN1+DpgsWNARpJF6MRHK5awr7bjAyQMMPcZyjAfmCi8pw1X6hbR9KoESQy7fK6g2iM1pvc5+6RlMPABtRWZyAVdSoJia4dMAAXq4bhpyJggsNbT2IXaPL\\/iHxCyXCeQFXpcRQcmjqf\\/Z\"}}}}'),
(62, 'LqL5mhSYPZmT', 'https://www.greenscene.co.id/wp-content/uploads/2021/09/One-Piece-11-696x497.jpg', '62851563459122-1631023555@g.us', 'chat-image', 'received', '2021-09-21 20:09:22', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0B6112C8C8E559D56\",\"message\":{\"imageMessage\":{\"url\":\"https:\\/\\/mmg.whatsapp.net\\/d\\/f\\/ArHOphYxCfJs0EJ_c8f2k6Ionuw1-bKF3LOXHASTM_Z6.enc\",\"mimetype\":\"image\\/jpeg\",\"caption\":\"hello mas apa kabs\",\"fileSha256\":\"tkTGXNPkOoP6uCudglTgbXLqlR+W8lxdeIJsG1KklF4=\",\"fileLength\":\"54197\",\"mediaKey\":\"5u4HAzmTsPZ8bpKbZAzdUxepsUjo6IL\\/StY\\/Q6t57zc=\",\"fileEncSha256\":\"E6u6pGWPTEfN0rl15O38v2oOIzGARX7Zd8dXBIs5Cv0=\",\"jpegThumbnail\":\"\\/9j\\/2wBDABALDA4MChAODQ4SERATGCgaGBYWGDEjJR0oOjM9PDkzODdASFxOQERXRTc4UG1RV19iZ2hnPk1xeXBkeFxlZ2P\\/2wBDARESEhgVGC8aGi9jQjhCY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2P\\/wgARCAAwADADASIAAhEBAxEB\\/8QAGQAAAwEBAQAAAAAAAAAAAAAAAwQFAgEA\\/8QAGAEAAwEBAAAAAAAAAAAAAAAAAAECAwT\\/2gAMAwEAAhADEAAAASlMHm2EvXnlo0Jp98mVjT40tZm7JbXyWlhWqFsHe0yJHnOC\\/8QAHhAAAgMAAgMBAAAAAAAAAAAAAQIAAxESIgQhMRP\\/2gAIAQEAAQUCVFjVgjjxDWPo+q9YC5h8itJwlgyEZFtZIj5LWUlL9Bn5kxqXhOi1uy\\/ORgYqe9k4y4d1TqU9YYAQ2gR15LXoJHTiNHpv\\/8QAGREBAQADAQAAAAAAAAAAAAAAAQAQETEh\\/9oACAEDAQE\\/AfYdzduTGwnH\\/8QAGhEBAAEFAAAAAAAAAAAAAAAAAQACECAhYf\\/aAAgBAgEBPwHbDtgjTDD\\/xAAhEAACAgIBBAMAAAAAAAAAAAAAARARITEyAhJCYSJBof\\/aAAgBAQAGPwLcfBlRiKcU9R6hPtyV5HUc\\/wAPoawUsIvyNlnOlF0KbPZZT0YMJx\\/\\/xAAgEAEAAwABBQADAAAAAAAAAAABABEhQRAxUWGRgbHB\\/9oACAEBAAE\\/IQlC\\/MulfIImr+xlmQGla5lbv8ltgiGtr8iEs0ZcTvgw1VwgMfCKNohAD5Mr0AMSK1Ypyzgh8xU7\\/EXnB3joxTIhtNb3lmNPUopYK0H1S6RXIHqclcRkArv0YbJBzZCv6zIizxFMj09D\\/9oADAMBAAIAAwAAABDeKhKmmhP\\/AP\\/EABgRAAMBAQAAAAAAAAAAAAAAAAABETEh\\/9oACAEDAQE\\/EE6ojlDxwxS9w6x0ah4M6WYf\\/8QAGREAAwEBAQAAAAAAAAAAAAAAAAERIRBB\\/9oACAECAQE\\/EE2YXcCV01oxvBIe9\\/\\/EACIQAQACAgMAAQUBAAAAAAAAAAEAESFBMVFhgXGRscHR4f\\/aAAgBAQABPxDHAvmOU4bwZkwMo8fCVxb7jxcHbJ3MaJtVbGhF9DAPHDiwdyjAPGdQDlsBmn03FDQPXEJNDaq+OpSToziFmDYVj76fyN1+DpgsWNARpJF6MRHK5awr7bjAyQMMPcZyjAfmCi8pw1X6hbR9KoESQy7fK6g2iM1pvc5+6RlMPABtRWZyAVdSoJia4dMAAXq4bhpyJggsNbT2IXaPL\\/iHxCyXCeQFXpcRQcmjqf\\/Z\"}}}}'),
(63, 'LqL5mhSYPZmT', 'http://pustaka.unp.ac.id/file/abstrak_kki/EBOOKS/23%20kiat%20hidup%20bahagia.pdf', '62851563459122-1631023555@g.us', 'chat-document', 'received', '2021-09-21 20:09:48', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0FD387CADB3762E72\",\"message\":{\"documentMessage\":{\"url\":\"https:\\/\\/mmg.whatsapp.net\\/d\\/f\\/Aj2kMpJeGQPjcmaxzxTR14JN8jOfkkGzIQ_lxSQ0KxhS.enc\",\"mimetype\":\"application\\/pdf\",\"fileSha256\":\"dJMdYxibDftF+V82a3uI4PE0cB61OoFr252C8mKDZxU=\",\"fileLength\":\"233206\",\"mediaKey\":\"L\\/O1XhCbAsJF\\/VNzvywva9c6ohcWjiwoyZCRwRlO+r4=\",\"fileName\":\"23%20kiat%20hidup%20bahagia.pdf\",\"fileEncSha256\":\"0R8WXqT1GAen75VSUOyAx2P372i5+NXf8W9vdmh8rcU=\"}}}}'),
(64, 'LqL5mhSYPZmT', 'http://pustaka.unp.ac.id/file/abstrak_kki/EBOOKS/23%20kiat%20hidup%20bahagia.pdf', '62851563459122-1631023555@g.us', 'chat-document', 'received', '2021-09-21 20:09:13', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0F810D90CE725C47C\",\"message\":{\"documentMessage\":{\"url\":\"https:\\/\\/mmg.whatsapp.net\\/d\\/f\\/AnUuNyb6zsPLIOBeK_CrDW0fQegmffRMMs19u8AAwZwT.enc\",\"mimetype\":\"application\\/pdf\",\"fileSha256\":\"dJMdYxibDftF+V82a3uI4PE0cB61OoFr252C8mKDZxU=\",\"fileLength\":\"233206\",\"mediaKey\":\"GiwS1JTkO8IfYnmITb69Az\\/Kia+HiH4pzbiaGFyUOs8=\",\"fileName\":\"t.pdf\",\"fileEncSha256\":\"QZyg5nY0nA68Kq1Itz16m3pIOsstbNq3p\\/K8oofNpb4=\"}}}}'),
(65, 'LqL5mhSYPZmT', 'http://pustaka.unp.ac.id/file/abstrak_kki/EBOOKS/23%20kiat%20hidup%20bahagia.pdf', '62851563459122-1631023555@g.us', 'chat-document', 'received', '2021-09-21 20:09:53', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0C69675FD6C02AF69\",\"message\":{\"documentMessage\":{\"url\":\"https:\\/\\/mmg.whatsapp.net\\/d\\/f\\/AtBAiuX0YL6XDts8TZ5yA6n50FO_KaMKGE_OCcWz5O3W.enc\",\"mimetype\":\"application\\/pdf\",\"fileSha256\":\"dJMdYxibDftF+V82a3uI4PE0cB61OoFr252C8mKDZxU=\",\"fileLength\":\"233206\",\"mediaKey\":\"f4kpjhe5AIcAz1IqI3KP4OPggB5n1B6nZvVZ7rZRadA=\",\"fileName\":\"23%20kiat%20hidup%20bahagia.pdf\",\"fileEncSha256\":\"fCJVox8bJlN0XzpIuiKtNqeNu+Y+EO9Gha+Kr+CeVDs=\"}}}}'),
(66, 'LqL5mhSYPZmT', 'http://pustaka.unp.ac.id/file/abstrak_kki/EBOOKS/23%20kiat%20hidup%20bahagia.pdf', '62851563459122-1631023555@g.us', 'chat-document', 'received', '2021-09-21 20:09:54', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0E47CC5FB4077106A\",\"message\":{\"documentMessage\":{\"url\":\"https:\\/\\/mmg.whatsapp.net\\/d\\/f\\/AkJCxQ4kxXvVTZkNqT2HYNbyct1d-6YQOZ_95YPLyq5S.enc\",\"mimetype\":\"application\\/pdf\",\"fileSha256\":\"dJMdYxibDftF+V82a3uI4PE0cB61OoFr252C8mKDZxU=\",\"fileLength\":\"233206\",\"mediaKey\":\"GXfm8zsniQPV59C10AeqqZfNMgdOYYCitTWJSiTL1BU=\",\"fileName\":\"23%20kiat%20hidup%20bahagia.pdf\",\"fileEncSha256\":\"pIdgH7KxM6\\/k9DVm7MGZ4pzO53adb4gm4MylAMA1fXE=\"}}}}'),
(67, 'LqL5mhSYPZmT', 'https://www.onirikal.com/videos/mp4/nestlegold.mp4', '62851563459122-1631023555@g.us', 'chat-video', 'received', '2021-09-21 20:09:11', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB036D83D2E1FE9A143\",\"message\":{\"videoMessage\":{\"url\":\"https:\\/\\/mmg.whatsapp.net\\/d\\/f\\/AnG75f7R4ptpB_3w2AnjuG4-vVPYzsz1SWTKtV5Fh7KK.enc\",\"mimetype\":\"video\\/mp4\",\"fileSha256\":\"1qU2e\\/Z8Pxcj7+QLFUAgrj2vnIhHa\\/rJ9XMt4x5f\\/F8=\",\"fileLength\":\"1454520\",\"mediaKey\":\"D\\/0Z++ZbtuYvEJ4g4m5Q\\/fcjvDMsH+4LsbhXATc4gDs=\",\"caption\":\"hello mas apa kabs\",\"fileEncSha256\":\"rTDw0cbmVnG3AXjBLuCP+mYvuetsVFLfqFUgiFSnUxQ=\"}}}}'),
(68, 'LqL5mhSYPZmT', 'null', '62851563459122-1631023555@g.us', 'chat-location', 'received', '2021-09-21 21:09:12', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0BE624BA32A451FC6\",\"message\":{\"locationMessage\":{\"degreesLatitude\":24.121231,\"degreesLongitude\":55.1121221}}}}'),
(69, 'LqL5mhSYPZmT', 'null', '62851563459122-1631023555@g.us', 'chat-location', 'received', '2021-09-21 21:09:57', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB04A15F010723F96AD\",\"message\":{\"locationMessage\":{\"degreesLatitude\":24.121231,\"degreesLongitude\":55.1121221}}}}'),
(70, 'LqL5mhSYPZmT', '{\"lat\":24.121231,\"long\":55.1121221}', '62851563459122-1631023555@g.us', 'chat-location', 'received', '2021-09-21 21:09:39', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB024F72FAE6645D65F\",\"message\":{\"locationMessage\":{\"degreesLatitude\":24.121231,\"degreesLongitude\":55.1121221}}}}'),
(71, 'LqL5mhSYPZmT', '{\"instance_key\":\"LqL5mhSYPZmT\",\"jid_group\":\"62851563459122-1631023555@g.us\",\"fullname\":\"Nova Ariyanto\",\"organization\":\"whatsva\",\"phoneNumber\":\"62895361034833\"}', '62851563459122-1631023555@g.us', 'chat-vcard', 'received', '2021-09-21 21:09:53', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB00A91CE0B9284DB24\",\"message\":{\"contactMessage\":{\"vcard\":\"BEGIN:VCARD\\nVERSION:3.0\\nFN:Nova Ariyanto\\nORG:whatsva;\\nTEL;type=CELL;type=VOICE;waid=62895361034833:+62895361034833\\nEND:VCARD\"}}}}'),
(72, 'LqL5mhSYPZmT', '{\"title\":\"judul list\",\"rows\":[{\"title\":\"list 1\",\"description\":\"descript 1\",\"rowId\":\"1\"},{\"title\":\"list 2\",\"description\":\"descript 2\",\"rowId\":\"2\"}]}', '62851563459122-1631023555@g.us', 'chat-list-message', 'received', '2021-09-21 21:09:09', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB07289A5965E6544AF\",\"message\":{\"listMessage\":{\"description\":\"ini list message\",\"buttonText\":\"hello\",\"listType\":\"SINGLE_SELECT\",\"sections\":[{\"title\":\"judul list\",\"rows\":[{\"title\":\"list 1\",\"description\":\"descript 1\",\"rowId\":\"1\"},{\"title\":\"list 2\",\"description\":\"descript 2\",\"rowId\":\"2\"}]}]}}}}'),
(73, 'LqL5mhSYPZmT', '[{\"buttonId\":\"btn1\",\"buttonText\":{\"displayText\":\"Yes\"},\"type\":1},{\"buttonId\":\"btn2\",\"buttonText\":{\"displayText\":\"No\"},\"type\":1}]', '62851563459122-1631023555@g.us', 'chat-button-message', 'received', '2021-09-21 21:09:25', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0605C21CC350B304A\",\"message\":{\"buttonsMessage\":{\"contentText\":\"Apakah kamu mempunyai uang ?\",\"footerText\":\"jawab dengan jujur\",\"buttons\":[{\"buttonId\":\"btn1\",\"buttonText\":{\"displayText\":\"Yes\"},\"type\":\"RESPONSE\"},{\"buttonId\":\"btn2\",\"buttonText\":{\"displayText\":\"No\"},\"type\":\"RESPONSE\"}],\"headerType\":\"EMPTY\"}}}}'),
(74, 'LqL5mhSYPZmT', '[{\"label\":\"Google\",\"url\":\"https:\\/\\/google.com\"},{\"label\":\"Facebook\",\"url\":\"https:\\/\\/facebook.com\"}]', '62851563459122-1631023555@g.us', 'chat-button-link-mes', 'received', '2021-09-21 21:09:00', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB09FCB1DC361D9882E\",\"message\":{\"templateMessage\":{\"hydratedTemplate\":{\"hydratedContentText\":\"Apa yang kamu cari ?\",\"hydratedButtons\":[{\"urlButton\":{\"displayText\":\"Google\",\"url\":\"https:\\/\\/google.com\"},\"index\":0},{\"urlButton\":{\"displayText\":\"Facebook\",\"url\":\"https:\\/\\/facebook.com\"},\"index\":1}]}}}}}'),
(75, 'xOmO52xkbZ67', 'hello', '62895361034833', 'chat-text', 'received', '2021-09-26 21:09:59', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0F4F86C519D96739D\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}}'),
(76, 'nZxDSwIJ83nV', 'hello', '6285156345912', 'chat-text', 'received', '2021-09-30 02:09:55', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB09B3D536AEB808BDC\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}}'),
(77, 'nZxDSwIJ83nV', 'hello pagi', '6285156345912', 'chat-text', 'received', '2021-09-30 02:09:10', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0E397E56E384F8D01\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello pagi\"}}}}'),
(78, '1afPLUzI49Am', 'hello', '62895361034833', 'chat-text', 'received', '2021-10-29 05:10:40', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB08F75A34F382B46BD\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}}'),
(79, '1afPLUzI49Am', 'apa kabar', '62895361034833', 'chat-text', 'received', '2021-10-29 05:10:56', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB09CE1954D772E087B\",\"message\":{\"extendedTextMessage\":{\"text\":\"apa kabar\"}}}}'),
(80, '1afPLUzI49Am', 'apa kabar', '62895361034833', 'chat-text', 'received', '2021-10-29 05:10:58', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB07E318B0481CDAE73\",\"message\":{\"extendedTextMessage\":{\"text\":\"apa kabar\"}}}}'),
(81, '1afPLUzI49Am', 'hello', '62895361034833', 'chat-text', 'received', '2021-10-28 18:10:58', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0792DEB2F661B43CE\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}}'),
(82, '1afPLUzI49Am', 'apakabar', '62895361034833', 'chat-text', 'received', '2021-10-28 18:10:10', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB054EA988F76077904\",\"message\":{\"extendedTextMessage\":{\"text\":\"apakabar\"}}}}'),
(83, '1afPLUzI49Am', 'selamat pagi\r\n', '62895361034833', 'chat-text', 'received', '2021-10-28 18:10:23', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0A9F6AD2D0A3C29EF\",\"message\":{\"extendedTextMessage\":{\"text\":\"selamat pagi\\r\\n\"}}}}'),
(84, '1afPLUzI49Am', 'apakabs', '62895361034833', 'chat-text', 'received', '2021-10-28 18:10:03', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB04850D2B209076219\",\"message\":{\"extendedTextMessage\":{\"text\":\"apakabs\"}}}}'),
(85, '1afPLUzI49Am', 'hh', '62895361034833', 'chat-text', 'received', '2021-10-28 18:10:28', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB04B830171D543ABCA\",\"message\":{\"extendedTextMessage\":{\"text\":\"hh\"}}}}'),
(86, '1afPLUzI49Am', 'hello bro', '62895361034833', 'chat-text', 'received', '2021-10-28 20:10:00', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0B3A689D08D58112A\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello bro\"}}}}'),
(87, 'JSnOq7FAIqmk', 'bro', '62895361034833', 'chat-text', 'received', '2021-10-29 03:10:44', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB058F8972FBDCA7992\",\"message\":{\"extendedTextMessage\":{\"text\":\"bro\"}}}}'),
(88, 'JSnOq7FAIqmk', 'hello\r\n', '62895361034833', 'chat-text', 'received', '2021-10-29 03:10:47', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB00C21A224B124CCAA\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello\\r\\n\"}}}}'),
(89, 'R4iOU2oZcCbj', 'hello', '62895361034833', 'chat-text', 'received', '2021-10-29 03:10:25', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB05EBB181BC2E9BCEC\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}}'),
(90, 'k8JqYcW0AI0j', 'hello', '62895361034833', 'chat-text', 'received', '2021-11-05 00:11:43', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"success\":false,\"message\":\"you dont have access\"}}'),
(91, 'k8JqYcW0AI0j', 'hello', '62895361034833', 'chat-text', 'received', '2021-11-05 00:11:28', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"success\":false,\"message\":\"you dont have access\"}}'),
(92, 'k8JqYcW0AI0j', 'hello mas apa kabs', '6285156345912', 'chat-text', 'received', '2021-11-05 00:11:16', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"success\":false,\"message\":\"you dont have access\"}}'),
(93, 'k8JqYcW0AI0j', 'hello mas apa kabs', '6285156345912', 'chat-text', 'received', '2021-11-05 00:11:34', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"success\":false,\"message\":\"you dont have access\"}}'),
(94, 'k8JqYcW0AI0j', 'hello mas apa kabs', '6285156345912', 'chat-text', 'received', '2021-11-05 00:11:06', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"success\":false,\"message\":\"you dont have access\"}}'),
(95, 'k8JqYcW0AI0j', 'hello mas apa kabs', '6285156345912', 'chat-text', 'received', '2021-11-05 00:11:26', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"success\":false,\"message\":\"you dont have access\"}}'),
(96, 'k8JqYcW0AI0j', 'hello mas apa kabs', '6285156345912', 'chat-text', 'received', '2021-11-05 00:11:36', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"success\":false,\"message\":\"you dont have access\"}}'),
(97, 'k8JqYcW0AI0j', 'hello mas apa kabs', '6285156345912', 'chat-text', 'received', '2021-11-05 00:11:56', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"success\":false,\"message\":\"you dont have access\"}}'),
(98, 'k8JqYcW0AI0j', 'hello mas apa kabs', '6285156345912', 'chat-text', 'received', '2021-11-05 00:11:36', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"success\":false,\"message\":\"you dont have access\"}}'),
(99, 'k8JqYcW0AI0j', 'hello mas apa kabs', '6285156345912', 'chat-text', 'received', '2021-11-05 00:11:43', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"success\":false,\"message\":\"you dont have access\"}}'),
(100, 'k8JqYcW0AI0j', 'hello mas apa kabs', '6285156345912', 'chat-text', 'received', '2021-11-05 00:11:02', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"success\":false,\"message\":\"you dont have access\"}}'),
(101, 'k8JqYcW0AI0j', 'hello mas apa kabs', '6285156345912', 'chat-text', 'received', '2021-11-05 00:11:08', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"success\":false,\"message\":\"you dont have access\"}}'),
(102, 'k8JqYcW0AI0j', 'hello', '62895361034833', 'chat-text', 'received', '2021-11-05 00:11:11', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB018AFF4AC735BCF21\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}}'),
(103, 'k8JqYcW0AI0j', 'hello', '62895361034833', 'chat-text', 'received', '2021-11-05 00:11:10', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0646716CD090A0504\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}}'),
(104, 'k8JqYcW0AI0j', 'helo', '62895361034833', 'chat-text', 'received', '2021-11-05 00:11:00', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB08CFB03EA039E5FE5\",\"message\":{\"extendedTextMessage\":{\"text\":\"helo\"}}}}'),
(105, '9xC1dJldAjfE', 'hello', '62895361034833', 'chat-text', 'received', '2021-11-09 04:11:10', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB096E1C1D1BBBFCC5B\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}}'),
(106, '3J9MsD6vd2d0', 'hello', '6285156345912', 'chat-text', 'received', '2021-11-09 23:11:42', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":true,\"id\":\"3EB03E91585F\"},\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}},\"messageTimestamp\":\"1636543362\",\"status\":\"SERVER_ACK\"}}'),
(107, 'WJ9pNztCXgFl', 'hello', '6285156345912', 'chat-text', 'received', '2021-11-12 02:11:59', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":true,\"id\":\"3EB063B8F9D3\"},\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}},\"messageTimestamp\":\"1636683898\",\"status\":\"SERVER_ACK\"}}'),
(108, 'WJ9pNztCXgFl', 'hello', '6285156345912', 'chat-text', 'received', '2021-11-12 02:11:18', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":true,\"id\":\"3EB01AE291F0\"},\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}},\"messageTimestamp\":\"1636684337\",\"status\":\"SERVER_ACK\"}}'),
(109, 'WJ9pNztCXgFl', 'bro', '6285156345912', 'chat-text', 'received', '2021-11-12 02:11:36', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":true,\"id\":\"3EB0BAE6C182\"},\"message\":{\"extendedTextMessage\":{\"text\":\"bro\"}},\"messageTimestamp\":\"1636684355\",\"status\":\"SERVER_ACK\"}}'),
(110, 'WJ9pNztCXgFl', 'hello', '6285156345912', 'chat-text', 'received', '2021-11-12 02:11:30', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":true,\"id\":\"3EB09B9ABAC7\"},\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}},\"messageTimestamp\":\"1636685489\",\"status\":\"SERVER_ACK\"}}'),
(111, 'PDVHl2JIJP7g', 'hello', '62895361034833', 'chat-text', 'received', '2021-11-18 03:11:27', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0154DC8E90EBD859F\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}}'),
(112, 'PDVHl2JIJP7g', 'hello', '62895361034833', 'chat-text', 'received', '2021-11-18 04:11:11', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0F52E43A0B0159D89\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}}'),
(113, 'PDVHl2JIJP7g', 'hello', '62895361034833', 'chat-text', 'received', '2021-11-17 18:11:13', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0C85682149BE62633\",\"message\":{}}}'),
(114, '2mdAIztVAtoM', 'hello', '62895361034833', 'chat-text', 'received', '2021-11-26 03:11:36', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0D5B2EFE991BC07C4\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}}'),
(115, 'VXaOPnLHgN8V', 'hello', '62895361034833', 'chat-text', 'received', '2021-11-29 19:11:12', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"id\":\"3EB0F3876CB3FF2CC06B\",\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}}}}'),
(116, 'eEVQ3N7znEVP', 'hello', '62895361034833', 'chat-text', 'received', '2021-12-23 02:12:30', '{\"success\":true,\"message\":\"Sending Message\"}'),
(117, 'eEVQ3N7znEVP', 'hello', '62895361034833', 'chat-text', 'received', '2021-12-23 02:12:24', '{\"success\":true,\"message\":\"Sending Message\"}'),
(118, 'eEVQ3N7znEVP', 'hih\r\n', '62895361034833', 'chat-text', 'received', '2021-12-23 02:12:06', '{\"success\":true,\"message\":\"Sending Message\"}'),
(119, 'eEVQ3N7znEVP', 'heloo', '62895361034833', 'chat-text', 'received', '2021-12-23 03:12:43', '{\"success\":true,\"message\":\"Sending Message\"}'),
(120, 'eEVQ3N7znEVP', 'gege', '62895361034833', 'chat-text', 'received', '2021-12-23 03:12:06', '{\"success\":true,\"message\":\"Sending Message\"}'),
(121, 'eEVQ3N7znEVP', 'hello', '62895361034833', 'chat-text', 'received', '2021-12-23 04:12:48', '{\"success\":true,\"message\":\"Sending Message\"}'),
(122, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 03:12:23', '{\"success\":true,\"message\":\"Sending Message\"}'),
(123, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 03:12:22', '{\"success\":true,\"message\":\"Sending Message\"}'),
(124, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 03:12:02', '{\"success\":true,\"message\":\"Sending Message\"}'),
(125, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 03:12:43', '{\"success\":true,\"message\":\"Sending Message\"}'),
(126, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 03:12:30', '{\"success\":true,\"message\":\"Sending Message\"}'),
(127, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 03:12:40', '{\"success\":true,\"message\":\"Sending Message\"}'),
(128, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 03:12:03', '{\"success\":true,\"message\":\"Sending Message\"}'),
(129, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 03:12:26', '{\"success\":true,\"message\":\"Sending Message\"}'),
(130, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 03:12:50', '{\"success\":true,\"message\":\"Sending Message\"}'),
(131, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 03:12:00', '{\"success\":true,\"message\":\"Sending Message\"}'),
(132, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 03:12:33', '{\"success\":true,\"message\":\"Sending Message\"}'),
(133, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 03:12:55', '{\"success\":true,\"message\":\"Sending Message\"}'),
(134, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 03:12:01', '{\"success\":true,\"message\":\"Sending Message\"}'),
(135, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 03:12:06', '{\"success\":true,\"message\":\"Sending Message\"}'),
(136, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:15', '{\"success\":true,\"message\":\"Sending Message\"}'),
(137, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:39', '{\"success\":true,\"message\":\"Sending Message\"}'),
(138, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:40', '{\"success\":true,\"message\":\"Sending Message\"}'),
(139, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:26', '{\"success\":true,\"message\":\"Sending Message\"}'),
(140, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:43', '{\"success\":true,\"message\":\"Sending Message\"}'),
(141, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:53', '{\"success\":true,\"message\":\"Sending Message\"}'),
(142, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:03', '{\"success\":true,\"message\":\"Sending Message\"}'),
(143, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:34', '{\"success\":true,\"message\":\"Sending Message\"}'),
(144, 'pxIGbZLgFlFo', 'hello', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:37', '{\"success\":true,\"message\":\"Sending Message\"}'),
(145, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:04', '{\"success\":true,\"message\":\"Sending Message\"}'),
(146, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:07', '{\"success\":true,\"message\":\"Sending Message\"}'),
(147, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:10', '{\"success\":true,\"message\":\"Sending Message\"}'),
(148, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:13', '{\"success\":true,\"message\":\"Sending Message\"}'),
(149, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:16', '{\"success\":true,\"message\":\"Sending Message\"}'),
(150, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:19', '{\"success\":true,\"message\":\"Sending Message\"}'),
(151, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:22', '{\"success\":true,\"message\":\"Sending Message\"}'),
(152, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:25', '{\"success\":true,\"message\":\"Sending Message\"}'),
(153, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:28', '{\"success\":true,\"message\":\"Sending Message\"}'),
(154, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:31', '{\"success\":true,\"message\":\"Sending Message\"}'),
(155, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:34', '{\"success\":true,\"message\":\"Sending Message\"}'),
(156, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:37', '{\"success\":true,\"message\":\"Sending Message\"}'),
(157, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:40', '{\"success\":true,\"message\":\"Sending Message\"}'),
(158, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:43', '{\"success\":true,\"message\":\"Sending Message\"}'),
(159, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:46', '{\"success\":true,\"message\":\"Sending Message\"}'),
(160, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:49', '{\"success\":true,\"message\":\"Sending Message\"}'),
(161, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:52', '{\"success\":true,\"message\":\"Sending Message\"}'),
(162, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:55', '{\"success\":true,\"message\":\"Sending Message\"}'),
(163, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:58', '{\"success\":true,\"message\":\"Sending Message\"}'),
(164, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:01', '{\"success\":true,\"message\":\"Sending Message\"}'),
(165, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:04', '{\"success\":true,\"message\":\"Sending Message\"}'),
(166, 'pxIGbZLgFlFo', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:07', '{\"success\":true,\"message\":\"Sending Message\"}'),
(167, 'pxIGbZLgFlFo', 'helo bang', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:07', '{\"success\":true,\"message\":\"Sending Message\"}'),
(168, 'pxIGbZLgFlFo', 'helo bang', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:11', '{\"success\":true,\"message\":\"Sending Message\"}'),
(169, 'pxIGbZLgFlFo', 'helo bang', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:13', '{\"success\":true,\"message\":\"Sending Message\"}'),
(170, 'pxIGbZLgFlFo', 'helo bang', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:16', '{\"success\":true,\"message\":\"Sending Message\"}');
INSERT INTO `tb_message` (`id`, `instance_key`, `message`, `recipient`, `type`, `status`, `date_time`, `data_message`) VALUES
(171, 'pxIGbZLgFlFo', 'helo bang', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:19', '{\"success\":true,\"message\":\"Sending Message\"}'),
(172, 'pxIGbZLgFlFo', 'helo bang', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:22', '{\"success\":true,\"message\":\"Sending Message\"}'),
(173, 'pxIGbZLgFlFo', 'helo bang', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:25', '{\"success\":true,\"message\":\"Sending Message\"}'),
(174, 'pxIGbZLgFlFo', 'helo bang', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:28', '{\"success\":true,\"message\":\"Sending Message\"}'),
(175, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:07', '{\"success\":true,\"message\":\"Sending Message\"}'),
(176, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:10', '{\"success\":true,\"message\":\"Sending Message\"}'),
(177, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:13', '{\"success\":true,\"message\":\"Sending Message\"}'),
(178, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:16', '{\"success\":true,\"message\":\"Sending Message\"}'),
(179, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:19', '{\"success\":true,\"message\":\"Sending Message\"}'),
(180, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:22', '{\"success\":true,\"message\":\"Sending Message\"}'),
(181, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:25', '{\"success\":true,\"message\":\"Sending Message\"}'),
(182, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:28', '{\"success\":true,\"message\":\"Sending Message\"}'),
(183, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:31', '{\"success\":true,\"message\":\"Sending Message\"}'),
(184, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:34', '{\"success\":true,\"message\":\"Sending Message\"}'),
(185, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:37', '{\"success\":true,\"message\":\"Sending Message\"}'),
(186, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:40', '{\"success\":true,\"message\":\"Sending Message\"}'),
(187, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:43', '{\"success\":true,\"message\":\"Sending Message\"}'),
(188, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:46', '{\"success\":true,\"message\":\"Sending Message\"}'),
(189, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:49', '{\"success\":true,\"message\":\"Sending Message\"}'),
(190, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:52', '{\"success\":true,\"message\":\"Sending Message\"}'),
(191, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:55', '{\"success\":true,\"message\":\"Sending Message\"}'),
(192, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:58', '{\"success\":true,\"message\":\"Sending Message\"}'),
(193, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:10', '{\"success\":true,\"message\":\"Sending Message\"}'),
(194, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-28 04:12:13', '{\"success\":true,\"message\":\"Sending Message\"}'),
(195, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:07', '{\"success\":true,\"message\":\"Sending Message\"}'),
(196, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:10', '{\"success\":true,\"message\":\"Sending Message\"}'),
(197, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:13', '{\"success\":true,\"message\":\"Sending Message\"}'),
(198, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:16', '{\"success\":true,\"message\":\"Sending Message\"}'),
(199, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:19', '{\"success\":true,\"message\":\"Sending Message\"}'),
(200, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:22', '{\"success\":true,\"message\":\"Sending Message\"}'),
(201, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:25', '{\"success\":true,\"message\":\"Sending Message\"}'),
(202, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:28', '{\"success\":true,\"message\":\"Sending Message\"}'),
(203, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:31', '{\"success\":true,\"message\":\"Sending Message\"}'),
(204, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:34', '{\"success\":true,\"message\":\"Sending Message\"}'),
(205, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:37', '{\"success\":true,\"message\":\"Sending Message\"}'),
(206, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:40', '{\"success\":true,\"message\":\"Sending Message\"}'),
(207, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:43', '{\"success\":true,\"message\":\"Sending Message\"}'),
(208, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:46', '{\"success\":true,\"message\":\"Sending Message\"}'),
(209, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:49', '{\"success\":true,\"message\":\"Sending Message\"}'),
(210, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:52', '{\"success\":true,\"message\":\"Sending Message\"}'),
(211, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:55', '{\"success\":true,\"message\":\"Sending Message\"}'),
(212, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:58', '{\"success\":true,\"message\":\"Sending Message\"}'),
(213, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:01', '{\"success\":true,\"message\":\"Sending Message\"}'),
(214, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:04', '{\"success\":true,\"message\":\"Sending Message\"}'),
(215, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:07', '{\"success\":true,\"message\":\"Sending Message\"}'),
(216, 'pxIGbZLgFlFo', 'popo', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:10', '{\"success\":true,\"message\":\"Sending Message\"}'),
(217, 'eL9oIzdgytBz', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:08', '{\"success\":true,\"message\":\"Sending Message\"}'),
(218, 'eL9oIzdgytBz', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:12', '{\"success\":true,\"message\":\"Sending Message\"}'),
(219, 'eL9oIzdgytBz', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:13', '{\"success\":true,\"message\":\"Sending Message\"}'),
(220, 'eL9oIzdgytBz', 'bro', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:07', '{\"success\":true,\"message\":\"Sending Message\"}'),
(221, 'eL9oIzdgytBz', 'bro', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:10', '{\"success\":true,\"message\":\"Sending Message\"}'),
(222, 'eL9oIzdgytBz', 'bro', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:13', '{\"success\":true,\"message\":\"Sending Message\"}'),
(223, 'eL9oIzdgytBz', 'bro', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:16', '{\"success\":true,\"message\":\"Sending Message\"}'),
(224, 'eL9oIzdgytBz', 'das', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:49', '{\"success\":true,\"message\":\"Sending Message\"}'),
(225, 'eL9oIzdgytBz', 'das', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-27 18:12:54', '{\"success\":true,\"message\":\"Sending Message\"}'),
(226, 'NzlrOOrrBX4E', 'hello', '6285156345912@s.whatsapp.net', 'chat-text', 'received', '2021-12-29 01:12:11', '{\"success\":true,\"message\":\"Sending Message\"}'),
(227, 'NzlrOOrrBX4E', 'hello', '6285156345912@s.whatsapp.net', 'chat-text', 'received', '2021-12-29 01:12:15', '{\"success\":true,\"message\":\"Sending Message\"}'),
(228, 'NzlrOOrrBX4E', 'hello', '6285156345912@s.whatsapp.net', 'chat-text', 'received', '2021-12-29 01:12:16', '{\"success\":true,\"message\":\"Sending Message\"}'),
(229, 'GiDcaiqI9Hpx', 'hello', '6285156345912@s.whatsapp.net', 'chat-text', 'received', '2021-12-29 02:12:11', '{\"success\":true,\"message\":\"Sending Message\"}'),
(230, 'GiDcaiqI9Hpx', 'hello', '6285156345912@s.whatsapp.net', 'chat-text', 'received', '2021-12-29 02:12:15', '{\"success\":true,\"message\":\"Sending Message\"}'),
(231, 'sSCH8ndvBVlu', 'yuyu', '6285156345912@s.whatsapp.net', 'chat-text', 'received', '2021-12-29 02:12:09', '{\"success\":true,\"message\":\"Sending Message\"}'),
(232, 'sSCH8ndvBVlu', 'yuyu', '62895361034833@s.whatsapp.net', 'chat-text', 'received', '2021-12-29 02:12:14', '{\"success\":true,\"message\":\"Sending Message\"}'),
(233, 'K0fhwvBKQIw5', 'hello', '6285156345912', 'chat-text', 'received', '2022-01-11 01:01:50', '{\"success\":true,\"message\":\"Sending Message\",\"data\":{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":true,\"id\":\"BAE5FFF78C41E58F\"},\"message\":{\"extendedTextMessage\":{\"text\":\"hello\"}},\"messageTimestamp\":\"1641907190\",\"status\":\"PENDING\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `tb_message_in`
--

CREATE TABLE `tb_message_in` (
  `id` int(11) NOT NULL,
  `externalId` varchar(100) NOT NULL,
  `instance_key` varchar(30) NOT NULL,
  `date_time` datetime NOT NULL,
  `pushname` varchar(100) NOT NULL,
  `from_number` varchar(30) NOT NULL,
  `type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `status_message` varchar(20) NOT NULL,
  `data_message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_message_in`
--

INSERT INTO `tb_message_in` (`id`, `externalId`, `instance_key`, `date_time`, `pushname`, `from_number`, `type`, `message`, `status_message`, `data_message`) VALUES
(1, '856DE50F446A7E50C5E2641E5067C323', 'xOmO52xkbZ67', '2021-09-28 02:09:48', 'Whatsva', '6285156345912', 'chat-text', '!salam', 'received', '{\"externalId\":\"856DE50F446A7E50C5E2641E5067C323\",\"ts\":\"1632794961\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"Whatsva\",\"category\":null,\"offline\":null,\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"6285156345912\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"6285156345912\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"!salam\",\"messageContextInfo\":{\"deviceListMetadata\":{\"senderKeyHash\":\"SdTKfEq6uX4Okw==\",\"senderTimestamp\":\"1631501174\",\"recipientKeyHash\":\"kKjan9v6O452rw==\",\"recipientTimestamp\":\"1632718047\"},\"deviceListMetadataVersion\":2}}'),
(2, '856DE50F446A7E50C5E2641E5067C323', 'xOmO52xkbZ67', '2021-09-28 02:09:21', 'Whatsva', '6285156345912', 'chat-text', '!salam', 'received', '{\"externalId\":\"856DE50F446A7E50C5E2641E5067C323\",\"ts\":\"1632794961\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"Whatsva\",\"category\":null,\"offline\":null,\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"6285156345912\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"6285156345912\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"!salam\",\"messageContextInfo\":{\"deviceListMetadata\":{\"senderKeyHash\":\"SdTKfEq6uX4Okw==\",\"senderTimestamp\":\"1631501174\",\"recipientKeyHash\":\"kKjan9v6O452rw==\",\"recipientTimestamp\":\"1632718047\"},\"deviceListMetadataVersion\":2}}'),
(3, '856DE50F446A7E50C5E2641E5067C323', 'xOmO52xkbZ67', '2021-09-28 09:09:21', 'Whatsva', '6285156345912', 'chat-text', '!salam', 'received', '{\"externalId\":\"856DE50F446A7E50C5E2641E5067C323\",\"ts\":\"1632794961\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"Whatsva\",\"category\":null,\"offline\":null,\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"6285156345912\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"6285156345912\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"!salam\",\"messageContextInfo\":{\"deviceListMetadata\":{\"senderKeyHash\":\"SdTKfEq6uX4Okw==\",\"senderTimestamp\":\"1631501174\",\"recipientKeyHash\":\"kKjan9v6O452rw==\",\"recipientTimestamp\":\"1632718047\"},\"deviceListMetadataVersion\":2}}'),
(4, '3EB0217246E6852524BD', 'sNmRMeBHOSFk', '2021-10-28 09:10:56', 'Nova', '62895361034833', 'chat-text', 'hai', 'received', '{\"externalId\":\"3EB0217246E6852524BD\",\"ts\":\"1635430316\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"Nova\",\"category\":null,\"offline\":null,\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"hai\",\"messageContextInfo\":{\"deviceListMetadata\":{\"senderTimestamp\":\"1634457699\",\"recipientKeyHash\":\"nLL715PO6ul7PQ==\",\"recipientTimestamp\":\"1634719282\"},\"deviceListMetadataVersion\":2}}'),
(5, '3FB26B8FAC14FDC4286D106946509468', '1afPLUzI49Am', '2021-10-29 09:10:49', 'martienwira', '6287725534142', 'chat-text', 'Halo Mas', 'received', '{\"externalId\":\"3FB26B8FAC14FDC4286D106946509468\",\"ts\":\"1635511097\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"martienwira\",\"category\":null,\"offline\":\"0\",\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"6287725534142\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"6287725534142\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"Halo Mas\",\"messageContextInfo\":{\"deviceListMetadata\":{\"senderKeyHash\":\"PG3KRW0Yd72Amw==\",\"senderTimestamp\":\"1635504443\",\"recipientKeyHash\":\"mbfEo2HdZ8ozAw==\",\"recipientTimestamp\":\"1635504233\"},\"deviceListMetadataVersion\":2}}'),
(6, 'F384F2803473861D8951B9CD1565FFB3', '1afPLUzI49Am', '2021-10-29 09:10:50', 'WA Kontrol', '6281292970668', 'chat-text', 'Halo', 'received', '{\"externalId\":\"F384F2803473861D8951B9CD1565FFB3\",\"ts\":\"1635513090\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"WA Kontrol\",\"category\":null,\"offline\":\"0\",\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"6281292970668\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"6281292970668\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"Halo\",\"messageContextInfo\":{\"deviceListMetadata\":{\"recipientKeyHash\":\"mbfEo2HdZ8ozAw==\",\"recipientTimestamp\":\"1635504233\"},\"deviceListMetadataVersion\":2}}'),
(7, '81505CC966B4351EF3E43127B32DB827', '1afPLUzI49Am', '2021-10-29 09:10:50', 'WA Kontrol', '6281292970668', 'chat-text', 'Halo', 'received', '{\"externalId\":\"81505CC966B4351EF3E43127B32DB827\",\"ts\":\"1635512687\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"WA Kontrol\",\"category\":null,\"offline\":\"0\",\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"6281292970668\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"6281292970668\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"Halo\",\"messageContextInfo\":{\"deviceListMetadata\":{\"recipientKeyHash\":\"mbfEo2HdZ8ozAw==\",\"recipientTimestamp\":\"1635504233\"},\"deviceListMetadataVersion\":2}}'),
(8, '3D2C6B32757ADF5AE7473E5E4984C38D', '1afPLUzI49Am', '2021-10-29 09:10:50', 'WA Kontrol', '6281292970668', 'chat-text', 'Hi', 'received', '{\"externalId\":\"3D2C6B32757ADF5AE7473E5E4984C38D\",\"ts\":\"1635512707\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"WA Kontrol\",\"category\":null,\"offline\":\"0\",\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"6281292970668\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"6281292970668\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"Hi\",\"messageContextInfo\":{\"deviceListMetadata\":{\"recipientKeyHash\":\"mbfEo2HdZ8ozAw==\",\"recipientTimestamp\":\"1635504233\"},\"deviceListMetadataVersion\":2}}'),
(9, '6BB4B0A088B2B07ADB91F2A7F91B4B1D', '1afPLUzI49Am', '2021-10-29 09:10:50', 'WA Kontrol', '6281292970668', 'chat-text', 'Halo', 'received', '{\"externalId\":\"6BB4B0A088B2B07ADB91F2A7F91B4B1D\",\"ts\":\"1635512671\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"WA Kontrol\",\"category\":null,\"offline\":\"0\",\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"6281292970668\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"6281292970668\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"Halo\",\"messageContextInfo\":{\"deviceListMetadata\":{\"recipientKeyHash\":\"mbfEo2HdZ8ozAw==\",\"recipientTimestamp\":\"1635504233\"},\"deviceListMetadataVersion\":2}}'),
(10, '3B0730F80D6191AD490B3CF645C84301', '1afPLUzI49Am', '2021-10-29 09:10:50', 'Nova', '62895361034833', 'chat-text', 'jj', 'received', '{\"externalId\":\"3B0730F80D6191AD490B3CF645C84301\",\"ts\":\"1635518810\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"Nova\",\"category\":null,\"offline\":null,\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"jj\",\"messageContextInfo\":{\"deviceListMetadata\":{\"senderTimestamp\":\"1634457699\",\"recipientKeyHash\":\"lN3HEBOHr\\/uLjA==\",\"recipientTimestamp\":\"1635487844\"},\"deviceListMetadataVersion\":2}}'),
(11, 'E506A03C3D47C4FA456DC73FE5518853', '1afPLUzI49Am', '2021-10-29 09:10:51', 'Nova', '62895361034833', 'chat-text', 'hh', 'received', '{\"externalId\":\"E506A03C3D47C4FA456DC73FE5518853\",\"ts\":\"1635518810\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"Nova\",\"category\":null,\"offline\":null,\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"hh\",\"messageContextInfo\":{\"deviceListMetadata\":{\"senderTimestamp\":\"1634457699\",\"recipientKeyHash\":\"lN3HEBOHr\\/uLjA==\",\"recipientTimestamp\":\"1635487844\"},\"deviceListMetadataVersion\":2}}'),
(12, 'B9E124EC6504107E76E8DDFD0F9B1489', '1afPLUzI49Am', '2021-10-29 09:10:51', 'Nova', '62895361034833', 'chat-text', 'apa kabar', 'received', '{\"externalId\":\"B9E124EC6504107E76E8DDFD0F9B1489\",\"ts\":\"1635518811\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"Nova\",\"category\":null,\"offline\":null,\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"apa kabar\",\"messageContextInfo\":{\"deviceListMetadata\":{\"senderTimestamp\":\"1634457699\",\"recipientKeyHash\":\"lN3HEBOHr\\/uLjA==\",\"recipientTimestamp\":\"1635487844\"},\"deviceListMetadataVersion\":2}}'),
(13, '32B853353F46E62AAAA64D01208FCD98', '1afPLUzI49Am', '2021-10-29 09:10:52', 'Nova', '62895361034833', 'chat-text', 'bro', 'received', '{\"externalId\":\"32B853353F46E62AAAA64D01208FCD98\",\"ts\":\"1635518811\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"Nova\",\"category\":null,\"offline\":null,\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"bro\",\"messageContextInfo\":{\"deviceListMetadata\":{\"senderTimestamp\":\"1634457699\",\"recipientKeyHash\":\"lN3HEBOHr\\/uLjA==\",\"recipientTimestamp\":\"1635487844\"},\"deviceListMetadataVersion\":2}}'),
(14, '9D0AC40C50825EFFD97F1F92BD651686', '1afPLUzI49Am', '2021-10-29 09:10:52', 'Nova', '62895361034833', 'chat-text', 'bro', 'received', '{\"externalId\":\"9D0AC40C50825EFFD97F1F92BD651686\",\"ts\":\"1635518811\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"Nova\",\"category\":null,\"offline\":null,\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"bro\",\"messageContextInfo\":{\"deviceListMetadata\":{\"senderTimestamp\":\"1634457699\",\"recipientKeyHash\":\"lN3HEBOHr\\/uLjA==\",\"recipientTimestamp\":\"1635487844\"},\"deviceListMetadataVersion\":2}}'),
(15, '6DE6BDAA135BFC62E0EEEE049BE0F603', '1afPLUzI49Am', '2021-10-29 09:10:52', 'Nova', '62895361034833', 'chat-text', 'bt', 'received', '{\"externalId\":\"6DE6BDAA135BFC62E0EEEE049BE0F603\",\"ts\":\"1635518812\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"Nova\",\"category\":null,\"offline\":null,\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"bt\",\"messageContextInfo\":{\"deviceListMetadata\":{\"senderTimestamp\":\"1634457699\",\"recipientKeyHash\":\"lN3HEBOHr\\/uLjA==\",\"recipientTimestamp\":\"1635487844\"},\"deviceListMetadataVersion\":2}}'),
(16, '95E1F4ED9947B86058C8BF3DDE7976CE', '1afPLUzI49Am', '2021-10-29 09:10:52', 'Nova', '62895361034833', 'chat-text', 'bri', 'received', '{\"externalId\":\"95E1F4ED9947B86058C8BF3DDE7976CE\",\"ts\":\"1635518812\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"Nova\",\"category\":null,\"offline\":null,\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"bri\",\"messageContextInfo\":{\"deviceListMetadata\":{\"senderTimestamp\":\"1634457699\",\"recipientKeyHash\":\"lN3HEBOHr\\/uLjA==\",\"recipientTimestamp\":\"1635487844\"},\"deviceListMetadataVersion\":2}}'),
(17, '3EB0E43C73E5713161C5', 'JSnOq7FAIqmk', '2021-10-29 10:10:54', 'Nova', '62895361034833', 'chat-text', 'apakabar', 'received', '{\"externalId\":\"3EB0E43C73E5713161C5\",\"ts\":\"1635519893\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"Nova\",\"category\":null,\"offline\":null,\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"apakabar\",\"messageContextInfo\":{\"deviceListMetadata\":{\"senderTimestamp\":\"1634457699\",\"recipientKeyHash\":\"v0IpNiitOegoDg==\",\"recipientTimestamp\":\"1635519863\"},\"deviceListMetadataVersion\":2},\"file_path\":\"\"}'),
(18, '3EB0F0FF5721D4E2A5E1', 'JSnOq7FAIqmk', '2021-10-29 10:10:17', 'Nova', '62895361034833', 'chat-text', 'hello', 'received', '{\"externalId\":\"3EB0F0FF5721D4E2A5E1\",\"ts\":\"1635520095\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"Nova\",\"category\":null,\"offline\":null,\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"hello\",\"messageContextInfo\":{\"deviceListMetadata\":{\"senderTimestamp\":\"1634457699\",\"recipientKeyHash\":\"v0IpNiitOegoDg==\",\"recipientTimestamp\":\"1635519863\"},\"deviceListMetadataVersion\":2},\"file_path\":\"\"}'),
(19, '3EB02351CC9F1C3FA703', 'JSnOq7FAIqmk', '2021-10-29 10:10:32', 'Nova', '62895361034833', 'chat-text', 'bang', 'received', '{\"externalId\":\"3EB02351CC9F1C3FA703\",\"ts\":\"1635520111\",\"edit\":-1,\"isHsm\":false,\"count\":null,\"pushname\":\"Nova\",\"category\":null,\"offline\":null,\"type\":\"chat\",\"chat\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"author\":{\"type\":\"wapJid\",\"jid\":{\"type\":0,\"user\":\"62895361034833\",\"server\":\"s.whatsapp.net\"}},\"conversation\":\"bang\",\"messageContextInfo\":{\"deviceListMetadata\":{\"senderTimestamp\":\"1634457699\",\"recipientKeyHash\":\"v0IpNiitOegoDg==\",\"recipientTimestamp\":\"1635519863\"},\"deviceListMetadataVersion\":2},\"file_path\":\"\"}'),
(20, 'F5EFA00A53ECFD588A46E1ABAA883462', 'in73vy6JbUxI', '2022-01-07 11:01:51', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'hai', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"F5EFA00A53ECFD588A46E1ABAA883462\"},\"message\":{\"conversation\":\"hai\"},\"messageTimestamp\":\"1641573346\",\"ephemeralOutOfSync\":false}'),
(21, 'BC11F95382110CB1ADA160C8DA9FB7A0', 'in73vy6JbUxI', '2022-01-07 11:01:27', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'hai', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BC11F95382110CB1ADA160C8DA9FB7A0\"},\"message\":{\"conversation\":\"hai\"},\"messageTimestamp\":\"1641573381\",\"ephemeralOutOfSync\":false}'),
(22, '550B231BCE2E480A5ECB36AC25F1024A', 'in73vy6JbUxI', '2022-01-08 12:01:13', '6282226119071@s.whatsapp.net', '6282226119071@s.whatsapp.net', 'chat-text', 'Terserah', 'received', '{\"key\":{\"remoteJid\":\"6282226119071@s.whatsapp.net\",\"fromMe\":false,\"id\":\"550B231BCE2E480A5ECB36AC25F1024A\"},\"message\":{\"conversation\":\"Terserah\"},\"messageTimestamp\":\"1641574870\",\"ignore\":true,\"ephemeralOutOfSync\":false}'),
(23, '5846AC798108D05121967B54A699D7E2', 'in73vy6JbUxI', '2022-01-08 08:01:48', '6281327010080@s.whatsapp.net', '6281327010080@s.whatsapp.net', 'chat-text', 'Posisi ngenteni nek ndi?', 'received', '{\"key\":{\"remoteJid\":\"6281327010080@s.whatsapp.net\",\"fromMe\":false,\"id\":\"5846AC798108D05121967B54A699D7E2\"},\"message\":{\"conversation\":\"Posisi ngenteni nek ndi?\"},\"messageTimestamp\":\"1640945508\",\"ephemeralOutOfSync\":false}'),
(24, '5846AC798108D05121967B54A699D7E2', 'in73vy6JbUxI', '2022-01-08 08:01:51', '6281327010080@s.whatsapp.net', '6281327010080@s.whatsapp.net', 'chat-text', 'Posisi ngenteni nek ndi?', 'received', '{\"key\":{\"remoteJid\":\"6281327010080@s.whatsapp.net\",\"fromMe\":false,\"id\":\"5846AC798108D05121967B54A699D7E2\"},\"message\":{\"conversation\":\"Posisi ngenteni nek ndi?\"},\"messageTimestamp\":\"1640945508\",\"ephemeralOutOfSync\":false}'),
(25, 'BC11F95382110CB1ADA160C8DA9FB7A0', 'in73vy6JbUxI', '2022-01-08 08:01:51', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'hai', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BC11F95382110CB1ADA160C8DA9FB7A0\"},\"message\":{\"conversation\":\"hai\"},\"messageTimestamp\":\"1641573381\",\"ephemeralOutOfSync\":false}'),
(26, 'BC11F95382110CB1ADA160C8DA9FB7A0', 'in73vy6JbUxI', '2022-01-08 08:01:55', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'hai', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BC11F95382110CB1ADA160C8DA9FB7A0\"},\"message\":{\"conversation\":\"hai\"},\"messageTimestamp\":\"1641573381\",\"ephemeralOutOfSync\":false}'),
(27, '2ABAC0AD38388B658BFDED7102D68559', 'in73vy6JbUxI', '2022-01-08 08:01:40', '6282226119071@s.whatsapp.net', '6282226119071@s.whatsapp.net', 'chat-text', 'Pagi', 'received', '{\"key\":{\"remoteJid\":\"6282226119071@s.whatsapp.net\",\"fromMe\":false,\"id\":\"2ABAC0AD38388B658BFDED7102D68559\"},\"message\":{\"conversation\":\"Pagi\"},\"messageTimestamp\":\"1641606158\",\"ephemeralOutOfSync\":false}'),
(28, '3F11C33E5870749ABF959A0650C13490', 'in73vy6JbUxI', '2022-01-08 09:01:38', '6289624333338@s.whatsapp.net', '6289624333338@s.whatsapp.net', 'chat-text', 'Dek model pintu py mu py. Iki tukang e bingung', 'received', '{\"key\":{\"remoteJid\":\"6289624333338@s.whatsapp.net\",\"fromMe\":false,\"id\":\"3F11C33E5870749ABF959A0650C13490\"},\"message\":{\"conversation\":\"Dek model pintu py mu py. Iki tukang e bingung\"},\"messageTimestamp\":\"1641609036\",\"ephemeralOutOfSync\":false}'),
(29, '3F11C33E5870749ABF959A0650C13490', 'in73vy6JbUxI', '2022-01-08 09:01:26', '6289624333338@s.whatsapp.net', '6289624333338@s.whatsapp.net', 'chat-text', 'Dek model pintu py mu py. Iki tukang e bingung', 'received', '{\"key\":{\"remoteJid\":\"6289624333338@s.whatsapp.net\",\"fromMe\":false,\"id\":\"3F11C33E5870749ABF959A0650C13490\"},\"message\":{\"conversation\":\"Dek model pintu py mu py. Iki tukang e bingung\"},\"messageTimestamp\":\"1641609036\",\"ephemeralOutOfSync\":false}'),
(30, '5846AC798108D05121967B54A699D7E2', 'in73vy6JbUxI', '2022-01-08 09:01:26', '6281327010080@s.whatsapp.net', '6281327010080@s.whatsapp.net', 'chat-text', 'Posisi ngenteni nek ndi?', 'received', '{\"key\":{\"remoteJid\":\"6281327010080@s.whatsapp.net\",\"fromMe\":false,\"id\":\"5846AC798108D05121967B54A699D7E2\"},\"message\":{\"conversation\":\"Posisi ngenteni nek ndi?\"},\"messageTimestamp\":\"1640945508\",\"ephemeralOutOfSync\":false}'),
(31, '3F11C33E5870749ABF959A0650C13490', 'in73vy6JbUxI', '2022-01-08 09:01:28', '6289624333338@s.whatsapp.net', '6289624333338@s.whatsapp.net', 'chat-text', 'Dek model pintu py mu py. Iki tukang e bingung', 'received', '{\"key\":{\"remoteJid\":\"6289624333338@s.whatsapp.net\",\"fromMe\":false,\"id\":\"3F11C33E5870749ABF959A0650C13490\"},\"message\":{\"conversation\":\"Dek model pintu py mu py. Iki tukang e bingung\"},\"messageTimestamp\":\"1641609036\",\"ephemeralOutOfSync\":false}'),
(32, '5846AC798108D05121967B54A699D7E2', 'in73vy6JbUxI', '2022-01-08 09:01:28', '6281327010080@s.whatsapp.net', '6281327010080@s.whatsapp.net', 'chat-text', 'Posisi ngenteni nek ndi?', 'received', '{\"key\":{\"remoteJid\":\"6281327010080@s.whatsapp.net\",\"fromMe\":false,\"id\":\"5846AC798108D05121967B54A699D7E2\"},\"message\":{\"conversation\":\"Posisi ngenteni nek ndi?\"},\"messageTimestamp\":\"1640945508\",\"ephemeralOutOfSync\":false}'),
(33, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:38', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(34, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:38', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(35, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:38', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(36, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:38', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(37, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:39', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(38, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:34', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(39, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:34', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(40, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:34', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(41, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:34', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(42, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:35', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(43, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:35', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(44, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:36', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(45, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:36', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(46, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:36', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(47, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:36', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(48, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:36', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(49, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:37', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(50, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:38', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(51, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:38', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(52, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:38', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(53, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:38', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(54, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:39', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(55, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:39', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(56, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:40', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(57, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:40', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(58, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:40', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(59, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:40', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(60, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:40', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(61, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:40', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(62, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:43', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(63, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:43', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(64, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:43', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(65, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:43', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(66, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:44', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(67, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:44', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(68, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:44', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(69, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:44', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(70, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:44', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(71, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:45', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(72, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:45', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(73, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:45', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(74, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:46', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(75, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:46', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(76, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:46', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(77, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:46', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(78, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:47', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(79, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:47', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(80, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:47', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(81, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:47', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(82, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:47', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(83, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:47', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(84, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:48', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(85, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:48', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(86, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:48', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(87, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:49', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(88, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:49', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(89, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:49', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(90, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:49', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(91, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:50', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(92, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:50', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(93, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:50', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(94, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:50', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(95, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:50', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(96, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:50', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(97, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:50', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(98, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:51', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}');
INSERT INTO `tb_message_in` (`id`, `externalId`, `instance_key`, `date_time`, `pushname`, `from_number`, `type`, `message`, `status_message`, `data_message`) VALUES
(99, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:51', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(100, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:51', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(101, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:51', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(102, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:51', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(103, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:51', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(104, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:53', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(105, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:53', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(106, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:53', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(107, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:53', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(108, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:53', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(109, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:53', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(110, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:54', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(111, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:54', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(112, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:54', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(113, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:54', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(114, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:54', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(115, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:54', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(116, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:55', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(117, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:55', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(118, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:55', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(119, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:55', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(120, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:55', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(121, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:55', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(122, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:57', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(123, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:57', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(124, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:57', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(125, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:57', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(126, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:57', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(127, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:57', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(128, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:58', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(129, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:58', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(130, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:58', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(131, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:58', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(132, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:58', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(133, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:58', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(134, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:00', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(135, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:00', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(136, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:00', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(137, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:00', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(138, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:00', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(139, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:01', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(140, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:01', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(141, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:01', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(142, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:01', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(143, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:01', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(144, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:01', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(145, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:01', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(146, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:02', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(147, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:02', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(148, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:02', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(149, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:02', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(150, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:02', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(151, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:02', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(152, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:03', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(153, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:03', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(154, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:03', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(155, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:03', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(156, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:03', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(157, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:04', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(158, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:05', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(159, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:05', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(160, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:05', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(161, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:05', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(162, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:05', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(163, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:05', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(164, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:08', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(165, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:08', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(166, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:08', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(167, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:08', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(168, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:08', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(169, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:08', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(170, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:09', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(171, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:09', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(172, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:09', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(173, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:09', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(174, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:10', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(175, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:10', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(176, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:11', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(177, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:11', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(178, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:11', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(179, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:11', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(180, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:11', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(181, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:11', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(182, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 08:01:12', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(183, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 08:01:13', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(184, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 08:01:13', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(185, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 08:01:13', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(186, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 08:01:13', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(187, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 08:01:13', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(188, '3A76180A7E8114CE8F7C', 'K0fhwvBKQIw5', '2022-01-11 11:01:20', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Ya mbak, tak balik..', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3A76180A7E8114CE8F7C\"},\"message\":{\"conversation\":\"Ya mbak, tak balik..\"},\"messageTimestamp\":\"1641880102\",\"participant\":\"628982382323@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(189, '3C3B6EF3576A9B4B27E0E01EDAA5EB49', 'K0fhwvBKQIw5', '2022-01-11 11:01:20', '6282226119071@s.whatsapp.net', '6282226119071@s.whatsapp.net', 'chat-text', 'Rencananya mau tidur sih', 'received', '{\"key\":{\"remoteJid\":\"6282226119071@s.whatsapp.net\",\"fromMe\":false,\"id\":\"3C3B6EF3576A9B4B27E0E01EDAA5EB49\"},\"message\":{\"conversation\":\"Rencananya mau tidur sih\"},\"messageTimestamp\":\"1641912396\",\"ephemeralOutOfSync\":false}'),
(190, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-11 11:01:20', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(191, '3F6207DE0B18852860B61B0920E0C9F9', 'K0fhwvBKQIw5', '2022-01-11 11:01:21', '6282134069628-1586700324@g.us', '6282134069628-1586700324@g.us', 'chat-text', 'Pinter e poool', 'received', '{\"key\":{\"remoteJid\":\"6282134069628-1586700324@g.us\",\"fromMe\":false,\"id\":\"3F6207DE0B18852860B61B0920E0C9F9\"},\"message\":{\"conversation\":\"Pinter e poool\"},\"messageTimestamp\":\"1641698227\",\"participant\":\"6289624333338@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(192, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-11 11:01:21', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(193, 'ABA4C5435BCA124DD953C24213575822', 'K0fhwvBKQIw5', '2022-01-11 11:01:21', '6285226940802@s.whatsapp.net', '6285226940802@s.whatsapp.net', 'chat-text', 'Angkat tangan', 'received', '{\"key\":{\"remoteJid\":\"6285226940802@s.whatsapp.net\",\"fromMe\":false,\"id\":\"ABA4C5435BCA124DD953C24213575822\"},\"message\":{\"conversation\":\"Angkat tangan\"},\"messageTimestamp\":\"1641910545\",\"ephemeralOutOfSync\":false}'),
(194, '9A43AF87F49134B1799878EE38E26249', 'K0fhwvBKQIw5', '2022-01-11 11:01:21', '6281327010080@s.whatsapp.net', '6281327010080@s.whatsapp.net', 'chat-text', 'Ada yg mau beli kerudung', 'received', '{\"key\":{\"remoteJid\":\"6281327010080@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9A43AF87F49134B1799878EE38E26249\"},\"message\":{\"conversation\":\"Ada yg mau beli kerudung\"},\"messageTimestamp\":\"1641911895\",\"ephemeralOutOfSync\":false}'),
(195, 'BAE597842D5ED614', 'K0fhwvBKQIw5', '2022-01-11 11:01:21', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'pipi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE597842D5ED614\"},\"message\":{\"conversation\":\"pipi\"},\"messageTimestamp\":\"1641797329\",\"ephemeralOutOfSync\":false}'),
(196, '3AF1E98100EA15CEE352', 'K0fhwvBKQIw5', '2022-01-11 11:01:21', '6285225262627-1481000660@g.us', '6285225262627-1481000660@g.us', 'chat-text', 'Sudah dibersihkan, terimakasih infonya', 'received', '{\"key\":{\"remoteJid\":\"6285225262627-1481000660@g.us\",\"fromMe\":false,\"id\":\"3AF1E98100EA15CEE352\"},\"message\":{\"conversation\":\"Sudah dibersihkan, terimakasih infonya\"},\"messageTimestamp\":\"1641828050\",\"participant\":\"6285786447406@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(197, '3AFE906D569026D126DD', 'K0fhwvBKQIw5', '2022-01-12 08:01:37', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Lur aku telat ya aku meh ke kantor cabang dinas dulu', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3AFE906D569026D126DD\"},\"message\":{\"conversation\":\"Lur aku telat ya aku meh ke kantor cabang dinas dulu\"},\"messageTimestamp\":\"1641949606\",\"participant\":\"6281230339271@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(198, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-12 08:01:37', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(199, '881D94F9D8CB3CD916B5008B33A546E1', 'K0fhwvBKQIw5', '2022-01-12 08:01:37', '6282226119071@s.whatsapp.net', '6282226119071@s.whatsapp.net', 'chat-text', 'Sorry ya ngantuk bgt semalem baru bisa tidur', 'received', '{\"key\":{\"remoteJid\":\"6282226119071@s.whatsapp.net\",\"fromMe\":false,\"id\":\"881D94F9D8CB3CD916B5008B33A546E1\"},\"message\":{\"conversation\":\"Sorry ya ngantuk bgt semalem baru bisa tidur\"},\"messageTimestamp\":\"1641938118\",\"ephemeralOutOfSync\":false}'),
(200, '6674ED6FB5D709C04204FD23BFAF232B', 'K0fhwvBKQIw5', '2022-01-12 08:01:37', '6281215416084@s.whatsapp.net', '6281215416084@s.whatsapp.net', 'chat-text', 'Ws nop', 'received', '{\"key\":{\"remoteJid\":\"6281215416084@s.whatsapp.net\",\"fromMe\":false,\"id\":\"6674ED6FB5D709C04204FD23BFAF232B\"},\"message\":{\"conversation\":\"Ws nop\"},\"messageTimestamp\":\"1641951729\",\"ephemeralOutOfSync\":false}'),
(201, 'ABA4C5435BCA124DD953C24213575822', 'K0fhwvBKQIw5', '2022-01-12 08:01:37', '6285226940802@s.whatsapp.net', '6285226940802@s.whatsapp.net', 'chat-text', 'Angkat tangan', 'received', '{\"key\":{\"remoteJid\":\"6285226940802@s.whatsapp.net\",\"fromMe\":false,\"id\":\"ABA4C5435BCA124DD953C24213575822\"},\"message\":{\"conversation\":\"Angkat tangan\"},\"messageTimestamp\":\"1641910545\",\"ephemeralOutOfSync\":false}'),
(202, 'BAE57828C651D3B6', 'K0fhwvBKQIw5', '2022-01-12 08:01:38', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'Informasi dari Aplikasi Dokter \n\n Dokter : Ardhian Noor Wicaksono, dr. Sp.THT-KL \n Tanggal : 2022-Jan-12 \n Jam : 08:01:24 \n\nTelah Mengakses Aplikasi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE57828C651D3B6\"},\"message\":{\"conversation\":\"Informasi dari Aplikasi Dokter \\n\\n Dokter : Ardhian Noor Wicaksono, dr. Sp.THT-KL \\n Tanggal : 2022-Jan-12 \\n Jam : 08:01:24 \\n\\nTelah Mengakses Aplikasi\"},\"messageTimestamp\":\"1641950909\",\"ephemeralOutOfSync\":false}'),
(203, '9A43AF87F49134B1799878EE38E26249', 'K0fhwvBKQIw5', '2022-01-12 08:01:38', '6281327010080@s.whatsapp.net', '6281327010080@s.whatsapp.net', 'chat-text', 'Ada yg mau beli kerudung', 'received', '{\"key\":{\"remoteJid\":\"6281327010080@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9A43AF87F49134B1799878EE38E26249\"},\"message\":{\"conversation\":\"Ada yg mau beli kerudung\"},\"messageTimestamp\":\"1641911895\",\"ephemeralOutOfSync\":false}'),
(204, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-12 08:01:38', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}'),
(205, '3AFE906D569026D126DD', 'K0fhwvBKQIw5', '2022-01-12 09:01:57', '6282242196611-1545229111@g.us', '6282242196611-1545229111@g.us', 'chat-text', 'Lur aku telat ya aku meh ke kantor cabang dinas dulu', 'received', '{\"key\":{\"remoteJid\":\"6282242196611-1545229111@g.us\",\"fromMe\":false,\"id\":\"3AFE906D569026D126DD\"},\"message\":{\"conversation\":\"Lur aku telat ya aku meh ke kantor cabang dinas dulu\"},\"messageTimestamp\":\"1641949606\",\"participant\":\"6281230339271@s.whatsapp.net\",\"ephemeralOutOfSync\":false}'),
(206, '478893362442846ADA5916BA883759AC', 'K0fhwvBKQIw5', '2022-01-12 09:01:57', '6285215000396@s.whatsapp.net', '6285215000396@s.whatsapp.net', 'chat-text', 'Oke sdh bisa mas', 'received', '{\"key\":{\"remoteJid\":\"6285215000396@s.whatsapp.net\",\"fromMe\":false,\"id\":\"478893362442846ADA5916BA883759AC\"},\"message\":{\"conversation\":\"Oke sdh bisa mas\"},\"messageTimestamp\":\"1641898493\",\"ephemeralOutOfSync\":false}'),
(207, 'BAE57828C651D3B6', 'K0fhwvBKQIw5', '2022-01-12 09:01:58', '6285156345912@s.whatsapp.net', '6285156345912@s.whatsapp.net', 'chat-text', 'Informasi dari Aplikasi Dokter \n\n Dokter : Ardhian Noor Wicaksono, dr. Sp.THT-KL \n Tanggal : 2022-Jan-12 \n Jam : 08:01:24 \n\nTelah Mengakses Aplikasi', 'received', '{\"key\":{\"remoteJid\":\"6285156345912@s.whatsapp.net\",\"fromMe\":false,\"id\":\"BAE57828C651D3B6\"},\"message\":{\"conversation\":\"Informasi dari Aplikasi Dokter \\n\\n Dokter : Ardhian Noor Wicaksono, dr. Sp.THT-KL \\n Tanggal : 2022-Jan-12 \\n Jam : 08:01:24 \\n\\nTelah Mengakses Aplikasi\"},\"messageTimestamp\":\"1641950909\",\"ephemeralOutOfSync\":false}'),
(208, '9A43AF87F49134B1799878EE38E26249', 'K0fhwvBKQIw5', '2022-01-12 09:01:58', '6281327010080@s.whatsapp.net', '6281327010080@s.whatsapp.net', 'chat-text', 'Ada yg mau beli kerudung', 'received', '{\"key\":{\"remoteJid\":\"6281327010080@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9A43AF87F49134B1799878EE38E26249\"},\"message\":{\"conversation\":\"Ada yg mau beli kerudung\"},\"messageTimestamp\":\"1641911895\",\"ephemeralOutOfSync\":false}'),
(209, 'ABA4C5435BCA124DD953C24213575822', 'K0fhwvBKQIw5', '2022-01-12 09:01:58', '6285226940802@s.whatsapp.net', '6285226940802@s.whatsapp.net', 'chat-text', 'Angkat tangan', 'received', '{\"key\":{\"remoteJid\":\"6285226940802@s.whatsapp.net\",\"fromMe\":false,\"id\":\"ABA4C5435BCA124DD953C24213575822\"},\"message\":{\"conversation\":\"Angkat tangan\"},\"messageTimestamp\":\"1641910545\",\"ephemeralOutOfSync\":false}');
INSERT INTO `tb_message_in` (`id`, `externalId`, `instance_key`, `date_time`, `pushname`, `from_number`, `type`, `message`, `status_message`, `data_message`) VALUES
(210, '881D94F9D8CB3CD916B5008B33A546E1', 'K0fhwvBKQIw5', '2022-01-12 09:01:58', '6282226119071@s.whatsapp.net', '6282226119071@s.whatsapp.net', 'chat-text', 'Sorry ya ngantuk bgt semalem baru bisa tidur', 'received', '{\"key\":{\"remoteJid\":\"6282226119071@s.whatsapp.net\",\"fromMe\":false,\"id\":\"881D94F9D8CB3CD916B5008B33A546E1\"},\"message\":{\"conversation\":\"Sorry ya ngantuk bgt semalem baru bisa tidur\"},\"messageTimestamp\":\"1641938118\",\"ephemeralOutOfSync\":false}'),
(211, '6674ED6FB5D709C04204FD23BFAF232B', 'K0fhwvBKQIw5', '2022-01-12 09:01:58', '6281215416084@s.whatsapp.net', '6281215416084@s.whatsapp.net', 'chat-text', 'Ws nop', 'received', '{\"key\":{\"remoteJid\":\"6281215416084@s.whatsapp.net\",\"fromMe\":false,\"id\":\"6674ED6FB5D709C04204FD23BFAF232B\"},\"message\":{\"conversation\":\"Ws nop\"},\"messageTimestamp\":\"1641951729\",\"ephemeralOutOfSync\":false}'),
(212, '9B371405A0B1A4907F3A492EA9557EE6', 'K0fhwvBKQIw5', '2022-01-12 09:01:58', '6289649758324@s.whatsapp.net', '6289649758324@s.whatsapp.net', 'chat-text', 'ok siap', 'received', '{\"key\":{\"remoteJid\":\"6289649758324@s.whatsapp.net\",\"fromMe\":false,\"id\":\"9B371405A0B1A4907F3A492EA9557EE6\"},\"message\":{\"conversation\":\"ok siap\"},\"messageTimestamp\":\"1641871731\",\"ephemeralOutOfSync\":false}');

-- --------------------------------------------------------

--
-- Table structure for table `tb_package`
--

CREATE TABLE `tb_package` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `device_max` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `day_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_package`
--

INSERT INTO `tb_package` (`id`, `name`, `price`, `device_max`, `status`, `day_value`) VALUES
(1, 'Individu', 50000, 5, 0, 30),
(2, 'Individu Package', 100000, 5, 1, 30),
(3, 'StartUp Package 2', 249000, 20, 1, 30),
(4, 'Trial Package', 0, 1, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tb_setting`
--

CREATE TABLE `tb_setting` (
  `id` int(11) NOT NULL,
  `panel_key` varchar(100) NOT NULL,
  `app_name` varchar(200) NOT NULL,
  `domain` varchar(200) NOT NULL,
  `client_key` varchar(50) DEFAULT NULL,
  `server_key` varchar(50) DEFAULT NULL,
  `url_handle_notification` text,
  `isProduction` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_setting`
--

INSERT INTO `tb_setting` (`id`, `panel_key`, `app_name`, `domain`, `client_key`, `server_key`, `url_handle_notification`, `isProduction`) VALUES
(1, 'xxsbsd2mu4i1', 'Whatsapp BroadCast', 'http://localhost/wapa', 'SB-Mid-client-G699eb4x0NgQLdEL', 'SB-Mid-server-RH4S3FpXeevCsj6M5hNbWf5k', 'index.php/io/midtrans', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id` int(11) NOT NULL,
  `kode_transaksi` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_package` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `status_paid` int(11) NOT NULL,
  `day_value` int(11) NOT NULL,
  `price_package` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id`, `kode_transaksi`, `id_user`, `id_package`, `total_price`, `discount`, `date_time`, `status_paid`, `day_value`, `price_package`, `status`) VALUES
(6, '54a59CUqyoI', 1, 1, 100000, 0, '2021-10-25 20:16:03', 1, 0, 0, 1),
(7, 'sHlAXEruFdp', 1, 1, 100000, 0, '2021-10-25 21:10:32', 1, 0, 0, 1),
(8, 'wvbdsycuNdw', 1, 1, 100000, 0, '2021-10-25 21:10:48', 3, 0, 0, 1),
(9, 'sekdmObPXbu', 1, 1, 100000, 0, '2021-10-25 21:11:08', 1, 0, 0, 1),
(10, 'rXAhMcLpzZ0', 1, 1, 100000, 0, '2021-10-25 21:11:08', 1, 0, 0, 1),
(14, 'kwgehz3myn', 18, 3, 273900, 0, '2021-10-27 11:10:38', 1, 30, 249000, 1),
(15, 'rj0kupv4qo', 18, 3, 273900, 0, '2021-10-27 11:10:56', 1, 30, 249000, 1),
(16, 'bawelsi4vk', 18, 3, 273900, 0, '2021-10-27 11:10:07', 1, 30, 249000, 1),
(17, 'jlopy0hgc2', 18, 2, 110000, 0, '2021-10-27 11:10:13', 1, 30, 100000, 1),
(18, 'djue6hf305', 18, 3, 273900, 0, '2021-10-27 11:10:08', 1, 30, 249000, 1),
(19, '2bkg5si4h7', 18, 2, 110000, 0, '2021-10-27 10:10:27', 1, 30, 100000, 1),
(20, 'tmxig51cns', 18, 3, 273900, 0, '2021-10-27 10:10:56', 1, 30, 249000, 1),
(21, 'a8bxczu405', 19, 2, 110000, 0, '2022-01-07 11:01:30', 3, 30, 100000, 1),
(22, 'l2i4t83cjr', 19, 2, 110000, 0, '2022-01-11 06:01:20', 1, 30, 100000, 1),
(23, 'phtvgq93lw', 19, 3, 249000, 0, '2022-01-11 07:01:58', 1, 30, 249000, 1),
(27, 'uwscil0ek9', 22, 3, 249000, 0, '2022-01-11 10:01:02', 1, 30, 249000, 1),
(28, 'hbg480zqfl', 22, 3, 249000, 0, '2022-01-11 10:01:25', 1, 30, 249000, 1),
(29, 'o3ygj9iw7h', 26, 4, 0, 0, '2022-01-11 10:01:15', 1, 3, 0, 1),
(30, '9roeqcpij3', 27, 4, 0, 0, '2022-01-11 10:01:48', 1, 3, 0, 3),
(31, 'm27evdhyzi', 30, 4, 0, 0, '2022-01-11 10:01:25', 3, 3, 0, 1),
(32, 'kysgi96lcq', 30, 2, 100000, 0, '2022-01-11 11:01:30', 1, 30, 100000, 1),
(33, '5gakmpczdn', 30, 2, 100000, 0, '2022-01-11 11:01:04', 3, 30, 100000, 1),
(34, 'djl9mnec4b', 30, 3, 249000, 0, '2022-01-11 11:01:37', 1, 30, 249000, 1),
(35, 'ndjo8h9vew', 30, 3, 249000, 0, '2022-01-11 11:01:01', 1, 30, 249000, 1),
(36, '5gmqbc3106', 30, 2, 100000, 0, '2022-01-12 08:01:41', 1, 30, 100000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `level` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `email`, `phone_number`, `password`, `level`, `status`, `last_login`, `start_date`) VALUES
(1, 'admin', 'admin@gmail.com', '', '$2y$10$hRi1qju2KOeEPcBZ0wYfhu/PN5e9Wl.ddWeDTds8Uokad764X9D1a', 2, 1, '2022-01-19 02:54:04', NULL),
(2, 'client01', 'client01@gmail.com', '', '123456', 1, 0, '2021-09-20 03:11:40', NULL),
(3, 'client02', 'client02@gmail.com', '', 'nova123', 2, 0, '2021-09-20 03:14:12', NULL),
(4, 'client03', 'client03@gmail.com', '', 'client03', 1, 0, '2021-09-20 03:17:30', NULL),
(5, 'client04', 'client04@gmail.com', '', '12345', 1, 0, '2021-09-20 03:24:10', NULL),
(6, 'client05', 'client03@gmail.com', '', 'client04', 1, 0, '2021-09-20 03:24:55', NULL),
(7, 'client06', 'client06@gmail.com', '', '123456', 1, 0, '2021-09-20 03:33:03', NULL),
(8, 'client09', 'client09@gmail.com', '', '$2y$10$7LxfVz2UKTszTc/U7vHx.eOCu1noD8YRATOKDOsdVrMGGiijosnlW', 1, 0, '2021-09-20 03:40:30', NULL),
(9, 'client10', 'client10@gmail.com', '', '$2y$10$xysHnkP9yGj5KTDpc9omUOcn9dOAQ1BKBKKBuTAZpngT0oogyyusC', 1, 1, '2021-10-27 04:10:50', NULL),
(10, 'client11', 'client11@gmail.com', '', '$2y$10$kGKt95M.IWejYJSEEx/xyuAnyfwt9EQVYB.aJJQwA2Wv38c6jbdei', 1, 0, '2021-09-20 05:03:43', NULL),
(11, 'client12', 'client12@gmail.com', '', '$2y$10$k0le/1W4zTvGXMiyJ1rixuD5mbMOOPcsD0WPz0tznD9YZhlsAZZRC', 1, 0, '2021-09-20 08:40:27', NULL),
(12, 'client17', 'client17@gmail.com', '', '$2y$10$5ObZ7DK/msH/uXUWUpcIQOTrNZSCIGlz8ICDRaj945V/v7OxKeXYS', 1, 0, '2021-09-20 05:28:31', NULL),
(13, 'cro', 'cro@gmail.com', '', '$2y$10$qZZ8tYFgVdulmR/70EAvZ.hzD21aQ.8Q9hRd052mAnhfv8sHAw4pK', 1, 0, '2021-10-27 01:30:42', NULL),
(14, 'super admin', 'superadmin@gmail.com', '', '$2y$10$hRi1qju2KOeEPcBZ0wYfhu/PN5e9Wl.ddWeDTds8Uokad764X9D1a', 3, 1, '2022-01-12 13:52:23', NULL),
(15, 'demo', 'demo@gmail.com', '0895361034833', '$2y$10$D8XFiltGb1wCTXi77QovVOFsc0bpX731Y.yeIgx/CzApRGnf.Z8Iy', 1, 0, '2021-10-27 03:54:33', NULL),
(16, 'demo2', 'demo2@gmail.com', '089123123', '$2y$10$Eh/Lms3q2oZxA3xeaSQjouFD5H9MasWZYisxoY1WCXpHVtn9dnVcW', 1, 0, '2021-10-27 04:04:08', NULL),
(17, 'demo3', 'demo3@gmail.com', '08192839132', '$2y$10$dnzDt/2NFtapS6lJ5AkZU.1nNf7ei3poq/mnrUjnAqg0nIaPsM14C', 1, 0, '2021-10-27 04:06:26', NULL),
(18, 'demo4', 'demo4@gmail.com', '08923123123', '$2y$10$TBfgmIBwwPbmc.zulZfXg.tNLk2KrpqLwLx/xsrz3Fmk0QIk3vdOS', 1, 1, '2022-01-08 01:53:32', NULL),
(19, 'demo5@gmail.com', 'demo5@gmail.com', NULL, '$2y$10$Hv5C8m.zuj3oPt/hSf9yvedmXhtbCYJ5ziDZjXCLIO39N2g7syABy', 1, 1, '2022-01-11 12:38:58', NULL),
(20, 'demo1@gmail.com', 'demo1@gmail.com', NULL, '$2y$10$WGewqFnYYxEZ7gIph2CIROF80UslAVVoRx/CjXodcoYva4umIvgDq', 1, 1, '2021-12-29 02:36:16', NULL),
(21, 'demo7', 'demo7@gmail.com', '08911231', '$2y$10$kDuJV5Cs2Q7biiU.0JpyL.6qHdcjx74d.d4LMMYY2DLClWHfnwdzC', 1, 1, '2022-01-19 02:54:11', NULL),
(22, 'demo8', 'demo8@gmail.com', '+62895361034833', '$2y$10$9PeX1WI51It41uSekpXeyeO71SgtTXmOUQc87JzOO1MiT9/AQNguy', 1, 1, '2022-01-11 14:58:43', NULL),
(23, 'demo9@gmail.com', 'demo9@gmail.com', '+62895361034833', '$2y$10$3eE7SL8pCZOXrofMgrKvWOiQ9p6qjzs.04bBehJL7PlF1uz1m6cZu', 1, 1, '2022-01-11 15:28:13', '2022-01-11 00:00:00'),
(24, 'demo11@gmail.com', 'demo11@gmail.com', '+6285156345912', '$2y$10$lj8foZFnfjSaXorZb1P/R.tdRfF7YtXu.n/pNLGm6yT6sjr9BAmT6', 1, 1, '2022-01-11 15:29:31', '2022-01-11 00:00:00'),
(25, 'demo12@gmail.com', 'demo12@gmail.com', '5412312', '$2y$10$WswuXyspJjEj58.qdvtWqOfqycnrdAU7.MTSJtCdmOJdCwnU/9vvO', 1, 1, '2022-01-11 15:39:49', '2022-01-11 00:00:00'),
(26, 'demo13@gmail.com', 'demo13@gmail.com', '123132', '$2y$10$BU44YHmDhkmef5PEChycFOkh5pIokqAh90Ackda1gP5rXdC0XLpX2', 1, 1, '2022-01-11 15:41:22', '2022-01-11 00:00:00'),
(27, 'demo14@gmail.com', 'demo14@gmail.com', '9128329138', '$2y$10$SszyPmMfVa5YyAzViwUFuuCJK6dFb8EFYdV2LPRHOobXbfp85Za46', 1, 1, '2022-01-11 15:42:51', '2022-01-11 00:00:00'),
(28, 'demo15@gmail.com', 'demo15@gmail.com', '2910293', '$2y$10$Iajccmw3AV5R6hjmL8pLSu4tb6Xrb3xKvo/DbejXQ4qKVHH/OaEd2', 1, 1, '2022-01-11 15:43:36', '2022-01-11 00:00:00'),
(29, 'demo16@gmail.com', 'demo16@gmail.com', '102931093`', '$2y$10$i2jwuoziTjrf04ysDweNF.WfqLXKjh/Z4uAVBuAGryr0V0gqbEVVe', 1, 1, '2022-01-11 15:44:08', '2022-01-11 00:00:00'),
(30, 'demo17@gmail.com', 'demo17@gmail.com', '123198123', '$2y$10$E64fLCxYGnbzsXNxYEEFyeCByNQ6rAPYwqApod31JlyvN5yY.jREu', 1, 1, '2022-01-12 01:20:29', '2022-01-11 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_package`
--

CREATE TABLE `tb_user_package` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_package` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date_time` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user_package`
--

INSERT INTO `tb_user_package` (`id`, `id_user`, `id_package`, `status`, `date_time`) VALUES
(1, 18, 3, 1, '2021-10-27 03:10:56'),
(2, 21, 2, 1, '2022-01-11 02:01:46'),
(3, 22, 3, 1, '2022-01-11 03:01:25'),
(4, 23, 4, 1, '2022-01-11 03:01:08'),
(5, 24, 4, 1, '2022-01-11 03:01:28'),
(6, 25, 4, 1, '2022-01-11 03:01:49'),
(7, 26, 4, 1, '2022-01-11 03:01:15'),
(8, 27, 4, 1, '2022-01-11 03:01:48'),
(9, 28, 4, 1, '2022-01-11 03:01:36'),
(10, 29, 4, 1, '2022-01-11 03:01:08'),
(11, 30, 2, 1, '2022-01-12 01:01:41');

-- --------------------------------------------------------

--
-- Table structure for table `tb_webhook`
--

CREATE TABLE `tb_webhook` (
  `id` int(11) NOT NULL,
  `instance_key` varchar(50) NOT NULL,
  `url` varchar(200) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_webhook`
--

INSERT INTO `tb_webhook` (`id`, `instance_key`, `url`, `status`) VALUES
(2, 'xOmO52xkbZ67', 'https://webhook.site/6af831de-ef2a-4d41-a160-b1e6a397e892', 1),
(5, 'RHin1tMuP1Et', 'https://webhook.site/3e118197-5472-4f71-be35-954ee5506f78', 1),
(8, 'in73vy6JbUxI', 'https://webhook.site/eba8afb9-c39b-42ea-9078-8e33577f6be8', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `midtrans_payment_notification`
--
ALTER TABLE `midtrans_payment_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `midtrans_transaction_detail`
--
ALTER TABLE `midtrans_transaction_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_autoreply`
--
ALTER TABLE `tb_autoreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_broadcast`
--
ALTER TABLE `tb_broadcast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_broadcast_detail`
--
ALTER TABLE `tb_broadcast_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_contact`
--
ALTER TABLE `tb_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_device`
--
ALTER TABLE `tb_device`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_group`
--
ALTER TABLE `tb_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_message`
--
ALTER TABLE `tb_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_message_in`
--
ALTER TABLE `tb_message_in`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_package`
--
ALTER TABLE `tb_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_setting`
--
ALTER TABLE `tb_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user_package`
--
ALTER TABLE `tb_user_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_webhook`
--
ALTER TABLE `tb_webhook`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `midtrans_payment_notification`
--
ALTER TABLE `midtrans_payment_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `midtrans_transaction_detail`
--
ALTER TABLE `midtrans_transaction_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_autoreply`
--
ALTER TABLE `tb_autoreply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_broadcast`
--
ALTER TABLE `tb_broadcast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tb_broadcast_detail`
--
ALTER TABLE `tb_broadcast_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `tb_contact`
--
ALTER TABLE `tb_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tb_device`
--
ALTER TABLE `tb_device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tb_group`
--
ALTER TABLE `tb_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_message`
--
ALTER TABLE `tb_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT for table `tb_message_in`
--
ALTER TABLE `tb_message_in`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT for table `tb_package`
--
ALTER TABLE `tb_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_setting`
--
ALTER TABLE `tb_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tb_user_package`
--
ALTER TABLE `tb_user_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_webhook`
--
ALTER TABLE `tb_webhook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
