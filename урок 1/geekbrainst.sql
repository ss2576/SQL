
CREATE database if not exists geekbrains;

use geekbrains;

create table courses (
	id INT auto_increment NOT NULL PRIMARY KEY,
	name VARCHAR(150) UNIQUE
    );


create table students(
	id INT auto_increment NOT NULL PRIMARY KEY,
	firstname VARCHAR(50) not null,
	lastname VARCHAR(100) not null,
	email VARCHAR(100) UNIQUE,
	course_id INT
	);
	
/*
alter table students
add column birthday DATE;

alter table students
RENAME COLUMN birthday TO date_of_birth; 

alter table students
drop column date_of_birth;

drop table students;

drop database geekbrains;

*/
insert into courses (name)
values ("Databasee"), ("Linux"), ("bigATA");

-- ??????? ?????????

INSERT INTO students (firstname, lastname, email, course_id) VALUES 
("Pavel", "Durov", "ivanov@yandex.ru", "1"),
("Bill", "Gates", "petrov@yandex.ru", "2"),
("Ivan", "Grozny", "i.pushkina@yandex.ru", "3"),
("Olga", "Buzova", "megastar@yandex.ru", "1");

select * from courses;

select * from students;

select * from students
where lastname = 'Gates';

select * from students
where firstname = 'Pavel';

update students
set 
	email = 'buzova@rambler.ru',
	course_id = 3
where
	lastname = 'Buzova';


delete from students
where id = 1;
	
