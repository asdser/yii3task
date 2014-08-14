-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Авг 14 2014 г., 13:24
-- Версия сервера: 5.5.32
-- Версия PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `bones`
--
CREATE DATABASE IF NOT EXISTS `bones` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bones`;

-- --------------------------------------------------------

--
-- Структура таблицы `experiment`
--

CREATE TABLE IF NOT EXISTS `experiment` (
  `id_exp` int(10) NOT NULL AUTO_INCREMENT,
  `date` varchar(30) NOT NULL,
  `time` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `bones_num` int(10) NOT NULL,
  `throws` int(10) NOT NULL,
  PRIMARY KEY (`id_exp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `experiment`
--

INSERT INTO `experiment` (`id_exp`, `date`, `time`, `name`, `bones_num`, `throws`) VALUES
(1, '14.08.14', '13:43:39', 'user', 2, 5555),
(2, '14.08.14', '13:46:53', 'user2', 2, 50000);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1407502633),
('m130524_201442_init', 1407502659);

-- --------------------------------------------------------

--
-- Структура таблицы `results`
--

CREATE TABLE IF NOT EXISTS `results` (
  `id_result` int(10) NOT NULL AUTO_INCREMENT,
  `num` int(10) NOT NULL,
  `count` int(10) NOT NULL,
  `id_exp` int(11) NOT NULL,
  PRIMARY KEY (`id_result`),
  KEY `id_exp` (`id_exp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Дамп данных таблицы `results`
--

INSERT INTO `results` (`id_result`, `num`, `count`, `id_exp`) VALUES
(1, 2, 132, 1),
(2, 3, 294, 1),
(3, 4, 448, 1),
(4, 5, 633, 1),
(5, 6, 738, 1),
(6, 7, 942, 1),
(7, 8, 801, 1),
(8, 9, 634, 1),
(9, 10, 457, 1),
(10, 11, 302, 1),
(11, 12, 174, 1),
(12, 2, 1394, 2),
(13, 3, 2775, 2),
(14, 4, 4176, 2),
(15, 5, 5558, 2),
(16, 6, 6957, 2),
(17, 7, 8326, 2),
(18, 8, 6942, 2),
(19, 9, 5557, 2),
(20, 10, 4170, 2),
(21, 11, 2771, 2),
(22, 12, 1374, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `role` smallint(6) NOT NULL DEFAULT '10',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'task3asd', '-7zpe3DajPTGWx59GCIv6klFUH-WMZRA', '$2y$13$CcqwE3PhKXMDhmEDVSA.b.eWijX87mn9z32Cogzqv0t0v4.7JDahK', NULL, 'task3asd@mail.ru', 10, 10, 1408015416, 1408015416);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`id_exp`) REFERENCES `experiment` (`id_exp`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
