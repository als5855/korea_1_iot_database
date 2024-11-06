create database korea_iot;

use korea_iot;

create table user (
	id int auto_increment primary key,
    name varchar(50),
    email varchar(50)
);

insert into user (name, email)
values
	('장지민', 'wlals585@naver.com');
    
    select * from user;