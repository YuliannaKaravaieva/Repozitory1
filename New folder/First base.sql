create database my_first_db;

use my_first_db;

create table dog(
name varchar(50),
dreed varchar(80),
age int);

drop table dog;

create table cat;
drop table cat;

create table student(
name varchar(25),
myDate date,
hobbie varchar(40));

insert into student(name, myDate, hobbie)
values('Ivan', '2000-07-13','crietor'), ('Dmutro', '2003-06-14', 'CEO');

select name from student where name like 'Terror%' and name is  not null;

alter table student
add column skill decimal(4,2);

update student set skill = 5.00 where name = 'Terror 2';

use my_first_db;

alter table student
drop column name;
alter table student
add column name VARCHAR(50) NOT NULL;

select * from student;



alter table student
add column id int NOT NULL Auto_increment,
add primary key (id);

alter table student
modify column hobbie varchar(40) not null;

delete from student where hobbie is null;

create table student2(
id int NOT NULL Auto_increment,
name varchar (25),
myDate date,
hobbie varchar (40),
primary key(id));

alter table student
modify column hobbie varchar(40) after result;

alter table student 
modify column myDate date after id;

alter table student 
modify column result date after id;


alter table student
modify column hobbie varchar(40) after id;

alter table student
modify column id int not null auto_increment first;

delete from student where skill is null;

delete from student where id = 2;

create table workflow(
Name varchar(25),
Start date,
Tittle varchar(80));



select * from workflow;

insert into workflow(Name, Start, Tittle)
values('Inna', '2000-03-14', 'CEO'), ('Kate', '2001-12-19', 'director'), ('Dan', '2000-06-24', 'Manager');

alter table workflow
add column id int NOT NULL Auto_increment,
add primary key (id);

alter table workflow
modify column id int not null auto_increment first;


delete from workflow where id = 4;
delete from workflow where id = 5;
delete from workflow where id = 6;
delete from workflow where id = 7;
delete from workflow where id = 8;
delete from workflow where id = 9;
delete from workflow where id = 10;
delete from workflow where id = 11;
delete from workflow where id = 12;

create table Salary(
Initials varchar(40),
Time int,
Days varchar (50));

select * from Salary;

insert into Salary (Initials, Time, Days)
values('I.K.L.', '26', 'Four'), ('K.N.P.', 33, 'Seven'), ('D.R.V.', '14', 'three');

alter table Salary
add column id int NOT NULL Auto_increment,
add primary key (id);

alter table Salary
modify column id int not null auto_increment first;

delete from Salary where id = 4; 
delete from Salary where id = 5; 
delete from Salary where id = 6; 

create table driver(
id int not null auto_increment primary key,
name varchar (40) not null);

create table license(
id int not null auto_increment primary key,
penalty_points int not null default 0,
registration_number varchar(8) unique not null);

alter table driver
add column license_id int unique,
add foreign key (license_id)
references license(id);

select * from driver;
select * from license;

insert into license(penalty_points, registration_number)
values (120, 'BC123123'), (110, 'AAOO1122'), (900, 'BORISINA');

insert into license(penalty_points, registration_number)
values (400, 'BB110011');

insert into driver(name, license_id)
values ('Boris', 1), ('Ravshan', 2), ('Zhamshut',3);

drop table driver;

update license
set driver_id = id where id <4;

select driver.name, license.registration_number, license.penalty_points from license
left join driver on driver.id =license.driver_id;

create table student(
id int not null auto_increment primary key,
name varchar(40),
sorname varchar (50),
class int,
phone_number varchar(15) unique);


create table class(
id int not null auto_increment primary key,
class_number varchar (50),
Hourse varchar (40));

create table student_class(
primary key(student_id, class_id),
student_id int not null,
class_id int not null,
foreign key (student_id)
references student (id),
foreign key (class_id)
references student(id));

drop table student;
drop table student_class;

create table bag(
id int not null auto_increment primary key,
color varchar(50) not null,
brand varchar(50) not null,
student_id int,
foreign key (student_id)
references student(id)
);

insert into student(Name, sorname, class, phone_number)
values ('Vasya', 'Pupkin','2', '38006535677'),
('Masha', 'Medved', '2','380086644333'),
('mASYANYA', 'HZ', '2', '38087766554');



insert into bag(color, brand, student_id)
values ('red', 'puma',1),
('red', 'nike', '1'),
('very red', 'adidas', 1),
('pink', 'adidas', 2);

