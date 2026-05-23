#joins 

use vitcampus;
create table department(
did int primary key,
dname varchar(25) not null unique
);

insert into department values
(101,'cse'),(102,'ECE'),(103,'CIVIL'),(106,'Aero'),(107,'Mechanical');

select*from department order by did asc;

create table HOD(
Hid int primary key,
hname varchar(20) not null unique);

insert into HOD values 
(101,'Arun'),(102,'Jayanth'),(104,'Karthik'),(105,'Murali');

select * from HOD;

#join is used to fetch data from two or more tables by combining two or more tables 
#cross join - cross product 

select * from department cross join hod order by did asc;

#inner join
#based on the common values of columns

select *from department inner join
hod where department.did=hod.hid;

select *from department inner join
hod on department.did=hod.hid;

select *from department inner join
hod where department.dname=hod.hname;

# natural join -> inner join only , but the columns' name and the datatype both should be same
 
select *from department natural join hod;
#as there are no matching column names in both the tables , so o/p would be same of inner join

#left outer join -> common and the left side table values will be present 
select * from department left outer join
hod on (department.did=hod.hid) order by did asc;

#full join -> where there is not match it will just simply give null
select * from department full join
hod on (department.did=hod.hid);


