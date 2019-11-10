DROP DATABASE IF EXISTS medical_clinic;
CREATE DATABASE medical_clinic;

USE medical_clinic;

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
	post VARCHAR(50) COMMENT '���������',
	role VARCHAR(50) COMMENT '����',
	filial VARCHAR(50) COMMENT '������',
	created_at DATETIME DEFAULT NOW(),
	INDEX firstname_idx (firstname),
	INDEX lastname_idx (lastname),
	INDEX middlename_idx (middlename),
	INDEX post_idx (post),
	INDEX role_idx (role));

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

-- ���������� ���������� --
DROP TABLE IF EXISTS user_posts;
CREATE TABLE user_posts (
	id_posts SERIAL PRIMARY KEY,
	code_posts INT(10)COMMENT '��� ���������',
	name_posts VARCHAR(50) COMMENT '��� ���������',
	notice_posts VARCHAR(50) COMMENT '����������');
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	
	
	
	
	
	