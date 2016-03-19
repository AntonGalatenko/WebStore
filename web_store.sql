-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.5.23 - MySQL Community Server (GPL)
-- ОС Сервера:                   Win32
-- HeidiSQL Версия:              9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных web_store
DROP DATABASE IF EXISTS `web_store`;
CREATE DATABASE IF NOT EXISTS `web_store` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `web_store`;


-- Дамп структуры для таблица web_store.items
DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` varchar(50) NOT NULL DEFAULT '0',
  `description` varchar(200) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `Price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы web_store.items: ~7 rows (приблизительно)
DELETE FROM `items`;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`id`, `product`, `description`, `count`, `Price`) VALUES
	(1, 'Кеды', 'Размер 39-43', 20, 350),
	(2, 'Кросовки', 'nike', 5, 200),
	(3, 'ядерная боеголовка', 'американская', 1, 1000000),
	(5, 'Сумка', 'Аля-лакоста', 2, 1500),
	(14, 'Шланг', 'Yooo34', 20, 30),
	(15, 'Кошка', 'Белая, 1 год', 1, 15),
	(17, 'Пакетик чая', 'Липтон', 1, 15);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;


-- Дамп структуры для таблица web_store.items_users
DROP TABLE IF EXISTS `items_users`;
CREATE TABLE IF NOT EXISTS `items_users` (
  `items_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  PRIMARY KEY (`items_id`,`users_id`),
  KEY `FK_users` (`users_id`),
  KEY `FK_items` (`items_id`),
  CONSTRAINT `FK_items` FOREIGN KEY (`items_id`) REFERENCES `items` (`id`),
  CONSTRAINT `FK_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы web_store.items_users: ~5 rows (приблизительно)
DELETE FROM `items_users`;
/*!40000 ALTER TABLE `items_users` DISABLE KEYS */;
INSERT INTO `items_users` (`items_id`, `users_id`) VALUES
	(1, 11),
	(3, 11),
	(5, 11),
	(14, 11),
	(15, 12);
/*!40000 ALTER TABLE `items_users` ENABLE KEYS */;


-- Дамп структуры для таблица web_store.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL DEFAULT '0',
  `last_name` varchar(50) NOT NULL DEFAULT '0',
  `age` int(11) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_user_profile` (`profile_id`),
  CONSTRAINT `FK_users_users_profile` FOREIGN KEY (`profile_id`) REFERENCES `users_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы web_store.users: ~6 rows (приблизительно)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `first_name`, `last_name`, `age`, `email`, `password`, `profile_id`) VALUES
	(11, 'Нео', 'Андерсон', 25, 'neo@neo.com', '123', 1),
	(12, 'Иполит', 'Стаханов', 53, 'ipp@koit.en', '111', 1),
	(13, '0', '0', 0, 'admin@com', 'admin', 2),
	(14, '0', '0', 0, 'admin1@com', 'admin1', 2),
	(15, 'Антон', 'Гал', 25, 'gal@gmail.com', '111', 3),
	(16, 'Кук', 'Бессон', 45, 'tr9m@gmail.com', '1313', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Дамп структуры для таблица web_store.users_profile
DROP TABLE IF EXISTS `users_profile`;
CREATE TABLE IF NOT EXISTS `users_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы web_store.users_profile: ~3 rows (приблизительно)
DELETE FROM `users_profile`;
/*!40000 ALTER TABLE `users_profile` DISABLE KEYS */;
INSERT INTO `users_profile` (`id`, `type`) VALUES
	(2, 'ADMIN'),
	(3, 'PRO-USER'),
	(1, 'USER');
/*!40000 ALTER TABLE `users_profile` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
