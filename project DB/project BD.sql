DROP DATABASE IF EXISTS medical_clinic;
CREATE DATABASE medical_clinic;

USE medical_clinic;

-- пользователи БД --
DROP TABLE IF EXISTS user_profiles;
CREATE TABLE user_profiles (
	id_user SERIAL PRIMARY KEY,
	firstname VARCHAR(50) COMMENT 'Имя',
	lastname VARCHAR(50) COMMENT 'Фамилия',
	middlename VARCHAR(50) COMMENT 'Отчество',
	birthday DATE,
	gender ENUM('Мужчина', 'Женщина'),
	email VARCHAR(120) UNIQUE,
	post VARCHAR(50) COMMENT 'должность',
	role VARCHAR(50) COMMENT 'роль',
	filial VARCHAR(50) COMMENT 'филиал',
	created_at DATETIME DEFAULT NOW(),
	INDEX firstname_idx (firstname),
	INDEX lastname_idx (lastname),
	INDEX middlename_idx (middlename),
	INDEX post_idx (post),
	INDEX role_idx (role));

-- список пациентов --
DROP TABLE IF EXISTS patient_profiles;
CREATE TABLE patient_profiles (
	id_profiles SERIAL PRIMARY KEY,
	firstname VARCHAR(50) COMMENT 'Имя',
	lastname VARCHAR(50) COMMENT 'Фамилия',
	middlename VARCHAR(50) COMMENT 'Отчество',
	birthday DATE,
	gender ENUM('Мужчина', 'Женщина'),
	email VARCHAR(120) UNIQUE,
	phone BIGINT,
	police VARCHAR(50) COMMENT '№ страхового полиса',
	hometown VARCHAR(200) COMMENT 'адрес места жительства',
	created_at DATETIME DEFAULT NOW(),
	medical_card BIGINT COMMENT '№ электронной медицинской карты',
	INDEX firstname_idx (firstname),
	INDEX lastname_idx (lastname),
	INDEX middlename_idx (middlename),
	INDEX police_idx (police),
	INDEX medical_card_idx (medical_card));

-- справочник должностей --
DROP TABLE IF EXISTS user_posts;
CREATE TABLE user_posts (
	id_posts SERIAL PRIMARY KEY,
	code_posts INT(10)COMMENT 'код должности',
	name_posts VARCHAR(50) COMMENT 'имя должности',
	notice_posts VARCHAR(50) COMMENT 'примечание');
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	
	
	
	
	
	