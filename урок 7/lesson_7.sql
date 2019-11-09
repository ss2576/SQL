-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

use shop;
SELECT id, name FROM users WHERE id IN (SELECT DISTINCT user_id FROM orders);


-- Выведите список товаров products и разделов catalogs, который соответствует товару..

use shop;
SELECT catalogs.name, products.name, products.price FROM products JOIN catalogs ON products.catalog_id = catalogs.id ORDER BY catalogs.name ;



-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское.
-- Выведите список рейсов flights с русскими названиями городов.
use test;
SELECT flights.id AS номер_рейса ,cities_from.name AS откуда, cities_to.name AS куда FROM flights 
JOIN cities AS cities_from ON flights.`from` = cities_from.lable
JOIN cities AS cities_to   ON flights.`to`   = cities_to.lable
ORDER BY номер_рейса;
 




 