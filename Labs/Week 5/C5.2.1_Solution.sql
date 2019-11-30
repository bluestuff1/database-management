CREATE DATABASE test;
USE test;

CREATE TABLE Department
(
dept_id INT unsigned not null,
dept_name VARCHAR(100) not null,
mgr_id INT unsigned not null,
mgr_start_date DATE not null,
PRIMARY KEY(dept_id)
);

CREATE TABLE Employee
(
emp_id INT unsigned not null,
emp_fname VARCHAR(20) not null,
emp_lname VARCHAR(20) not null,
emp_bdate DATE not null,
emp_address VARCHAR(100) not null,
gender CHAR(1) CHECK(gender='M' OR gender='F' OR gender='U'), 
dept_id INT unsigned not null,
super_id INT unsigned,
PRIMARY KEY(emp_id),
FOREIGN KEY(dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Project
(
proj_id INT unsigned not null,
proj_name VARCHAR(20) not null,
proj_loc VARCHAR(100) not null,
dept_id INT unsigned not null,
PRIMARY KEY(proj_id)
);

CREATE TABLE Works_on
(
proj_id INT unsigned not null,
emp_id INT unsigned not null, 
role VARCHAR(20) not null,
comment VARCHAR(255),
hours SMALLINT unsigned not null,
salary_factor DECIMAL(5,2) DEFAULT 0.00 CHECK (salary_factor>=0.00 AND salary_factor<=100.00),
PRIMARY KEY(proj_id, emp_id),
FOREIGN KEY(proj_id) REFERENCES Project(proj_id),
FOREIGN KEY(emp_id) REFERENCES Employee(emp_id)
);

CREATE TABLE Salary
(
emp_id INT unsigned not null,
salary DECIMAL(10,2) unsigned not null,
start_date DATE not null,
PRIMARY KEY(emp_id),
FOREIGN KEY(emp_id) REFERENCES Employee(emp_id)
);