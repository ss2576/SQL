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