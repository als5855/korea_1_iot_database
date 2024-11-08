# now(), sysdate(), current_timestamp();

select now()
		,sysdate()
		, current_timestamp;

# now() : 서버의 시간을 가져오는 함수
# sysdate(): 호출되는 시점을 반환
# current_timestamp: now()와 동일alter

# 차이점alter
-- now(


select now()
		, sysdate()
		, current_timestamp
        , sleep(5) -- 시간을 지연시키는 함수 (5초 지연)
		, now()
		, sysdate() --  값이 호출되는 시점이 반환! (혼자 다름)
		, current_timestamp;
        

