

#트리거(trigger)


#insert, update, delete (DML, 데이터 조작 언어)작업이 발생하면 실행되는 코드
#: 이벤트가 발생할 때 작동

# 트리거 종류
# after 트리거*, before

# 트리거 문법 체계(기본 형식)
# : 스토어포드 프로시저와 유사
# cf) 차이점: call 문으로 직접 실행 
# 무조건 테이블에서 insert, update, delete 등의 이벤트가 발생하는 경우에만 자동 실행

use market_db;



create table if not exists trigger_table (
	id int,
    txt varchar(10)
);

delimiter $$
insert into trigger_table
values
	(1, '레드벨벳'),
	(2, '레드벨벳'),
	(3, '레드벨벳');
    
select * from trigger_table;

drop trigger if exists myTrigger;
create trigger myTrigger
	
    after delete -- delete문이 발생된 이후에 작동
	on trigger_table
    for each row -- 각 행마다 적용시킴
begin 
	set @msg = '가수 그룹이 삭제됨';
end $$

delimiter ;

set @msg = '';
select @msg;

insert into trigger_table values (4, '마마무');
select @msg;

update trigger_table set txt = '블핑' where id = 3;
select @msg;

select * from trigger_table;
select @msg;

delete from trigger_table
where id = 4;
select @msg;