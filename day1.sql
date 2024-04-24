

-- SQL : Structured Query Language.
-- MYSQL
-- PostgreSQL
-- Oracle SQL
-- IBM DB2

-- SQL sub languages -> Conception Catagories of the functionality of SQL standard.
-- DDL -> Data definition Language 
-- DML -> Data Manipulation Langugae
-- DQL -> Data Query Language
-- DCL -> Data Control Language 
-- TCL -> Transaction Control Language.


 -- database is in the form of Rows of Columns.
 -- Table is called "Entity"
 -- Columns are called "fields or attributes".
 -- Rows are called "Records or Tuples"
 -- DBMS -> Database Management system.
 -- uses quried to get the data, or insert the data, update data , delete data.
 -- create , delte databases and tables.
 
 
 -- SQL sub languages -> Conception Catagories of the functionality of SQL standard.
-- DDL -> Data definition Language 
-- its defines the overall data structure. -> tables and columns 
-- Schemas are nothing but a database structure.
-- two meanings -> database structure a schema is like a folder or package in java
-- -> a conceptional term refers to the full structural design of the database.
-- Commands 
-- create -> used to create a new database or tables.
-- alter -> chnages the exiting database or table
-- drop -> removes the database or table
-- truncate -> delete the all the data inisde a table but not the structure of the data(table).
 
-- DML -> Data Manipulation Langugae
-- its about handling the data inside a table
-- crud operations. -> create, read, update, delete
-- Commands
-- insert -> it will insert the new data or records or rows in table
-- update -> change the record or records in a table
-- delete -> removes the record froma table
-- Select -> Acesses or read the data from a table
-- select statements are called Quries in SQL


-- DQL -> Data Query Language
-- Select -> Acesses or read the data from a table
-- select statements are called Quries in SQL

-- DCL -> Data Control Language 
-- This is used to grant the level of access to the various users to access the database.
-- Commands
-- Grant
-- Revoke

-- TCL -> Transaction Control Language.
-- This is releted to transactions. there are the grouping of releated SQL statemenst to ensure that
-- they succeed or fail collectively.
-- Commands
-- Begin
-- Commit
-- Rollback
-- set

-- MYSQL Datatypes
-- a dataype is a constraint upon a column in table indicating that only that type of data
-- can be held in that column.
-- VARCHAR(size). -> it a set of characters(like string), we can limit the number of chatactors with size.
-- BOOL / BOOLEAN -> stored as a byte value, 0 -> false, any other value is true;
-- INT / INTEGER(size) -> A medium signed interger value -2147483648 to 2147483647.
-- FLOAT(size, decimal) -> size -> defines the max number of digits
-- -> decimal -> defined the number of digits that are after the decimal point.alter
-- ex: 34.56 -> FLOAT(4,2)
-- 467.2317 -> FLOAT(7, 4)
-- 467.12  
-- 43
-- 600.1
-- DOUBLE(size, decimal) -> it can take larger numbers then float.alter
-- TIMESTAMP -> specific moemnt in time -> format is yyy_mm_dd hh:mm:ss
-- single quotes needed -> char, varchar, dates, datetime, timestamp, time, blob, text.alter
-- Not need for -> int / float / double

-- NULL values represent missing unkown data
-- Null != 0
-- Null means empty value.
-- -----------------------------------------------------------------------------------
create database exampleDb;
use db2;
drop database exampleDb;
use db1;

create database db2;


create table employee(
id int,
firstName varchar(30),
lastName varchar(30),
phonenumber int(10),
email varchar(30),
address varchar(200),
city varchar(20)
);

create table employee2(
id int,
firstName varchar(30),
lastName varchar(30),
phonenumber int(10),
email varchar(30),
address varchar(200),
city varchar(20) 
);
show tables;           -- show tables in database.

drop table employee;   -- delete a table

alter table employee drop column city;   -- to delete a column 

alter table employee add city varchar(20);  -- to add the column

