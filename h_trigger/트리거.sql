
use baseball_legue;

select * from players;
select * from teams;


create table player_insert_logs (
	log_id int auto_increment primary key,
    team_id int,
    log_msg varchar(255),
    log_time datetime
);

drop trigger if exists after_player_insert;

delimiter $$
create trigger after_player_insert
	after insert
    on players
    for each row
begin
	insert into player_insert_logs (team_id, log_msg, log_time)
    values
		(new.team_id, concat('team', new.team_id), now());
end $$

##OLD: update, delte 시 변경 사항이 임시로 저장되는 테이블
# NEW: insert, update, delete 방금 삽입 또는 갱신된 행을 참조

delimiter ;

select * from player_insert_logs;

insert into players
values 
	(106, 'Lee Jun', '타자', '2000-01-01', 1),
	(180, 'Lee Jun', '타자', '2000-01-01', 1),
	(111, 'Lee Jun', '타자', '2000-01-01', 1);

select * from player_insert_logs;


    
