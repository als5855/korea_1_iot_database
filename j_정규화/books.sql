create database springboot_db;
use springboot_db;

create table book (
	id bigint primary key auto_increment,
    writer varchar(100),
    title varchar(150),
    content varchar(550),
    category enum ("NOTICE", "FREE", "QNA", "EVENT")
);

create table board (
	id bigint auto_increment primary key,
    writer varchar(100)not null,
    title varchar(100)not null,
    content varchar(100)not null,
    category enum ("NOTICE", "FREE", "QNA", "EVENT") not null
);

select * from board;
select * from book;

insert into board (writer, title, content, category)
values 
	("장지민", "자바공부하기", "지금 잘 잡아야함", "NOTICE"),
	("이지윤", "SQL공부하기", "이제부터 잘 해야함", "FREE"),
	("이민지", "SPRING공부하기", "자바하면서 같이 공부", "QNA"),
	("이유진", "이벤트진행중", "10월 한 달간 이벤트 진행", "EVENT");



