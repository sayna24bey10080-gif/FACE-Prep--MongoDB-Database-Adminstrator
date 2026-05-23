#creation and insertion of values in the tables 

use vitcampus;

CREATE TABLE Worker_test (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker_test 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09:00:00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09:00:00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09:00:00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09:00:00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09:00:00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09:00:00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09:00:00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09:00:00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker_test(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 select * from worker_test;
 select *from bonus;
 select * from title;
 
# Questions and their answers

 #question 1
 #1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>
 select first_name as Worker_name 
 from worker_test;
 
 #question 2
 #2. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
 select distinct(department) from worker_test;
 
 #question3
 #3. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table. (without OR condition)
 select *from worker_test where first_name in ('Vipul','Satish');
 
 #question4
 #4. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
 select *from worker_test where first_name like '%a%';
 
 #question 5
 #5. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
  select *from worker_test where first_name like '%a';
  
  #question 6
  #6. Write an SQL query to print details of the admin whose SALARY lies between 100000 and 500000.
  select* from worker_test
  where department='admin' and salary between  100000 and 500000;
  
  #question 7
  #7.Write an SQL query to fetch the count of employees working in the department ‘Admin’.
  select count(*) as count_of_employees
  from worker_test 
  where department ='admin';
  
  #question 8
  #8. Write an SQL query to show the second highest salary from a table.
  select distinct salary from worker_test
  order by salary desc
  limit 1 offset 1;
  
  #question 9
  #9.Write an SQL query to fetch the departments that have less than three people in it.
  
  select department,count(*) as no_of_workers
  from worker_test
  group by department
  having count(*)<3;
  
  #question 10 
  #10. Write an SQL query to show all departments along with the total number of people in there.
  select department, count(*) as no_of_people
  from worker_test
  group by department;
  
  #question 11
  #11.Write an SQL query to print the name of employees having the highest salary in each department.
  select * from worker_test worker_1
  where salary=(
  select max(salary)
  from worker_test worker_2
  where worker_2.department=worker_1.department
  );


