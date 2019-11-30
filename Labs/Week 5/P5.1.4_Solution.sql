CREATE DATABASE test;
USE test;

CREATE TABLE Student	
(
stud_id INT unsigned not null,
stud_name VARCHAR(40) not null,
stud_phone VARCHAR(15) not null,
stud_date_of_birth DATE not null,
stud_city VARCHAR(20) not null,
stud_address VARCHAR(100) not null,
stud_postcode SMALLINT unsigned not null,
PRIMARY KEY(stud_id)
);

CREATE TABLE Subject
(
subj_code CHAR(7) not null,
subj_title VARCHAR(60) not null,
PRIMARY KEY(subj_code)
);

CREATE TABLE Subj_Enrolment
(
stud_id INT unsigned not null,
subj_code CHAR(7) not null,
semester CHAR(1) not null,
year YEAR not null,
comment VARCHAR(255),
PRIMARY KEY(stud_id, subj_code, semester, year),
FOREIGN KEY(stud_id) REFERENCES Student(stud_id),
FOREIGN KEY(subj_code) REFERENCES Subject(subj_code)
);

CREATE TABLE Grade
(
stud_id INT unsigned not null,
subj_code CHAR(7) not null,
semester CHAR(1) not null,
year YEAR not null,
grade CHAR(2) not null,
PRIMARY KEY(stud_id, subj_code, semester, year),
FOREIGN KEY(stud_id) REFERENCES Student(stud_id),
FOREIGN KEY(subj_code) REFERENCES Subject(subj_code)
);