alter table employee rename column phonenumber to mobileNumber;  -- to rename a column 


alter table employee modify column address varchar(100) ;    -- modifys the column type


select * from employee;

insert into employee(id, firstName, lastName,mobileNumber,email,address) 
values(1,'jack','m', 123456789,'jack@gmail.com', 'sterling,Va');


insert into employee(id, firstName, lastName,mobileNumber,email) 
values(2,'jim','kk', 123456,'jim@gmail.com' ),
(3, 'roy','rr',456789, 'roy@email.com'),
(4, 'ana','aa',09809876, 'ana@email.com');

select * from employee;


-- SQL Constraints 
-- We use it to specify rules for the data in a table
-- NOT NULL -> ensures that a column can not have null values
-- UNIQUE -> ensures that a column can not have duplicate values
-- PRIMARY KEY - combination of NOT NULL and UNIQUE
-- FOREIGN KEY - prevents actions that would destroy links between tables
-- CHECK - Ensures that values in a column satisfies a specific condition
-- DEFAULT - it will set a default value for a column.
-- CREATE INDEX - use it to do indexing which will help us to retrive data from the database very quickly.

-- -----------------------------------------------------------------------------------------------------------------------

create table student(
id int primary key,
firstName varchar(25),
lastName varchar(30),
phonenumber int(10) unique,
email varchar(25) not null unique,
address varchar(200)
);


insert into student (id, firstName, lastName, phonenumber, email, address) 
values(2, 'min', 'mm', 123456789, 'min@email.com', 'MA');

insert into student (id, firstName, lastName, phonenumber, email) 
values(3, 'max', 'mx', 12345678, 'max@email.com');

insert into student (id, firstName, lastName, email) 
values(4, 'roy', 'rr', 'roy@email.com');

insert into student (id, firstName, email) 
values(5, 'kim', 'kim@email.com');


insert into student (id, firstName, lastName, phonenumber, email) 
values(7, 'ss', 'sony', 0987654, 'sony@email.com');

select * from student;



create table student2(
id int primary key,
firstName varchar(25),
lastName varchar(30),
phonenumber int(10) unique,
email varchar(25) not null unique,
address varchar(200)
);

alter table student2 modify column email varchar(25) unique;

insert into student2 (id, firstName, lastName, phonenumber, address) 
values(1, 'min', 'mm', 123456789, 'MA');
insert into student2 (id, firstName, lastName, phonenumber, address) 
values(2, 'max', 'mm', 12345789, 'MA');

alter table student2 drop primary key;

alter table student2 modify column id int primary key;

select * from student2;
truncate table student2;


insert into student2 (id, firstName, lastName, phonenumber, address, email) 
values(3, 'rocky', 'rrr', 123457, 'OH', 'rockey@email.com'),
(4, 'kim', 'kk', 98765, 'NY','kim@email.com'),
(5,'joy','jj',12356,'MI','joy@email.com');



create table binary_student(
id int primary key,
firstName varchar(25),
lastName varchar(30),
phonenumber int(10) unique,
email varchar(25) not null unique,
address varchar(200),
friend_ID int, 
foreign key(friend_ID) references student2(id)
);


insert into binary_student (id, firstName, lastName, phonenumber, address, email, friend_ID) 
values(1, 'sam', 'ss', 12345678, 'OH', 'sam@email.com', 2);

insert into binary_student (id, firstName, lastName, phonenumber, address, email, friend_ID) 
values(2, 'jack', 'j', 098765, 'VA', 'jack@email.com', 2);

insert into binary_student (id, firstName, lastName, phonenumber, address, email) 
values(3, 'jim', 'j', 987654, 'VA', 'jim@email.com');

select * from binary_student;


alter table binary_student rename column friend_ID to friend_ID_Fk;

create table teacher(
id int primary key,
name varchar(30),
email varchar(25)
);



alter table binary_student add column teacher_id int;
alter table binary_student add foreign key(teacher_id) references teacher(id);

