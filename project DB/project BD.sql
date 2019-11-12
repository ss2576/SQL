DROP DATABASE IF EXISTS medical_clinic;
CREATE DATABASE medical_clinic;

USE medical_clinic;


-- ���������� ���������� --
DROP TABLE IF EXISTS user_posts;
CREATE TABLE user_posts (
	id_posts SERIAL PRIMARY KEY,
	code_posts INT(10) COMMENT '��� ���������',
	name_posts VARCHAR(50) COMMENT '��� ���������',
	notice_posts VARCHAR(50) COMMENT '����������');



-- ���������� ����� --
DROP TABLE IF EXISTS user_roles;
CREATE TABLE user_roles (
	id_roles SERIAL PRIMARY KEY,
	code_roles INT(10) COMMENT '��� ����',
	name_roles VARCHAR(50) COMMENT '��� ����',
	notice_roles VARCHAR(50) COMMENT '����������');


-- ���������� �������� --
DROP TABLE IF EXISTS filials;
CREATE TABLE filials (
	id_filials SERIAL PRIMARY KEY,
	code_filials INT(10) COMMENT '��� �������',
	name_filials VARCHAR(50) COMMENT '�������� �������',
	hometown_filials VARCHAR(200) COMMENT '����� �������',
	phone_filials BIGINT,
	bankname_filials VARCHAR(50) COMMENT '�������� �����',
	bankaccount_filials VARCHAR(50) COMMENT '��������� ����',
	inn_filials INT(12),
	OGRN_filials INT(12),	
	notice_filials VARCHAR(50) COMMENT '����������');


-- ���������� �������� --
DROP TABLE IF EXISTS drugs;
CREATE TABLE drugs (
	id_chambers SERIAL PRIMARY KEY,
	code_drugs INT(10) COMMENT '��� ���������',
	name_drugs VARCHAR(200) COMMENT '�������� ���������',
	notice_drugs VARCHAR(200) COMMENT '����������');


-- ������ ���������� --
DROP TABLE IF EXISTS chambers;
CREATE TABLE chambers (
	id_chambers SERIAL PRIMARY KEY,
	number_chambers INT(10) COMMENT '����� ������',
	code_chambers INT(10) COMMENT '��� ���������',
	department_chamber VARCHAR(50) COMMENT '�������� ���������',
	notice_chamber VARCHAR(200) COMMENT '����������');


-- ���������� ����������� --
DROP TABLE IF EXISTS diseases;
CREATE TABLE diseases (
	id_diseases SERIAL PRIMARY KEY,
	code_diseases INT(10) COMMENT '��� �����������',
	name__diseases VARCHAR(200) COMMENT '�������� �����������',
	notice_diseases VARCHAR(200) COMMENT '����������',
	INDEX code_diseases_idx (code_diseases),
	INDEX name__diseases_idx (name__diseases));


-- ������������ �� --
DROP TABLE IF EXISTS user_profiles;
CREATE TABLE user_profiles (
	id_user SERIAL PRIMARY KEY,
	firstname VARCHAR(50) COMMENT '���',
	lastname VARCHAR(50) COMMENT '�������',
	middlename VARCHAR(50) COMMENT '��������',
	birthday DATE,
	gender ENUM('�������', '�������'),
	email VARCHAR(120) UNIQUE,
	post BIGINT UNSIGNED NOT NULL COMMENT '��� ���������',
	role BIGINT UNSIGNED NOT NULL COMMENT '����',
	filial BIGINT UNSIGNED NOT NULL COMMENT '������',
	department VARCHAR(50) COMMENT '���������',
	created_at DATETIME DEFAULT NOW(),
	INDEX firstname_idx (firstname),
	INDEX lastname_idx (lastname),
	INDEX middlename_idx (middlename),
	INDEX post_idx (post),
	INDEX role_idx (role),
	FOREIGN KEY (post) REFERENCES user_posts(id_posts) ON UPDATE CASCADE,
	FOREIGN KEY (role) REFERENCES user_roles(id_roles) ON UPDATE CASCADE,
	FOREIGN KEY (filial) REFERENCES filials(id_filials) ON UPDATE CASCADE);

-- ������ ��������� --
DROP TABLE IF EXISTS patient_profiles;
CREATE TABLE patient_profiles (
	id_profiles SERIAL PRIMARY KEY,
	firstname VARCHAR(50) COMMENT '���',
	lastname VARCHAR(50) COMMENT '�������',
	middlename VARCHAR(50) COMMENT '��������',
	birthday DATE,
	gender ENUM('�������', '�������'),
	email VARCHAR(120) UNIQUE,
	phone BIGINT,
	police VARCHAR(50) COMMENT '� ���������� ������',
	hometown VARCHAR(200) COMMENT '����� ����� ����������',
	created_at DATETIME DEFAULT NOW(),
	medical_card BIGINT COMMENT '� ����������� ����������� �����',
	INDEX firstname_idx (firstname),
	INDEX lastname_idx (lastname),
	INDEX middlename_idx (middlename),
	INDEX police_idx (police),
	INDEX medical_card_idx (medical_card));



-- ���������� ������ --
DROP TABLE IF EXISTS schedule;
CREATE TABLE schedule (
	id_schedule SERIAL PRIMARY KEY,
	date_schedule DATETIME COMMENT '�� ����� ���� ������',
	user_schedule BIGINT UNSIGNED NOT NULL COMMENT '����',
	patient_schedule BIGINT UNSIGNED NOT NULL COMMENT '�������',
	created_schedule DATETIME DEFAULT NOW(),
	FOREIGN KEY (user_schedule) REFERENCES user_profiles(id_user) ON UPDATE CASCADE,
	FOREIGN KEY (patient_schedule) REFERENCES patient_profiles(id_profiles) ON UPDATE CASCADE,
	INDEX user_schedule_idx (user_schedule),
	INDEX patient_schedule_idx (patient_schedule));



-- ����������� ����������� ����� �������� --
DROP TABLE IF EXISTS medical_cards;
CREATE TABLE medical_cards (
	id_medical SERIAL PRIMARY KEY,
	number_medical INT(10) COMMENT '����� �����',
	id_patients_medical BIGINT UNSIGNED NOT NULL COMMENT 'ID ��������',
	id_user_medical BIGINT UNSIGNED NOT NULL COMMENT 'ID �����',
	created_at DATETIME DEFAULT NOW(),
	code_diseases_medical BIGINT UNSIGNED NOT NULL COMMENT '��� �����������',
	code_drugs_medical BIGINT UNSIGNED NOT NULL COMMENT '��� ���������',
	diseases_medical TEXT COMMENT '�������.����� ������� �����',
	number_chambers_medical BIGINT UNSIGNED NOT NULL COMMENT '����� ������',
	dateto_chamber_medical DATETIME COMMENT '���� ���������� � ������ ����������',
	dateoff_chamber_medical DATETIME COMMENT '���� ������� �� ������ ����������',
	FOREIGN KEY (id_patients_medical) REFERENCES patient_profiles(id_profiles),	
	FOREIGN KEY (id_user_medical) REFERENCES user_profiles(id_user),
	FOREIGN KEY (code_diseases_medical) REFERENCES diseases(id_diseases),
	FOREIGN KEY (code_drugs_medical) REFERENCES drugs(id_chambers),
	FOREIGN KEY (number_chambers_medical) REFERENCES chambers(id_chambers),
	INDEX number_medical_idx (number_medical),
	INDEX id_patients_medical_idx (id_patients_medical),
	INDEX id_user_medical_idx (id_user_medical));



























	

	

