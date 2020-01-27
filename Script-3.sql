-- Пусть в таблице users 
-- поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
use shop;
show tables;
desc users;
select * from users;

UPDATE users SET 
	created_at = NULL ,
	updated_at = NULL ;

UPDATE users SET 
	created_at = NOW() ,
	updated_at = NOW() ;

-- Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом 
-- VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10".
-- Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = 'Покупатели';

INSERT INTO users (name,created_at,updated_at) VALUES
  ('Геннадий', '1990-10-05 8:10','1990-10-05 8:10'),
  ('Наталья', '1984-11-12 10:12','1990-10-05 8:10'),
  ('Александр', '1985-05-20 12:10','1990-10-05 8:10'),
  ('Сергей', '1988-02-14 13:07','1990-10-05 8:10'),
  ('Иван', '1998-01-12 09:12','1990-10-05 8:10'),
  ('Мария', '1992-08-29 01:34','1990-10-05 8:10');
 
 SELECT * FROM users;

UPDATE users SET 
	created_at = UNIX_TIMESTAMP(created_at),
	updated_at = UNIX_TIMESTAMP(updated_at);

UPDATE users SET 
	created_at = FROM_UNIXTIME(created_at),
	updated_at = FROM_UNIXTIME(updated_at);

-- В таблице складских запасов storehouses_products в поле value могут встречаться самые 
-- разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. 
-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения 
-- значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.

DROP TABLE IF EXISTS storehouses_products;

CREATE TABLE `storehouses_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `value` int(10) unsigned DEFAULT NULL COMMENT 'Запас товарной позиции на складе',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Запасы на складе';

INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('1', 26, '1988-07-23 10:28:15', '2019-01-12 11:12:51');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('2', 55, '2017-07-07 18:34:02', '2012-08-11 18:54:07');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('3', 0, '1996-01-08 10:06:11', '2005-02-04 00:47:20');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('4', 73, '1978-01-28 03:28:30', '1991-05-23 21:55:23');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('5', 47, '1986-06-10 15:41:12', '1985-01-05 12:03:43');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('6', 45, '2017-04-10 15:56:01', '1985-08-18 00:57:22');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('7', 53, '1977-09-03 11:38:28', '2012-10-26 17:01:42');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('8', 62, '2019-04-04 03:04:00', '1989-10-27 10:17:13');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('9', 2, '1992-06-04 10:36:13', '1978-10-31 10:46:38');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('10', 0, '2011-09-10 11:33:14', '2003-11-29 06:23:16');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('11', 72, '1989-09-24 20:53:05', '2014-12-05 11:52:39');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('12', 55, '1996-10-19 19:45:26', '2001-08-07 06:14:53');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('13', 22, '1998-07-08 07:14:08', '1987-12-30 19:33:03');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('14', 31, '1982-01-08 16:17:27', '2004-07-02 08:35:37');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('15', 0, '2007-08-25 20:22:15', '1986-03-10 11:29:19');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('16', 13, '1990-04-27 11:24:01', '2010-03-25 02:57:35');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('17', 75, '1982-01-10 18:18:12', '2007-08-09 16:37:58');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('18', 0, '1988-01-05 08:02:34', '2006-12-09 06:09:10');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('19', 59, '2010-01-16 09:06:24', '2000-07-05 19:09:44');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('20', 64, '1986-11-03 17:43:27', '1972-02-26 00:50:41');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('21', 48, '1992-11-01 14:45:38', '1972-05-19 10:57:43');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('22', 35, '2014-11-30 15:00:34', '1999-06-02 20:36:36');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('23', 0, '1974-08-15 14:30:53', '1995-07-07 02:45:18');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('24', 30, '1998-02-18 08:51:49', '2000-07-11 09:09:29');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('25', 32, '2002-04-21 05:42:49', '1971-04-16 04:53:23');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('26', 75, '2011-10-25 18:50:37', '1990-11-06 04:15:24');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('27', 0, '2002-06-24 01:59:33', '1979-01-26 15:19:12');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('28', 40, '2006-01-07 15:34:47', '1989-06-10 00:02:04');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('29', 86, '1999-08-28 18:35:21', '1983-09-14 10:28:53');
INSERT INTO `storehouses_products` (`id`, `value`, `created_at`, `updated_at`) VALUES ('30', 48, '2012-03-03 01:28:04', '1970-08-30 13:22:48');

SELECT * FROM storehouses_products;
-- Лучше не придумалось :(
UPDATE storehouses_products SET 
	value = 999 WHERE value = 0 ;

SELECT * FROM storehouses_products  ORDER BY value;



-- (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
-- Месяцы заданы в виде списка английских названий ('may', 'august')

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-05-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-08-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');

SELECT * FROM users;
SELECT DATE_FORMAT(birthday_at, 'Родился в %M ');
SELECT
  id,
  name,
  birthday_at,
  DATE_FORMAT(birthday_at, 'Родился в %M ') AS status
 FROM
  users WHERE DATE_FORMAT(birthday_at, '%M') = 'May' or DATE_FORMAT(birthday_at, '%M') = 'August' ;

-- (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
-- SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

-- не придумалось :(

-- Практическое задание теме “Агрегация данных”
-- Подсчитайте средний возраст пользователей в таблице users

SELECT * FROM users;

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS 'Средний возраст' FROM users;

-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.
SELECT * FROM users;

-- создаем вторую таблицу для хранения промежуточных результатов

DROP TABLE IF EXISTS day_birthday;
CREATE TABLE day_birthday (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at_week VARCHAR(100) );
 
 -- Вставляем дни недели в новую таблицу
 INSERT INTO day_birthday
 SELECT
  NULL, name, 
  DAYNAME(DATE_ADD(birthday_at , interval TIMESTAMPDIFF(YEAR, birthday_at, NOW()) + 1 YEAR))
  FROM users
  WHERE DATE_FORMAT(birthday_at, '%Y ') + TIMESTAMPDIFF(YEAR, birthday_at, NOW()) + 1 < '2021';
 
 -- Вставляем тех у кого день рождения уже был в этом году
 INSERT INTO day_birthday
 SELECT
  NULL , name, 
  DAYNAME(DATE_ADD(birthday_at , interval TIMESTAMPDIFF(YEAR, birthday_at, NOW())  YEAR))
  FROM users
  WHERE DATE_FORMAT(birthday_at, '%Y ') + TIMESTAMPDIFF(YEAR, birthday_at, NOW()) + 1 = '2021';
 
 
SELECT * FROM day_birthday;

-- группируем и считаем по группам
SELECT COUNT(*) FROM day_birthday GROUP BY birthday_at_week;



