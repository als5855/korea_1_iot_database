drop database moaDatabase;

create database moaDatabase;
use moaDatabase;

## 유저 테이블
create table users(
	user_Id varchar(14) null,
    user_password varchar(16) not null,
    user_birthday date not null,
    user_gender ENUM('남', '여') not null, 
    user_name varchar(20) not null,
    user_nickname varchar(20) not null,
    password_question varchar(100) not null,
    password_answer varchar(100) not null,
    category_id int,
    region_id int,
    user_img varchar(100)
);

create table caterories(
	category_id int,  -- 카테고리 id, 자동 증가
    category_name varchar(100) NOT NULL    
);
Create table regions (
    region_id int auto_increment primary key,  -- 지역 id, 자동 증가
    region_name varchar(100) not null -- 지역 이름 (예: 서울, 부산 등)
);

## 모임
create table gathering (
	gathering_id int auto_increment primary key,
    gathering_title varchar(100) not null,
    gatehr_content varchar(500) not null,
    onoff enum('온라인', '오프라인') not null,
    region varchar(50) not null,
    user_id varchar(14),
    gathering_img varchar(100),
    gathering_need varchar(100)
);

## 좋아요
create table likes(
	gathering_id int,
	user_id varchar(14)
);

create table userList (
	gathering_id int,
	user_id varchar(14),
    user_class enum('관리자', '일반')
);

## 후기 
create table reviews (
	gathering_id int auto_increment primary key,
    user_id varchar(14) not null,
    gathering_title varchar(100) not null,
    review_content varchar(400) not null,
    review_date timestamp default current_timestamp,
    review_image varchar(100)
);

create table vote (
	vote_id int auto_increment primary key,
    gathering_id int,
    user_id varchar(14), 
    user_class enum('관리자', '일반'),
    vote_title varchar(50),
    
    option_1 varchar(255) not null,             
    option_2 varchar(255) not null,              
    option_3 varchar(255) not null,              
    option_4 varchar(255) not null,
    
    vote_1 int default 0,
    vote_2 int default 0,
    vote_3 int default 0,
    vote_4 int default 0,
    
    vote_date timestamp default current_timestamp
);

## 신고테이블

create table declaration (
	declaration_id varchar(14),
	gathering_id int,
    user_id varchar(14), 
    evil_id varchar(14),
	declaration_content varchar(400),
    declaration_catergory varchar(50),
    declaration_date timestamp default current_timestamp,
    
    declaration_image varchar(100)
);

## 참여율 성비 차트 
create table participation (
	gathering_id int,
    user_id varchar(14),
    participation_date timestamp default current_timestamp
);

## 차단 유저 테이블
create table block (
	gathering_id int,
    user_id varchar(14)
);

create table search (
    user_id varchar(14)
);