select * from  student;
select * from bag;

select * from student
inner join bag on student.id = bag.student_id;

insert into class (class_number, Hourse)
values (2, 13), (2, 15);

insert into student_class(student_id, class_id)
values (1,1), (1,3), (2,3), (2,1);

select * from student;
select * from class;
select * from student_class;

select student.name, student.sorname, class.class_number 
from student
left JOIN student_class on student.id = student_class.student_id
left JOIN class on class.id = student_class.class_id;


select name, count(*) from student group by name;

create database homework;

use homework;

create table employers(
id int not null auto_increment primary key,
Name varchar (40),
Sorename varchar (50),
Ege varchar (10)
);
 
 insert into employers(Name, Sorename, Ege)
 values ('Dan', 'Kolekor', 25),
 ('Nina', 'Richi', 20),
 ('Taras', 'Panasenko', 26),
 ('Inna', 'Petrenko', 33);
 
create table salary(
amout int,
days int);


alter table salary
add column id int not null auto_increment primary key;

select * from salary;

insert into salary(Amout, Days)
values (2000, 6),
(3000,6),
(1400, 3),
(4000, 7);



select * from salary;

select * from employers;


create table employers_salary(
primary key(employers_id, salary_id),
employers_id int not null,
 salary_id int not null,
foreign key (employers_id)
references employers (id),
foreign key (salary_id)
references employers(id));

select * from employers_salary;

select name, count(*) from employers group by name;





insert into employers_salary (employers_id, salary_id)
values (1,1), (2,3), (2,4), (2,2);

insert into employers_salary (employers_id, salary_id)
values (3, 1), (4, 4);


select employers.sorename, employers.name, salary.amout from employers
left join employers_salary on employers.id = employers_salary.employers_id
left join salary on salary.id = employers_salary.salary_id;

select employers.name, salary.amout from employers
left join employers_salary on employers.id = employers_salary.employers_id
left join salary on salary.id = employers_salary.salary_id;

Create table days(
Number_of_days int not null auto_increment primary key,
Day_of_the_week varchar (50)
);

Create table develop(
id int not null auto_increment primary key,
Seledration varchar (100),
work_day varchar (40));
 


insert into days (Number_of_days, Day_of_the_week)
values ( 1, 'Monday'), (2, 'Tuesday'), (3, 'Wednesday');

insert into develop (Seledration, work_day)
values ('Birthday Jum', 'nOT WORK DAY'), ('Not Selebration', 'Work Day');

create table days_develop(
primary key(days_Number_of_days, develop_id),
days_Number_of_days int not null,
develop_id int not null,
foreign key (days_Number_of_days)
references days (Number_of_days),
foreign key (develop_id)
references days(Number_of_days));

select * from days_develop;

create table calories(
id int not null auto_increment primary key,
name varchar(40),
Price int,
weight int,
calories int);

insert into calories (id, name, price, weight, calories)
values ( 1, 'Baked potato', 30, 200, 300),
(10, 'Omlette', 85, 180, 190);
 
 drop table calories;
 
 Create table menu(
 id int not null auto_increment primary key,
 name varchar (50),
 price int not null);
 
 create table menu2(
 id int not null auto_increment primary key,
 weight int not null,
 calories int not null);
 
  update menu2
  set calories = calories = 0
  where left  (trim(calories), 1) = 0;
 


insert into menu (name, price)
values ( 'Baked potato', 30),
( 'Omlette', 85);

insert into menu2 (weight, calories)
values (200, 300),
(180, 190);
 

create table calories(
primary key(menu_id, menu2_id),
menu_id int not null,
menu2_id int not null,
foreign key (menu_id)
references menu (id),
foreign key (menu2_id)
references menu (id));

select * from calories;


select name, count(*) from employers group by name;

select menu.name, menu.price, menu2.calories from menu
left join calories on menu.id = calories.menu_id
left join menu2 on menu.id = calories.menu2_id;

update menu2 set calories = id where calories > 1;
update menu2 set calories = calories;

select * from menu;
select * from menu2;

select menu.name, menu.price, menu2.calories from menu
Left join calories on menu.id = calories.menu_id
left join menu2 on menu.id = calories.menu2_id;

drop table MENU;
drop table MENU2;
drop table CALORIES;

select avg(calories) as calorries from menu2;












