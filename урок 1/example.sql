CREATE DATABASE IF NOT EXISTS example;

use example;

CREATE TABLE IF NOT EXISTS users(
	id INT auto_increment NOT NULL PRIMARY KEY,
	name VARCHAR(50) not null
	);

TRUNCATE users;

INSERT INTO users VALUES
	(DEFAULT,'Sergey'),
	(DEFAULT,'Pavel'),
	(DEFAULT,'Oleg'),
	(DEFAULT,'Daniil'),
	(DEFAULT,'Olga'),
	(DEFAULT,'Masha');
	
	
SELECT * FROM users;