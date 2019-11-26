use medical_clinic;

-- ФИО врачей с должностями --
SELECT concat(lastname,'   ',firstname,'   ', middlename) , name_posts AS должность, name_filials AS филиал
FROM user_profiles, user_posts, filials where user_posts.id_posts = user_profiles.post AND filials.id_filials = user_profiles.filial;




-- на основании 4-х таблиц patient_profiles , user_profiles , medical_cards ,user_posts  
-- вывести ФИО пациента и должность врача и ФИО врача ,который сделал запись в медицинской карте пациента.
USE medical_clinic;
SELECT CONCAT (p.lastname,'  ',p.firstname,'  ', p.middlename),
up.name_posts,
CONCAT(u.lastname,'  ',u.firstname,'  ', u.middlename)
FROM patient_profiles AS p
JOIN medical_cards AS m ON p.id_profiles = m.id_patients_medical
JOIN user_profiles AS u ON m.id_user_medical = u.id_user
JOIN user_posts AS up ON u.post = up.id_posts
ORDER BY CONCAT (p.lastname,'  ',p.firstname,'  ', p.middlename);



-- представление (VIEW) --
CREATE OR REPLACE  VIEW pat AS SELECT * FROM patient_profiles ORDER BY lastname;
SHOW TABLES;
SELECT * FROM pat;




-- Создание таблицы logs типа Archive. При каждом создании записи в таблицах user_profiles, 
-- patient_profiles и schedule в таблицу logs помещается время и дата создания записи, название таблицы, --
-- идентификатор первичного ключа и содержимое поля lastname.
DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  id int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  created_at datetime DEFAULT current_timestamp(),
  name varchar(100) NOT NULL,
  table_id int(10) NOT NULL,
  contet_name varchar(255)
) ENGINE=ARCHIVE;

DROP TRIGGER IF EXISTS write_user_profiles_log_insert;
DELIMITER //
CREATE TRIGGER `write_user_profiles_log_insert` AFTER INSERT ON `user_profiles` FOR EACH ROW BEGIN
	INSERT INTO `logs` (name, table_id, contet_name)
	VALUES ('врачи', (SELECT NEW.id_user), (SELECT NEW.lastname));
END//

DROP TRIGGER IF EXISTS write_patient_profiles_log_insert;
DELIMITER // 
CREATE TRIGGER `write_patient_profiles_log_insert` AFTER INSERT ON `patient_profiles` FOR EACH ROW BEGIN
	INSERT INTO `logs` (name, table_id, contet_name)
	VALUES ('пациенты', (SELECT NEW.id_profiles), (SELECT NEW.lastname));
END//

DROP TRIGGER IF EXISTS write_shedule_log_insert;
DELIMITER // 
CREATE TRIGGER `write_schedule_log_insert` AFTER INSERT ON `schedule` FOR EACH ROW BEGIN
	INSERT INTO `logs` (name, table_id, contet_name)
	VALUES ('расписание', (SELECT NEW.id_schedule), (SELECT NEW.patient_schedule));
END//

SELECT * FROM logs