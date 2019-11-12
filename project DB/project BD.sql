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


-- справочник лекарств --
DROP TABLE IF EXISTS drugs;
CREATE TABLE drugs (
	id_chambers SERIAL PRIMARY KEY,
	code_drugs INT(10) COMMENT 'код лекарства',
	name_drugs VARCHAR(200) COMMENT 'название лекарства',
	notice_drugs VARCHAR(200) COMMENT 'примечание');


-- палаты стационара --
DROP TABLE IF EXISTS chambers;
CREATE TABLE chambers (
	id_chambers SERIAL PRIMARY KEY,
	number_chambers INT(10) COMMENT 'номер палаты',
	code_chambers INT(10) COMMENT 'код отделения',
	department_chamber VARCHAR(50) COMMENT 'название отделения',
	notice_chamber VARCHAR(200) COMMENT 'примечание');


-- справочник заболеваний --
DROP TABLE IF EXISTS diseases;
CREATE TABLE diseases (
	id_diseases SERIAL PRIMARY KEY,
	code_diseases INT(10) COMMENT 'код заболевания',
	name__diseases VARCHAR(200) COMMENT 'название заболевания',
	notice_diseases VARCHAR(200) COMMENT 'примечание',
	INDEX code_diseases_idx (code_diseases),
	INDEX name__diseases_idx (name__diseases));


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
	department VARCHAR(50) COMMENT 'отделение',
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



-- расписание приема --
DROP TABLE IF EXISTS schedule;
CREATE TABLE schedule (
	id_schedule SERIAL PRIMARY KEY,
	date_schedule DATETIME COMMENT 'на какую дату запись',
	user_schedule BIGINT UNSIGNED NOT NULL COMMENT 'врач',
	patient_schedule BIGINT UNSIGNED NOT NULL COMMENT 'пациент',
	created_schedule DATETIME DEFAULT NOW(),
	FOREIGN KEY (user_schedule) REFERENCES user_profiles(id_user) ON UPDATE CASCADE,
	FOREIGN KEY (patient_schedule) REFERENCES patient_profiles(id_profiles) ON UPDATE CASCADE,
	INDEX user_schedule_idx (user_schedule),
	INDEX patient_schedule_idx (patient_schedule));



-- электронная медицинская карта пациента --
DROP TABLE IF EXISTS medical_cards;
CREATE TABLE medical_cards (
	id_medical SERIAL PRIMARY KEY,
	number_medical INT(10) COMMENT 'номер карты',
	id_patients_medical BIGINT UNSIGNED NOT NULL COMMENT 'ID пациента',
	id_user_medical BIGINT UNSIGNED NOT NULL COMMENT 'ID врача',
	created_at DATETIME DEFAULT NOW(),
	code_diseases_medical BIGINT UNSIGNED NOT NULL COMMENT 'код заболевания',
	code_drugs_medical BIGINT UNSIGNED NOT NULL COMMENT 'код лекарства',
	diseases_medical TEXT COMMENT 'ДИАГНОЗ.итоги осмотра врача',
	number_chambers_medical BIGINT UNSIGNED NOT NULL COMMENT 'номер палаты',
	dateto_chamber_medical DATETIME COMMENT 'дата размещения в палате стационара',
	dateoff_chamber_medical DATETIME COMMENT 'дата выписки из палаты стационара',
	FOREIGN KEY (id_patients_medical) REFERENCES patient_profiles(id_profiles),	
	FOREIGN KEY (id_user_medical) REFERENCES user_profiles(id_user),
	FOREIGN KEY (code_diseases_medical) REFERENCES diseases(id_diseases),
	FOREIGN KEY (code_drugs_medical) REFERENCES drugs(id_chambers),
	FOREIGN KEY (number_chambers_medical) REFERENCES chambers(id_chambers),
	INDEX number_medical_idx (number_medical),
	INDEX id_patients_medical_idx (id_patients_medical),
	INDEX id_user_medical_idx (id_user_medical));































	

	

