use springboot_db;

create table if not exists users(
	id bigint primary key auto_increment,
    email varchar(250) unique not null,
    password varchar(250) not null,
    created_at datetime not null,
    updated_at datetime 
);

drop table users;


select * from users;


