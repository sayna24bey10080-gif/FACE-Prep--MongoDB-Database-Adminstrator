#constraints -> used while creating the table like 
#not null which is mandatory , last name is optional , 
#its not mandatory 

#particular columns should not be duplicate values -> 
#unique -> email id, phone number ,

#unique and not null -> roll number 

# default-> automatically values will be assigned without any specific mentioning of the values 

#check -> write the condition according to our wish , like salary>values
#like for eg.  country is India , or any other 

#keys -> primary and foreign key 


use vitcampus;
create table persons(
	id int not null,
    lastname varchar(255) not null,
    firstname varchar(255) not null,
    age int
);
desc persons;
insert into persons values (101, 'V','Nilesh',null);

select * from persons;

#updating the constraints after creation of the table 
alter table persons
add unique(age);

alter table persons
drop constraint age;

drop table persons;


create table persons(

	id int not null,
    lastname varchar(255) not null,
    firstname varchar(255) not null,
	age int not null,
    check (age>=18),
    city varchar(255) default 'allahabad',
    address varchar(255)
    
);

insert into persons values (101, 'V','Nilesh',20);
alter table persons
add check(age>=18);

# specially for not null
alter table persons
modify address varchar(255) not null;

#not null+unique = primary key 
# we can add as much not null we want in our table 
#but primary key should be 1 only 
#we can add features of pk to any other column like that of pk
# as of not null+ unique , but it would not be a primaery key 
#it will work like that but 

create table products (
	pid int primary key ,
    pname varchar(100) not null,
    p_reference_no int not null unique);

desc products;


insert into products values(101,'electronics',19929);
select*from products;

insert into products values(102,'furniture',19930);

#to add primary key 
#alter table  products
#add primary key (pid);

# to drop the primary key -> as there is only one primary key in the table , so no need to mention the cokumn name which is to be dropped form the table 
alter table products
drop primary key;

alter table products
add primary key (pname);

# foreign key can have duplicate values

drop table products;

create table category(
cid int primary key,
cname varchar(100) not null
);

insert into category values (101,'electronics') , (102,'mechanics');

CREATE TABLE products (
pid int primary key,
pname varchar(100) NOT NULL,
cid int,
FOREIGN KEY (cid) REFERENCES category(cid)

#Every cid inside products
#must already exist inside category table-> meaning
#insert into products values(504,'Samsung TV',999); will be rejected
);
desc products;
#cid as mul -> means foreign key 

insert into products values(501,'hp laptop',101);
insert into products values(502,'asus laptop',101);
insert into products values(503,'acer laptop',102);
#insert into products values(504,'Samsung TV',999); will be rejected

select * from products;

#It inserts a new row into the products table.

insert into products values (504,'Power Bank Samsung','64-bit encry key');

DELETE FROM category
WHERE cid = 101;

#We cannot delete parent data
#while child rows still reference it

UPDATE category
SET cid = 500
WHERE cid = 101;

# rejected bcz products table still depends on it 

#accepted one

UPDATE category
SET cname = 'electrical'
WHERE cid = 101;



