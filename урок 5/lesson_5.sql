use shop;
-- lesson 5_1 --
UPDATE users SET created_at=now(), update_at=NOW() ;


-- lesson 5_2 --
UPDATE users SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %h:%i'), update_at = STR_TO_DATE(update_at, '%d.%m.%Y %h:%i');
ALTER TABLE users MODIFY created_at DATETIME;
ALTER TABLE users MODIFY update_at DATETIME;



-- lesson 5_3 --
SELECT * FROM storehouses_products ORDER BY CASE value WHEN value IS NULL THEN '10000000' END, value;


-- lesson 5_4 --


-- lesson 5_5 --


-- lesson 5_6 --
SELECT firstname, lastname,AVG(FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday)) / 365.25)) AS age FROM users;


-- lesson 5_7 --
SELECT firstname, lastname, birthday,
       DAYNAME(birthday + INTERVAL (YEAR(NOW()) - YEAR(birthday)) YEAR) AS `day`,
       DAYOFWEEK(birthday + INTERVAL (YEAR(NOW()) - YEAR(birthday)) YEAR) AS `weekday`
       FROM users ORDER BY `weekday`;





