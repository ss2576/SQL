CREATE DATABASE shop;

USE shop;

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
	id INT UNSIGNED,
	name VARCHAR(255) COMMENT '�������� �������'
	) COMMENT = '������� ��������-��������';

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INT UNSIGNED,
	name VARCHAR(255) COMMENT '��� ����������'
	) COMMENT = '����������';
	
DROP TABLE IF EXISTS products;
CREATE TABLE products (
	id INT UNSIGNED,
	name VARCHAR(255) COMMENT '��������',
	description TEXT COMMENT '��������',
	price DECIMAL (11,2)COMMENT '����',
	catalog_id INT UNSIGNED
	) COMMENT = '�������� �������';

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	id INT UNSIGNED,
	user_id INT UNSIGNED
	) COMMENT = '������';

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products(
	id INT UNSIGNED,
	order_id INT UNSIGNED,
	product_id INT UNSIGNED,
	total INT UNSIGNED DEFAULT 1 COMMENT '���-�� ���������� �������� �������'
	) COMMENT = '������ ������';

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts(
	id INT UNSIGNED,
	user_id INT UNSIGNED,
	product_id INT UNSIGNED,
	discount FLOAT UNSIGNED COMMENT '�������� ������ �� 0.0 �� 1.0'
	) COMMENT = '������';

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products(
	id INT UNSIGNED,
	storehouse_id INT UNSIGNED,
	product_id INT UNSIGNED,
	value INT UNSIGNED COMMENT '����� �������� ������� �� ������'
	) COMMENT = '������ �� ������';















	
