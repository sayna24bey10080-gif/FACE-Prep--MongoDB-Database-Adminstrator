use vitcampus;
show tables from vitcampus;

select* from worker;

select first_name, department, salary from worker
where department='admin' or salary >=100000;

select worker_id, first_name, department, salary from worker
where worker_id in (1,6,7);

select* from worker where salary between 100000 and 300000;


select *from worker 
where salary between 100000 and 200000
and department not in ('hr','admin');

select* from worker;

#for date

select *from worker where joining_date< '2014-02-20 09:00:00';

drop table worker;

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

select*from worker where first_name like 'Vipul%';
select*from worker where first_name like '__h%';
select*from worker where first_name like 's%s_';
select*from worker where first_name like '_i__%';
select*from worker where first_name like '_o__ka';

#Created another table

use vitcampus;

CREATE TABLE worker_2 (
    WORKER_ID INT,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(50)
);

INSERT INTO worker_2
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES
(1, 'Rahul', 'Sharma', 55000, '2023-01-10 09:00:00', 'HR'),

(2, 'Priya', 'Verma', 72000, '2022-03-15 10:30:00', 'Admin'),

(3, 'Aman', 'Singh', 48000, '2021-07-21 11:00:00', 'IT'),

(4, 'Sneha', 'Gupta', 65000, '2020-11-05 09:15:00', 'Finance'),

(5, 'Rohit', 'Yadav', 90000, '2019-06-17 08:45:00', 'IT'),

(6, 'Neha', 'Kapoor', 75000, '2022-09-12 10:00:00', 'HR'),

(7, 'Vikas', 'Mehta', 82000, '2021-12-01 09:20:00', 'Admin'),

(8, 'Anjali', 'Saxena', 58000, '2023-04-25 11:10:00', 'Finance'),

(9, 'Karan', 'Malhotra', 99000, '2018-08-30 08:00:00', 'Management'),

(10, 'Pooja', 'Mishra', 46000, '2024-02-14 09:40:00', 'Support');

select * from worker_2;


#aggregate functions 

select min(salary) from worker where department='hr';

#to display his name

select first_name from worker where salary=(select min(salary) from worker);

# to find minimum salary department wise -- hr example 

select first_name from worker where department='hr' and salary=(select min(salary) from worker where department='hr');

#to find out who has the minimunm salary From Admin Department ,but the
#person should get a less salary but in case if they're
#getting less salary, their name should not have a
#letter called A 


select first_name from worker where first_name not like'%A%' and department='admin' and salary=(select min(salary) from worker where department='admin');

# union -> no duplicates allowed , used to merge two tables 
select salary from worker 
union
select salary from worker;

#union all -> duplicates allowed 
select salary from worker 
union
select salary from worker_2;

#union with where 

select first_name,department from worker
where department='hr' 
union
select first_name,department from worker_2
where department='hr';

#alias
select worker_id as roll_no from worker; 

#distinct-> for unique 
select distinct(department) from worker;

#sql case statement -> works like if then else 

select worker_id , first_name, 
case
	when salary >300000 then 'rich people'
    when salary>=100000 and salary>299999 then 'middle'
    else 'poor'
end
as status
from worker;


select min(salary) from worker where department='admin';
select max(salary) from worker where department='admin';

#view - will create new virtual tables 
create view minsalaryAdmin as select min(salary) from worker where department='admin';
create view maxsalaryAdmin as select max(salary) from worker where department='admin';

create view hr_employee 
as select first_name,salary,department
from worker 
where department='hr';


