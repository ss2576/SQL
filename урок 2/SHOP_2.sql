
DROP DATABASE shop;
CREATE DATABASE shop;

USE shop;

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) COMMENT '�������� �������'
	) COMMENT = '������� ��������-��������';

INSERT INTO catalogs (name) VALUES ('����������');
INSERT INTO catalogs VALUES (0, '���.�����');
INSERT INTO catalogs VALUES (NULL, '����������');

SELECT * FROM catalogs;


DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT '��� ����������',
	birthday_at DATE COMMENT '���� ��������',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
	) COMMENT = '����������';

-- INSERT INTO users (id, name, birthday_at)VALUES (1, 'HELLO', '1976-06-25');
-- SELECT * FROM users; 
	
DROP TABLE IF EXISTS products;
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT '��������',
	description TEXT COMMENT '��������',
	price DECIMAL (11,2)COMMENT '����',
	catalog_id INT UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	) COMMENT = '�������� �������';

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	id INT UNSIGNED NOT NULL,
	user_id INT UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
	) COMMENT = '������';

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products(
	id INT UNSIGNED NOT NULL,
	order_id INT UNSIGNED,
	product_id INT UNSIGNED,
	total INT UNSIGNED DEFAULT 1 COMMENT '���-�� ���������� �������� �������',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
	) COMMENT = '������ ������';

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts(
	id INT UNSIGNED NOT NULL,
	user_id INT UNSIGNED,
	product_id INT UNSIGNED,
	discount FLOAT UNSIGNED COMMENT '�������� ������ �� 0.0 �� 1.0',
	started_at DATETIME,
	finished_at DATETIME,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
	) COMMENT = '������';

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products(
	id INT UNSIGNED NOT NULL,
	storehouse_id INT UNSIGNED,
	product_id INT UNSIGNED,
	value INT UNSIGNED COMMENT '����� �������� ������� �� ������',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
	) COMMENT = '������ �� ������';















	