insert into teacher(id, name, email)
values(1, 'jhon', 'jhon@email.com');

insert into binary_student (id, firstName, lastName, phonenumber, address, email, teacher_id) 
values(4, 'sara', 's', 9765, 'VA', 'sara@email.com', 1);


select * from binary_student;

select * from teacher;

-- Operators

-- = Equal
-- <> or != not eqaul
-- > Greather than
-- < Less than
-- >= Greather than or equal
-- <= Less than or equal
-- BETWEEN => between an inclusive range
-- LIKE => search for a pattern
-- IN => To specify multiple possible values for a column
-- AND
-- OR
-- NOT

-- -------------------------------------------------------------------------------

create table primary_school_students(
id int primary key,
firstname varchar(20), 
lastname varchar(20),
age int(2) check(age <=10),
city varchar(30) default 'VA'
);

insert into primary_school_students(id, firstname, lastname, age, city)
values (1, 'ana', 'aa', 10, 'MA');

insert into primary_school_students(id, firstname, lastname, age)
values (2, 'jack', 'jj', 5);

alter table primary_school_students add column course varchar(20);

alter table primary_school_students modify column course varchar(20) default 'MATH';


insert into primary_school_students(id, firstname, lastname, age)
values (3, 'jim', 'ji', 7);

select * from primary_school_students;

select id, firstname, course from primary_school_students;


select * from primary_school_students where age >=6;

select * from primary_school_students where city != 'VA';

select * from primary_school_students where age <=5 and city = 'VA';

select * from primary_school_students where not city = 'VA';

select * from primary_school_students where firstname like 'j%' ;

select * from primary_school_students where course is not null;


select * from primary_school_students order by age asc;

select * from primary_school_students order by id desc;

update primary_school_students set course = 'ENG' where id =1;

select * from primary_school_students;

update primary_school_students set course = 'ENG';
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

set SQL_SAFE_UPDATES =1;


insert into primary_school_students(id, firstname, lastname, age)
values (4, 'nat', 'nn', 3),
 (5, 'nat', 'nn', 3),
 (6, 'jimmy', 'jk', 3),
 (7, 'sara', 'ss', 3);

select * from primary_school_students order by id desc ;

select * from primary_school_students order by id desc limit 2;

select * from primary_school_students order by id desc limit 2, 3;

select * from primary_school_students order by id asc limit 3;


select * from primary_school_students where age between 3 and 5;

select * from primary_school_students where id between 3 and 5000;


insert into primary_school_students(id, firstname, lastname, age, city)
values (8, 'rose', 'rr', 4, 'OH'),
 (9, 'sim', 'ss', 6, 'NC'),
 (10, 'kim', 'kk', 9, 'DC'),
 (11, 'jam', 'ja', 4, 'NY');


select * from primary_school_students;

-- find from VA, NC, NY


select * from primary_school_students where city in ('VA', 'NC', 'NY'); 

-- find not from VA, NC, NY

select * from primary_school_students where city not in ('VA', 'NC', 'NY');

-- find ppl with age 4, 6, 8


select * from primary_school_students where age in (4,6,8);


-- order a ppl by age asc then order then by id desc

select * from primary_school_students order by age asc, id desc;


create table product(
id int primary key, 
name varchar(20),
price int, 
ratings float(3,2) -- 1.20, 3.45, 4.26
);


insert into product(id, name, price, ratings)
values (1, 'tv', 100, 4.20),
(2, 'remote', 20, 3.2),
(3, 'laptop', 200, 1.10),
(4, 'phone', 120, 4.65),
(5, 'box', 180, 2.86),
(6, 'tab', 99, 3.35),
(7, 'motor', 87, 3.35),
(8, 'cup', 3, 2.87),
(9, 'plate', 10, 4.56),
(10, 'pellow', 20, 3.56),
(11, 'cap', 50, 4.99),
(12, 'toy', 599, 1.86),
(13, 'car', 1000, 4.98);

select * from product;

