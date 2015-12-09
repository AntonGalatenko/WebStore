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

-- Дамп данных таблицы web_store.items_users: ~5 rows (приблизительно)
DELETE FROM `items_users`;
/*!40000 ALTER TABLE `items_users` DISABLE KEYS */;
INSERT INTO `items_users` (`items_id`, `users_id`) VALUES
	(1, 3),
	(17, 3),
	(1, 8);
/*!40000 ALTER TABLE `items_users` ENABLE KEYS */;

-- Дамп данных таблицы web_store.users: ~2 rows (приблизительно)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `first_name`, `last_name`, `age`, `email`, `password`) VALUES
	(1, 'Joi', 'Tribiani', 28, 'joi@gmail.com', '1234'),
	(3, 'Антон', 'Гал', 25, 'slu4ai@gmail.com', '111'),
	(4, 'Кот', 'Белый', 3, 'kat@yahoo.com', '1111'),
	(5, 'Нео', 'Андерсон', 25, 'neo@neo.com', '321'),
	(6, 'admin', 'admin', 0, 'admin@com', 'admin'),
	(7, 'Кук', 'Донкан', 53, 'don53@ui.com', 't33'),
	(8, 'Иполит', 'Стаханов', 62, 'ipp@koit.en', '1212'),
	(10, 'Трям', 'Кросст', 15, 'tr9m@gmail.com', '123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Дамп данных таблицы web_store.users_profile: ~2 rows (приблизительно)
DELETE FROM `users_profile`;
/*!40000 ALTER TABLE `users_profile` DISABLE KEYS */;
INSERT INTO `users_profile` (`id`, `type`) VALUES
	(2, 'ADMIN'),
	(1, 'USER');
/*!40000 ALTER TABLE `users_profile` ENABLE KEYS */;

-- Дамп данных таблицы web_store.users_users_profile: ~1 rows (приблизительно)
DELETE FROM `users_users_profile`;
/*!40000 ALTER TABLE `users_users_profile` DISABLE KEYS */;
INSERT INTO `users_users_profile` (`user_id`, `users_profile_id`) VALUES
	(5, 1),
	(6, 2),
	(7, 1),
	(8, 1),
	(10, 1);
/*!40000 ALTER TABLE `users_users_profile` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
