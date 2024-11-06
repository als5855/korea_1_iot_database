use market_db;

select * from member;
select * from buy;

# 1. 변수 
# : 데이터를 담는 그릇, 데이터를 저장하기 위한 저장 공간

-- 변수 선언 규칙
# set @변수이름 = 변수의 값;

-- 변수 값 출력
# select @변수이름;

-- SQL 변수의 특징
# : MySQL 워크벤치 시작 시 유지되지만, 종료할 경우 사라짐 (임시 저장 공간)

-- SQL 변수 사용 예제 --
set @myVar1  = 5;
set @myVar2 = 4.25;

select @myVar1; -- SQL은 비절차적 언어이기 때문에 원하는 구문을 따로 실행 가능
select @myVar1 + @myVar2;

# 테이블을 조회하면 변수 사용
set @txt = '가수이름: ';
set @height =166;

select
	@txt, mem_name
from 
	member
where
	height > @height;
    
#limit 키워드에 변수 사용x
#cf) limit
	#: 반환하는 행을 제한

#prepare, execute 사용한 변수 사용
#prepare: sql문은 실행하지 않고 준비
# cf)

# excute: 해당 키워드를 만나야 prepare 코드가 실행
set @count = 3;

prepare mySQL
    from 'selet mem_name, height
			from `member`
            order by `height`
            limit ?';
execute mySQL using @count;
# 코드블록을 준비시키고 실행 시 변수값을 사용하는 경우
# limit문에도 변수 사용이 가능

# prepare 코드블록명;
# from '실행할 코드블록1';

# execute 코드블록명 using 사용할 변수;

# g_programming 폴더 > a_변수 파일
