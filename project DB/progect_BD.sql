DROP DATABASE IF EXISTS medical_clinic;
CREATE DATABASE medical_clinic;

USE medical_clinic;


-- справочник должностей --
DROP TABLE IF EXISTS user_posts;
CREATE TABLE user_posts (
	id_posts SERIAL PRIMARY KEY,
	code_posts INT(10) COMMENT 'код должности',
	name_posts VARCHAR(50) COMMENT 'имя должности',
	notice_posts VARCHAR(50) COMMENT 'примечание');



-- справочник ролей --
DROP TABLE IF EXISTS user_roles;
CREATE TABLE user_roles (
	id_roles SERIAL PRIMARY KEY,
	code_roles INT(10) COMMENT 'код роли',
	name_roles VARCHAR(50) COMMENT 'имя роли',
	notice_roles VARCHAR(50) COMMENT 'примечание');


-- справочник филиалов --
DROP TABLE IF EXISTS filials;
CREATE TABLE filials (
	id_filials SERIAL PRIMARY KEY,
	code_filials INT(10) COMMENT 'код филиала',
	name_filials VARCHAR(50) COMMENT 'название филиала',
	hometown_filials VARCHAR(200) COMMENT 'адрес филиала',
	phone_filials BIGINT,
	bankname_filials VARCHAR(50) COMMENT 'название банка',
	bankaccount_filials VARCHAR(50) COMMENT 'расчётный счёт',
	inn_filials INT(12),
	OGRN_filials INT(12),	
	notice_filials VARCHAR(50) COMMENT 'примечание');



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
	post BIGINT UNSIGNED NOT NULL COMMENT 'код должности',
	role BIGINT UNSIGNED NOT NULL COMMENT 'роль',
	filial BIGINT UNSIGNED NOT NULL COMMENT 'филиал',
	created_at DATETIME DEFAULT NOW(),
	INDEX firstname_idx (firstname),
	INDEX lastname_idx (lastname),
	INDEX middlename_idx (middlename),
	INDEX post_idx (post),
	INDEX role_idx (role),
	FOREIGN KEY (post) REFERENCES user_posts(id_posts) ON UPDATE CASCADE,
	FOREIGN KEY (role) REFERENCES user_roles(id_roles) ON UPDATE CASCADE,
	FOREIGN KEY (filial) REFERENCES filials(id_filials) ON UPDATE CASCADE);

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



	