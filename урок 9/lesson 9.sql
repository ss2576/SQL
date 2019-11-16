-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
--  Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

use shop;
use sample;

START TRANSACTION;
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO sample.users SELECT * FROM shop.users WHERE shop.users.id = 1;
DELETE FROM shop.users WHERE id = 1;
SET FOREIGN_KEY_CHECKS = 1;
COMMIT;


-- Создайте представление, которое выводит название name товарной позиции из таблицы products
-- и соответствующее название каталога name из таблицы catalogs.

use shop;

CREATE VIEW catalogs_name AS
SELECT products.id, products.name AS p_name, c_name.name AS c_name FROM products
JOIN catalogs AS c_name ON c_name.id = products.catalog_id
WHERE c_name.id = 2
ORDER BY c_name;

SELECT * FROM catalogs_name;



-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DELIMITER //
DROP FUNCTION IF EXISTS hello//
CREATE FUNCTION hello()
RETURNS TINYTEXT 
READS SQL DATA
DETERMINISTIC
BEGIN
DECLARE h INT;
SET h = HOUR(NOW());
CASE 
WHEN h BETWEEN 0 AND 5 then
	return 'Доброй ночи!';
WHEN h BETWEEN  6 AND 11 then
	return 'Доброе утро!';
WHEN h BETWEEN 12 AND 17 then
	return 'Добрый день!';
WHEN h BETWEEN 18 AND 23 then
	return 'Доброй вечер!';
END CASE;
END//
DELIMITER ;

SELECT hello();


-- В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
-- Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное 
-- значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля
-- были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.
use shop;

DELIMITER //
DROP TRIGGER IF EXISTS `check` //
CREATE TRIGGER `check` BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
DECLARE cat_id INT;
DECLARE name_id INT;
SELECT id INTO cat_id FROM catalogs ORDER BY id LIMIT 1	;
SET NEW.description = COALESCE(NEW.description, OLD.description, cat_id);	
SET NEW.name = COALESCE(NEW.name, OLD.name, name_id);	
END//
DELIMITER ;



UPDATE products SET description = NULL, name = NULL WHERE id = 2;
SELECT id, name, price, catalog_id, description FROM products;

UPDATE products SET description = NULL, name = 'ABABABA' WHERE id = 2;
SELECT id, name, price, catalog_id, description FROM products;

UPDATE products SET description = 'ABABABA', name = NULL WHERE id = 2;
SELECT id, name, price, catalog_id, description FROM products;

UPDATE products SET description = 'ABABABA', name = 'ABABABA' WHERE id = 2;
SELECT id, name, price, catalog_id, description FROM products;


























