show databases;

create database vitcampus1;
drop database vitcampus1;

use vitcampus;

create table CSE(
sid int8,
sname varchar(50),
smarks int1
);

create table Mech(
sid int8,
sname varchar(50),
smarks int1
);

create table EEE(
sid int8,
sname varchar(50),
smarks int1
);

show tables;

select*from cse;
insert into cse value(101,'Nilesh',52);
insert into cse value(102,'Tanya',42);
insert into cse value(103,'Adarsh',72);
insert into cse value(104,'Riya',92);
insert into cse value(105,'Anukarsh',02);

select*from cse;