select sum(price) as Total from product;

select avg(ratings) as avg_rating     from product;

select min(price) as Min_Price from product;

select max(price) as Max_Price from product;


insert into product(id, name, price, ratings)
values (14, 'tv', 100, 4.20),
(15, 'tv', 20, 3.2),
(16, 'tv', 200, 1.10);


select count(name) countofTv, sum(price) total, avg(ratings) avg_rating from product where name='tv';


 -- Multiplicity
 
 -- 1:1 -> one to one 
 
 -- 1:n or n:1 -> one to many or many to one
 
 -- n:n -> many to many
 
 -- join 
 
 -- INNER JOIN
 -- LEFT OUTER JOIN 
 -- RIGHT OUTER JOIN 
 -- FULL JOIN 
 -- SELF JOIN
 
 
create table customers(
id int primary key, 
fullname varchar(30) not null,
email varchar(35) not null unique
);
 
 
 create table orders(
 id int primary key, 
 total double(4,2) not null, 
 invoiceNo varchar(20) unique,
 orderDate date,
 customers_id int not null, 
 foreign key(customers_id) references customers(id)
 );

alter table orders modify column customers_id int;

insert into customers (id, fullname,email )
values(1, 'nat', 'nat@email.com'),
(2, 'ivan', 'ivan@email.com'),
(3, 'fredie', 'fredie@email.com'),
(4, 'yabetse', 'yabetse@email.com'),
(5, 'bppandy', 'bppandy@email.com'),
(6, 'hari', 'hari@email.com'),
(7, 'joseph', 'joseph@email.com'),
(8, 'amit', 'amit@email.com'),
(9, 'lutf', 'lutf@email.com'),
(10, 'abreha', 'abreha@email.com');

insert into customers (id, fullname,email )
values(11, 'kim', 'kim@email.com'),
(12, 'ana', 'ana@email.com'),
(13, 'joy', 'joy@email.com');
select * from customers;

insert into orders(id, total, invoiceNo, orderDate, customers_id)
values(1, 20.00, '123abc', '2024-04-23', 2),
(2, 30.00, '623abc', '2024-04-23', 3),
(3, 40.00, '1234abc', '2024-04-12', 1),
(4, 11.65, '12345abc', '2024-04-01', 5),
(5, 45.70 ,'123456abc', '2024-04-04', 4),
(6, 10.12, '234abc', '2024-04-06', 6),
(7, 26.85 ,'2345abc', '2024-04-15', 8),
(8, 85.10 ,'3345abc', '2024-04-21', 1),
(9, 99.99 ,'123abcd', '2024-04-16', 10),
(10, 65.00 ,'23abcd', '2024-04-16', 9),
(11, 34.25 ,'234abcd', '2024-04-15', 7),
(12, 18.16 ,'1234abcde', '2024-04-01', 1)
;

select * from orders;

insert into orders(id, total, invoiceNo, orderDate)
values(13, 27.00, '12367abc', '2024-04-23'),
(14, 33.35, '62323abc', '2024-04-23'),
(15, 45.56, '1234567abc', '2024-04-12');

select orders.*, customers.fullname,  customers.email from orders inner join customers on orders.customers_id = customers.id;

select o.*, c.fullname,  c.email from orders o inner join customers c on o.customers_id = c.id;

select o.id, total, invoiceNo, fullname,  email from orders o inner join customers c on o.customers_id = c.id;

select * from customers left outer join orders on orders.customers_id = customers.id;
select * from customers right outer join orders on orders.customers_id = customers.id;

-- Store DB
-- Employee - tables
-- customer - tables
-- Product - tables
-- Orders - tables

-- Union Operator 
-- This is sued to combine the result pf two or more quary statements 
-- same no of columns 
-- they should also have similar datatype
-- order of columns should be in same order 

create table members(
mid int primary key, 
mfullname varchar(30) not null,
memail varchar(35) not null unique
);

