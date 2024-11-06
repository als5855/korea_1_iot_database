

# 동적 SQL
# : 상황에 따라 내용 변겨이 필요한 경우 사요하는 기능

# prepare & execute
# prepare : SQL문을 실행하지 않고 미리 준비
# execute : 준비한 SQL문을 실행
# +) deallocate prepare: 문장을 해제 - 메모리를 효출적으로 사용

use market_db;

# prepare 쿼리문명
# 	from '쿼리문 내용';

-- from 
		
        



prepare myQuery
	from '
		select * from member
        where
			mem_id = "BLK";
    ';
    
    execute myQuery;
	deallocate prepare myQuery;
    
# 동적 SQL문의 활용
# : 보안이 필요한 출입문에서 출입한 내역을 자동으로 기록
# > 어떠한 DB 변동사항에 대해 반응하는 동작을 정의

drop table if exists gate_table;
create table gate_table(
	id int auto_increment primary key,
    entry_time datetime
);

#curren_timestamp(): now() 동일
set @curDate = current_time();

prepare myQuery
	from 'insert into gate_table values(null, ?)';
    
execute myQuery using @curDate;
# deallocate prepare myQuery;

select * from gate_table;
    
    