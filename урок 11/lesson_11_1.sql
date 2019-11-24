-- Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
-- catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы, --
-- идентификатор первичного ключа и содержимое поля name.



use shop;

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  id int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  created_at datetime DEFAULT current_timestamp(),
  name varchar(100) NOT NULL,
  table_id int(10) NOT NULL,
  contet_name varchar(255)
) ENGINE=ARCHIVE;



DROP TRIGGER IF EXISTS write_product_log_insert;
DELIMITER //
CREATE TRIGGER `write_product_log_insert` AFTER INSERT ON `products` FOR EACH ROW BEGIN
	INSERT INTO `logs` (name, table_id, contet_name)
	VALUES ('products', (SELECT NEW.id), (SELECT NEW.name));
END//


DROP TRIGGER IF EXISTS write_users_log_insert;
DELIMITER // 
CREATE TRIGGER `write_users_log_insert` AFTER INSERT ON `users` FOR EACH ROW BEGIN
	INSERT INTO `logs` (name, table_id, contet_name)
	VALUES ('users', (SELECT NEW.id), (SELECT NEW.name));
END//


DROP TRIGGER IF EXISTS write_catalogs_log_insertt;
DELIMITER // 
CREATE TRIGGER `write_catalogs_log_insert` AFTER INSERT ON `catalogs` FOR EACH ROW BEGIN
	INSERT INTO `logs` (name, table_id, contet_name)
	VALUES ('catalogs', (SELECT NEW.id), (SELECT NEW.name));
END//



INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);
  
 
 INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1988-08-29');
  

 
 INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');
  
  
  SELECT * FROM logs
  
  id|created_at         |name    |table_id|contet_name            |
--|-------------------|--------|--------|-----------------------|
 1|2019-11-24 16:02:15|products|      18|Intel Core i3-8100     |
 2|2019-11-24 16:02:15|products|      19|Intel Core i5-7400     |
 3|2019-11-24 16:02:15|products|      20|AMD FX-8320E           |
 4|2019-11-24 16:02:15|products|      21|AMD FX-8320            |
 5|2019-11-24 16:02:15|products|      22|ASUS ROG MAXIMUS X HERO|
 6|2019-11-24 16:02:15|products|      23|Gigabyte H310M S2H     |
 7|2019-11-24 16:02:15|products|      24|MSI B250M GAMING PRO   |
 8|2019-11-24 16:02:31|users   |      10|Геннадий               |
 9|2019-11-24 16:02:31|users   |      11|Наталья                |
10|2019-11-24 16:02:31|users   |      12|Александр              |
11|2019-11-24 16:02:31|users   |      13|Сергей                 |
12|2019-11-24 16:02:31|users   |      14|Иван                   |
13|2019-11-24 16:02:31|users   |      15|Мария                  |
14|2019-11-24 16:03:34|catalogs|       1|Процессоры             |
15|2019-11-24 16:03:34|catalogs|       2|Материнские платы      |
16|2019-11-24 16:03:34|catalogs|       3|Видеокарты             |
17|2019-11-24 16:03:34|catalogs|       4|Жесткие диски          |
18|2019-11-24 16:03:34|catalogs|       5|Оперативная память     |



-- Создайте SQL-запрос, который помещает в таблицу users миллион записей --
use shop;

DROP PROCEDURE IF EXISTS millions;
DELIMITER // 
CREATE DEFINER=`root`@`localhost` PROCEDURE `shop`.`millions`()
BEGIN
	 -- запись ограничил тысячью, т.к. долго ждать результата! --
	 DECLARE i INT DEFAULT 1000;
  WHILE i > 0 DO
	INSERT INTO users (name) VALUES ('millions');
	SET i = i - 1;
  END WHILE;
END//

CALL millions();

 969|millions |           |2019-11-24 16:41:00|2019-11-24 16:41:00|
 970|millions |           |2019-11-24 16:41:00|2019-11-24 16:41:00|
 971|millions |           |2019-11-24 16:41:00|2019-11-24 16:41:00|
 972|millions |           |2019-11-24 16:41:00|2019-11-24 16:41:00|
 973|millions |           |2019-11-24 16:41:00|2019-11-24 16:41:00|
 974|millions |           |2019-11-24 16:41:00|2019-11-24 16:41:00|
 975|millions |           |2019-11-24 16:41:01|2019-11-24 16:41:01|
 976|millions |           |2019-11-24 16:41:01|2019-11-24 16:41:01|
 977|millions |           |2019-11-24 16:41:01|2019-11-24 16:41:01|
 978|millions |           |2019-11-24 16:41:01|2019-11-24 16:41:01|
 979|millions |           |2019-11-24 16:41:01|2019-11-24 16:41:01|
 980|millions |           |2019-11-24 16:41:01|2019-11-24 16:41:01|
 981|millions |           |2019-11-24 16:41:01|2019-11-24 16:41:01|
 982|millions |           |2019-11-24 16:41:01|2019-11-24 16:41:01|
 983|millions |           |2019-11-24 16:41:01|2019-11-24 16:41:01|
 984|millions |           |2019-11-24 16:41:01|2019-11-24 16:41:01|
 985|millions |           |2019-11-24 16:41:01|2019-11-24 16:41:01|
 986|millions |           |2019-11-24 16:41:01|2019-11-24 16:41:01|
 987|millions |           |2019-11-24 16:41:01|2019-11-24 16:41:01|
 988|millions |           |2019-11-24 16:41:01|2019-11-24 16:41:01|
 989|millions |           |2019-11-24 16:41:01|2019-11-24 16:41:01|
 990|millions |           |2019-11-24 16:41:02|2019-11-24 16:41:02|
 991|millions |           |2019-11-24 16:41:02|2019-11-24 16:41:02|
 992|millions |           |2019-11-24 16:41:02|2019-11-24 16:41:02|
 993|millions |           |2019-11-24 16:41:02|2019-11-24 16:41:02|
 994|millions |           |2019-11-24 16:41:02|2019-11-24 16:41:02|
 995|millions |           |2019-11-24 16:41:02|2019-11-24 16:41:02|
 996|millions |           |2019-11-24 16:41:02|2019-11-24 16:41:02|
 997|millions |           |2019-11-24 16:41:02|2019-11-24 16:41:02|
 998|millions |           |2019-11-24 16:41:02|2019-11-24 16:41:02|
 999|millions |           |2019-11-24 16:41:02|2019-11-24 16:41:02|
1000|millions |           |2019-11-24 16:41:02|2019-11-24 16:41:02|
  
  