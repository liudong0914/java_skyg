create database library3;

create table student
(
  StuNO int primary key,
  StuName varchar(50),
  StuAge int,
  StuSex varchar(50),
  Class varchar(50),
  Department varchar(50),
  Tel char(11), 
  Password varchar(20),
  Permitted varchar(50)
 
);
create table book
(
   BookNO int primary key,
   BookName varchar(50),
   Author varchar(50),
   Publishment varchar(50),
   BuyTime varchar(50),
   Borrowed varchar(50),
   Ordered varchar(50)
);
create table manager
(
   mgNo int primary key,
   mgName varchar(50),
   mgTel char(11), 
   permitted varchar(50),
   password varchar(50)
);
create table borrowlist
(
   BookNO int,
   StuNO int,
   BorrowTime varchar(50),
   ReturnTime varchar(50),
   BackTime varchar(50),
   Exceeded varchar(50),
   Renew varchar(50)
);

create table orderlist
(
   BookNO int primary key,
   BookName varchar(50),
   StuNO int,
   StuName varchar(50)
);
create table loselist
(
   LBNO int primary key,
   StuNO int,
   BookNO int,
   BookName varchar(50)
);

create table overdue
(
   StuNO int,
   BookNO int,
   BookName varchar(50),
   OverTime int,
   primary key(StuNO,BookName)
);

insert into manager values(10001,"³¿³¿",'65762','1','10001');