insert into members (mid, mfullname, memail )
values(1, 'nat1', 'nat@email.com'),
(2, 'ivan1', 'ivan@email.com'),
(3, 'fredie1', 'fredie@email.com'),
(4, 'yabetse1', 'yabetse@email.com'),
(5, 'bppandy1', 'bppandy@email.com'),
(6, 'hari1', 'hari@email.com'),
(7, 'joseph1', 'joseph@email.com'),
(8, 'amit1', 'amit@email.com'),
(9, 'lutf1', 'lutf@email.com'),
(10, 'abreha1', 'abreha@email.com');

select * from customers 
union
select * from members;

-- group by 
-- groups are rows that have same values into summary rows like sum/avg/count
-- group by is used to get the summary details.


select o.*, c.fullname,  c.email from orders o inner join customers c on o.customers_id = c.id;


select c.*, count(o.id) as order_count,  sum(o.total) as total_spendings from customers c 
inner join orders o on  o.customers_id = c.id 
group by c.id;

select c.*, count(o.id) as order_count,  sum(o.total) as total_spendings from customers c 
left outer join orders o on  o.customers_id = c.id 
group by c.id;


-- auto_increment 


create table people(
pid int primary key auto_increment, 
pfullname varchar(30) not null,
pemail varchar(35) not null unique
);
alter table people auto_increment = 1110;

insert into people ( pfullname, pemail )
values( 'nat', 'nat@email.com'),
( 'ivan', 'ivan@email.com'),
('fredie', 'fredie@email.com'),
('yabetse', 'yabetse@email.com'),
( 'bppandy', 'bppandy@email.com'),
( 'hari', 'hari@email.com'),
( 'joseph', 'joseph@email.com'),
( 'amit', 'amit@email.com'),
( 'lutf', 'lutf@email.com'),
( 'abreha', 'abreha@email.com');

select * from people;

delete from people where pid =1119;

insert into people ( pfullname, pemail )
values( 'nat2', 'nat2@email.com');


-- ACID
-- Transactions, the grouping of SQL statements so that they all succeed or fail together, requires
-- the adherence to 4 properties. These properties are remembered by the name ACID and are
-- common database terms.
-- • Atomicity – A transaction must fully succeed, and all changes are made or be fully rolled back
-- and no changes are made to the database.
-- • Consistency – Relationships in the database must be valid when a transaction finishes. You can
-- not have “orphaned reference” in FKs for instance. E.g. if I delete and address from the database
-- I have to delete all references to that address in the users table for the transaction to complete.
-- • Isolation – Transaction must run independently of each other. I.e. no transaction should be
-- dependent of another transaction’s completion in order to complete. How isolated transactions
-- are from each other is set by the database’s Transaction Level and will be determined based on
-- the sensitivity of data and the need for rapid, multithreaded transaction processing.
-- • Durability – Transactions when they commit should persist through catastrophic failure. E.g. a
-- system crash or power outage.


-- Data Normalization:
-- • Normalization is a tiered structure for designing databases to reduce redundancy of data
-- storage. This increases efficiency in the database.
-- • Each level of normalization is called a “normal form”. If no attempt at normalization is made, the
-- database is said to be in 0 Normal Form.
-- • There are 3 generally used normal forms in the real world. There are more beyond that that
-- have been defined; however, these are difficult to implement and rarely have much impact in a
-- real-world scenario and are therefore more academic.
-- • 1st Normal Form – Atomic Data (data values stored should be broken down in the smallest
-- amount of meaningful data possible) and Primary Keys.
-- • 2nd Normal Form – 1st NF plus no partial dependencies. You can achieve this by having single
-- column PKs. A partial dependency is a value that can be determined by only accessing one
-- column in the PKs information.
-- • 3rd Normal Form – 2nd NF plus no transitive dependencies. A transitive dependency is when one
-- value can be fully determined by another value in the same record that is not the primary. If
-- that is the case then the value should be moved to another table the determinating value should
-- be made a foreign key to that other table.

