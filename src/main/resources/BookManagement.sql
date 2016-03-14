/*Online Book Management System Mysql Schema */
DROP DATABASE IF EXISTS BookManagementDB;
CREATE DATABASE BookManagementDB;
USE BookManagementDB;

DROP TABLE IF EXISTS `UserEntity`;
create table `UserEntity`(
`id` int not null AUTO_INCREMENT,
`username` varchar(12) not null,
`password` varchar(64) not null,
`usertype` varchar(20),
`name` varchar(30),
`mobilenumber` varchar(15),
`gender` varchar(15),
`emailId` varchar(30),
createdDate dateTime,
modifiedDate dateTime,
PRIMARY KEY(`username`),
unique key(`id`)
);
insert into UserEntity(username,password,usertype,name,mobilenumber,gender,emailId,createdDate,modifiedDate)values('admin','admin','admin',
'rajesh','9535184724','male','rajeshsavi123@gmail.com',now(),now());

DROP TABLE IF EXISTS `BooksEntity`;
create table `BooksEntity`(
`id` int not null AUTO_INCREMENT,
`bookId` varchar(30),
`bookname` varchar(60),
`category` varchar(60),
`author` varchar(60),
`price` double,
`publishedDate` varchar(20),
`numberOfbooks` int,
createdDate dateTime,
modifiedDate dateTime,
PRIMARY KEY(`bookId`),
unique key(`id`)
);

create table `BookOrderEntity`(
`id` int not null AUTO_INCREMENT,
`bookId` varchar(30),
`bookname` varchar(60),
`price` double,
`quantity` int,
`totalAmount` double,
`address` varchar(30),
`paymentMode` varchar(32),
`createdDate` datetime,
modifiedDate datetime,
 PRIMARY KEY(`id`)
);

alter table BookOrderEntity add column userName varchar(32);
