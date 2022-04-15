create database jdbc_tech;
use  jdbc_tech;
create table students(
id int(11) primary key,
name varchar(30),
email varchar(30),
country varchar(30)
);
insert into students (id,name,email,country) values (1,'faizan','faizan@gmail.com','pakistan');
insert into students (id,name,email,country) values (2,'ali','ali@gmail.com','turkey');
select * from students;

create table studentss(
 id  int(11) primary key auto_increment,
 name varchar(30),
 email varchar(30),
 country varchar(30)
);