#스코어드　프로시저　예제

use baseball_legue;

# 1. 변수 사용
# : 팀 ID를 변수에 저장, 저장된 팀 ID를 사용하여 선수 조회

set @team_id = 1; -- 변수는 실행해야 임시 공간에 저장

select * from players
where
	team_id = @team_id;
# 2. 스토어드 프로시저  
drop procedure if exists CheckPosition;

delimiter $$


create procedure CheckPosition(in p_player_id int)
begin
	#
    #
	declare v_player_position varchar(100);
    
    
	select 
		# 매개변수의 값에 해당하는 선수의 포지션을 가져옴
        # A into B 
        # : A를 B에 넣는다.
        position into v_player_position
    from players
    where player_id = p_player_id;
    
    if v_player_position = '타자' then
		select '해당 선수는 타자입니다.';
	else 
    select '해당 선수는 타자 아닙니다.';
    end if;
    
	end $$
    
    # 구분 문자 변경
    delimiter ;
    
    call CheckPosition(101);
    call CheckPosition(105);
    call CheckPosition(107); -- 타자가 아닙니다.
    call CheckPosition(110); -- 타자가 아닙니다.
    
    select * from players; 
    
    
    