<<--part1-->>

show databases;

use vitcampus;
show tables from vitcampus;
select*from cse;

desc cse;
alter table cse add(
	sdepartment varchar(30)
);
insert into cse values(106,"Adarsh",72,'cse');

alter table cse add(
	sdepartment varchar(30),sphoneno1 int8,sphoneno2 int8
);

alter table cse drop column sdepartment;


alter table cse add(
	scountry varchar(30) default 'India'
);

alter table cse rename column 
	scountry to slocation
;
select * from cse;


#Part 2 -> for truncate 

select * from cse;

truncate table cse ;

desc cse ;

show tables from vitcampus;
delete from eee;

rename table eee to cse;
show tables ;

<<--part2->>

select * from cse;

drop table cse;

desc cse;

show tables from vitcampus;

delete from eee;

select * from eee;

RENAME TABLE eee to ECE;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');


select * from worker;


UPDATE worker SET First_name='Jayanth',Last_name='V' WHERE worker_id=1;

UPDATE worker SET salary = salary+5000; 

DELETE FROM worker WHERE worker_id=8;


<--part2.1-->

create table empid( id int);
start transaction;

insert into empid values(101);
select * from empid;

savepoint time15;
insert into empid values(102);

savepoint time16;

select *from empid;

insert into empid values(103);
savepoint time17;

rollback to time16;

select * from empid;

<--part 3-->

# clauses

#Comparative operators

# greater than
select first_name,salary,department from worker where salary>100000;

#not equal to 

select first_name,salary,department from worker where salary<>100000;

#greather than or equal to
select first_name,salary,department from worker where salary>=100000;

# less than or equal to 
select first_name,salary,department from worker where salary<=100000;


#Arithmetic operators
# addition
update worker set salary =salary+5000;

#subtraction
update worker set salary =salary-5000;

#multipliocation
update worker set salary =salary*1;

#division
update worker set salary =salary/1;

#modulus

update worker set salary =salary%5;



