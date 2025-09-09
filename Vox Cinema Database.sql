--creation
DROP TABLE cinema CASCADE CONSTRAINTS;
CREATE TABLE cinema(
C_ID CHAR(4),
C_name VARCHAR2(20) NOT NULL,
CONSTRAINT CID_PK PRIMARY KEY(C_ID));

DROP TABLE movie CASCADE CONSTRAINTS;
CREATE TABLE movie(
title VARCHAR2(25),
release_year NUMBER(4),
release_month NUMBER(2),
CONSTRAINT title_PK PRIMARY KEY(title));

DROP TABLE movie_genres CASCADE CONSTRAINTS;
CREATE TABLE movie_genres(
genres VARCHAR2(25),
title VARCHAR2(25),
CONSTRAINT genres_PK PRIMARY KEY(genres, title),
CONSTRAINT title_FK FOREIGN KEY(title) REFERENCES movie(title));

DROP TABLE screens CASCADE CONSTRAINTS;
CREATE TABLE screens(
C_ID CHAR(4),
title VARCHAR2(25),
CONSTRAINT screens_PK PRIMARY KEY(C_ID, title),
CONSTRAINT CID_FK FOREIGN KEY(C_ID) REFERENCES cinema(C_ID),
CONSTRAINT titleS_FK FOREIGN KEY(title) REFERENCES movie(title));

DROP TABLE theater CASCADE CONSTRAINTS;
CREATE TABLE theater(
screen_NO NUMBER(2), 
seats NUMBER(2),
CONSTRAINT theater_PK PRIMARY KEY(screen_NO));

DROP TABLE show CASCADE CONSTRAINTS;
CREATE TABLE show(
title VARCHAR2(25),
screen_NO NUMBER(2), 
CONSTRAINT show_PK PRIMARY KEY(title, screen_NO),
CONSTRAINT titleShow_FK FOREIGN KEY(title) REFERENCES movie(title),
CONSTRAINT screenNo_FK FOREIGN KEY(screen_NO) REFERENCES theater(screen_NO));

DROP TABLE customer CASCADE CONSTRAINTS;
CREATE TABLE customer(
CUS_ID CHAR(4),
name VARCHAR2(25) NOT NULL,
phone_num VARCHAR2(10),
age NUMBER(3),
CONSTRAINT customer_PK PRIMARY KEY(CUS_ID));

DROP TABLE employee CASCADE CONSTRAINTS;
CREATE TABLE employee(
SSN NUMBER(10),
name VARCHAR2(25) NOT NULL,
salary NUMBER(6),
C_ID CHAR(4),
Manager_SSN NUMBER(10),
CONSTRAINT employee_PK PRIMARY KEY(SSN),
CONSTRAINT cidE_FK FOREIGN KEY(C_ID) REFERENCES cinema(C_ID),
CONSTRAINT ESSN_FK FOREIGN KEY(Manager_SSN) REFERENCES employee(SSN));

DROP TABLE reserve CASCADE CONSTRAINTS;
CREATE TABLE reserve(
Res_num CHAR(10),
title VARCHAR2(25),
Cus_ID CHAR(4),
CONSTRAINT reserve_PK PRIMARY KEY(Res_num),
CONSTRAINT ResTitle_FK FOREIGN KEY(title) REFERENCES movie(title),
CONSTRAINT ResCusID_FK FOREIGN KEY(CUS_ID) REFERENCES customer(CUS_ID));

--insertion
insert into cinema values ('0000','vox');
insert into cinema values ('1111','vox');
insert into cinema values ('2222','vox');

insert into movie values ('Freelance',2023,10);
insert into movie values ('The cello',2023,9);
insert into movie values ('Deep fear',2023,11);

insert into movie_genres values ('Action/Comedy','Freelance');
insert into movie_genres values ('Horror','The cello');
insert into movie_genres values ('Survival Thriller','Deep fear');

insert into screens values ('0000','Freelance');
insert into screens values ('1111','The cello');
insert into screens values ('2222','Deep fear');

insert into theater values (1,03);
insert into theater values (2,06);
insert into theater values (3,09);

insert into show values ('Freelance',1);
insert into show values ('The cello',2);
insert into show values ('Deep fear',3);

insert into customer values ('3333','Ahmad','0532651808',19);
insert into customer values ('4444','Leena','0506129354',12);
insert into customer values ('5555','Reema','0598215426',33);


insert into employee (SSN,name,salary,C_ID) values (1157902468,'Sara',20000,'0000');
insert into employee (SSN,name,salary,C_ID) values (1158834920,'Norah',20000,'1111');
insert into employee values (1264681357,'Omar',11000,'1111',1158834920);
insert into employee values (1365724983,'Lama',16000,'2222',1157902468);
insert into employee values (1458699220,'Khalid',18000,'2222',1157902468);


insert into reserve values ('0122334455','Freelance','3333');
insert into reserve values ('0166778899','The cello','4444');
insert into reserve values ('0133662277','Deep fear','5555');

--WHERE clause
SELECT name 
FROM employee 
WHERE name LIKE '___a';

UPDATE customer
SET age=20
WHERE age=19;

SELECT * FROM customer;

SELECT * 
FROM customer
WHERE age <18;

SELECT *
FROM employee
WHERE salary BETWEEN 15000 AND 20000;

--lecture 8&9 
SELECT C_ID, MIN(salary), MAX (salary)
FROM employee
GROUP BY C_ID
ORDER BY C_ID;

SELECT name,MIN(age)
FROM customer
GROUP BY name
HAVING MIN(age)<18;

SELECT e.name , c.C_ID, c.C_name
FROM employee e, cinema c
WHERE e.C_ID= c.C_ID;