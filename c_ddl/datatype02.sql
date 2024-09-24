###datatype02###

# 날짜형, 열거형 데이터 타입

/*
	5. 날짜형
    : 날짜 및 시간을 저장할 때 사용
    
    a) date (3type)
    : 날짜만 저장 / YYYY-MM--DD 형식
    Ex) 기념일, 생일 등
    
    b) time(3byte)
    : 시간만 저장 / HH:MM:SS
    
    c) datetime (8byte)
    : 날짜와 시간을 저장 / YYYY-MM--DD HH:MM:SS 형식
    Ex
*/
create table events (
	event_name varchar(100),
    event_date DATE
);
insert into events
values ('birthday', '2024-03-14');

select * from events;

/*
	6. 열거형 타입(enum)
    : 사전에 정의된 값의 집합 중 하나의 값을 저장
    >> 제한된 값 목록 중에서 선택
*/
drop table rainbow;
create table rainbow (
	color enum('red', 'yellow', 'orange', 'green'),
    descriptions varchar(100)
);

insert into rainbow
values 
	('red', '빨강'),
	('orange', '주황'),
	('yellow', '노랑'),
	('green', '초록');
#	('green그린', '초록'); # 첫번째 인덱스는 위에 해당하는 값이 들어가야만 실행 된다. 

