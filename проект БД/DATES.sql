-- наполнение данными --
USE medical_clinic;

-- справочник должностей --
INSERT INTO user_posts VALUES
('1','0000000001','Главный врач','отвечает за всё!');

-- справочник ролей --
INSERT INTO user_roles VALUES
('1','10','Главный врач','имеет доступ ко всем видам записям и отчётам');

-- справочник филиалов --
INSERT INTO filials VALUES
('1','777000','Москва','г.Москва, Ул.Ленина, д.29','79566263132','Альфа Банк','4523652145','773654789','1235648797','лучший филиал');

-- справочник лекарств --
INSERT INTO drugs VALUES
('1','5400001','Аспирин','Ацетилсалициловая кислота .Оказывает анальгезирующее, жаропонижающее, противовоспалительное действие');

-- палаты стационара --
INSERT INTO chambers VALUES
('1','1','001','Терапия','');

-- справочник заболеваний --
INSERT INTO diseases VALUES
('1','A00.0','Холера, вызванная холерным вибрионом 01, биовар cholerae','высокий уровень заражения');


-- пользователи БД --
INSERT INTO user_profiles (firstname,lastname,middlename,birthday,gender,email,post,role,filial,department) VALUES 
('Антон','Рябцев','Николаевич','1988-11-22','Мужчина','123@yandex.ru','1','1','1','1');


-- список пациентов --
INSERT INTO patient_profiles (firstname,lastname,middlename,birthday,gender,email,phone,police,hometown,medical_card)VALUES
('Ирина','Белозёрова','Александровна','1953-01-26','Женщина','iri@gmail.com','+79681593265','4512316','г.Москва ,ул.Ясеневая, дом 13, кв.56','1331');


-- расписание приема --
INSERT INTO schedule (date_schedule,user_schedule,patient_schedule)VALUES
('2019-11-22 10:30:00','1','1');


-- исследовательсике снимки пациента --
INSERT INTO patien_photo (patien_id_photo,name_photo)VALUES
('1','face1.jpg'),
('1','face2.jpg'),
('1','face3.jpg');

-- электронная медицинская карта пациента --
INSERT INTO medical_cards (number_medical,id_patients_medical,id_user_medical,code_diseases_medical,
code_drugs_medical,diseases_medical,number_chambers_medical,dateto_chamber_medical,dateoff_chamber_medical)VALUES
('1331','1','1','1','1','Больной однозначно болен,но жить будет,хотя и не долго,зато счастливо!','1','2019-06-11 19:35:00','2019-06-22 16:00:00');


















