-- ���������� ������� __
USE medical_clinic;

-- ���������� ���������� --
INSERT INTO user_posts VALUES
('1','0000000001','������� ����','�������� �� ��!');

-- ���������� ����� --
INSERT INTO user_roles VALUES
('1','10','������� ����','����� ������ �� ���� ����� ������� � �������');

-- ���������� �������� --
INSERT INTO filials VALUES
('1','777000','������','�.������, ��.������, �.29','79566263132','����� ����','4523652145','773654789','1235648797','������ ������');

-- ���������� �������� --
INSERT INTO drugs VALUES
('1','5400001','�������','����������������� ������� .��������� ���������������, ��������������, ��������������������� ��������');

-- ������ ���������� --
INSERT INTO chambers VALUES
('1','1','001','�������','');

-- ���������� ����������� --
INSERT INTO diseases VALUES
('1','A00.0','������, ��������� �������� ��������� 01, ������ cholerae','������� ������� ���������');


-- ������������ �� --
INSERT INTO user_profiles (firstname,lastname,middlename,birthday,gender,email,post,role,filial,department) VALUES 
('�����','������','����������','1988-11-22','�������','123@yandex.ru','1','1','1','1');


-- ������ ��������� --
INSERT INTO patient_profiles (firstname,lastname,middlename,birthday,gender,email,phone,police,hometown,medical_card)VALUES
('�����','���������','�������������','1953-01-26','�������','iri@gmail.com','+79681593265','4512316','�.������ ,��.��������, ��� 13, ��.56','1331');


-- ���������� ������ --
INSERT INTO schedule (date_schedule,user_schedule,patient_schedule)VALUES
('2019-11-22 10:30:00','1','1');


-- ����������������� ������ �������� --
INSERT INTO patien_photo (patien_id_photo,name_photo)VALUES
('1','face1.jpg'),
('1','face2.jpg'),
('1','face3.jpg');

-- ����������� ����������� ����� �������� --
INSERT INTO medical_cards (number_medical,id_patients_medical,id_user_medical,code_diseases_medical,
code_drugs_medical,diseases_medical,number_chambers_medical,dateto_chamber_medical,dateoff_chamber_medical)VALUES
('1331','1','1','1','1','������� ���������� �����,�� ���� �����,���� � �� �����,���� ���������!','1','2019-06-11 19:35:00','2019-06-22 16:00:00');


















