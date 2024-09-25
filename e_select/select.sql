###select###

/*
	select: 선택하다
    
    cf) 데이터베이스는 '어떻게'보다 '무엇을' 가지고 오는지가 중요
		> select는 '무엇을' 선택할지 결정하는 키워드
        
        - select문의 기본 구조(작성 순서)
        1. select 컬럼명(열 목록): 원하는 컬럼(열)을 지정
        2. from 테이블명 : 어떤 데이블에서 데이터를 가져올 지 결졍
        3. where 조건: 특정 조건에 맞는 데이터만 선택
        4. group by 그룹화 할 컬럼명: 특정 열을 기준으로 그룹화
        5. having 그룹 조건: 그룹화 한 이후의 조건을 지정
        6. order by 정렬 컬럼명 : 결과를 특정 컬럼의 순서로 정렬
        7. limit 컬럼 수 제한 : 반환할 컬럼(행)의 수를 제한
        
        cf) 데이터 베이스 내부 처리 순서 
        : select문 처리 순서
        
        from > join > where > group by > having > select > order by > limit
*/
use `korea_db`;

# 1. 기본 조회
# : select 칼람먕 from 데이터베이스명.테이블명;

select name from korea_db.members;
# : 정렬을 하지 않을 경우 데이터 입력 순서대로 출력

# cf) 전체 컬럼 조회
# : 컬럼명 작성에 * (전체 선택)을 사용하여 조회
select * from korea_db.members;

#cf) 2개 이상의 여러 커럼을 조회하는 경우, (콤마)로 구분하여 나열
select member_id, name, gender
from korea_db. members;

# allias(별칭) 부여 조회
# : 열 이름을 별칭으로 조회할 때 사용
# : 생략 시 테이블 생성 시 지정했던 컬럼명으로 지정
# >> 열 이름에 공백이 있을 경우 문자역을 나타내는 따옴표로 묶어야한다.

select `member_id` '멤버아이디', `name` as '이름' -- as 키워드는 생략 가능
from korea_db.members;

#### 2. 특정 조건을 부합하는 데이터 조회 ###
# : select A from B where C

select member_Id,  name, points
from members
where points > 200;

# where 조건절 사용 시 주로 사용되는 연산자 #
# 1) 관계연자
# : 이상, 이하, 초과, 미만, 일치(=), 불일치(!=)

select member_Id,  name, points
from members
where name != 'Minji';

# 2) 논리연산자 
# : 여러 조건을 조합하여 데이터를 조회

# and, or, not 등

# and: 모든 조건이 참
select * from members
where 
	area_code = 'Busan' and grade = 'Silver';
# or: 조건 중 하나라도 참
select * from members
where 
	area_code= 'Busan' or area_code ='Seoul';

# not : 조건이 거짓일 (결과를 반대)
select * from `members`
where not grade = 'bronze';
    
#cf) null 값을 확인하는 경우는연사자 사용일 불가
-- select * from members
-- where
-- 	points = null;

# : null이 '값이 없음'을 나태내기 때문에 그 어떤 값도 비교 할수 있다.
# >> null 여부 확인은 가능

# is null, is not null
# A is null
# : A가 null

select * from members
where 
	points is null;
    
# between A and B
# : A와 B 사이에

select * from members
where
	points between 200 and 400; 
# : 주로 숫자형 데이터에 사용

# in 연산자
# : 지정된 범위의 문자 데이터를 나열
# : 지정된 리스트 중 하나의 일치하면 참
select * from members
where area_code in('seoal', 'busan', 'jeju');

# >> 문자열 데이터에 대한 or식의 간소화

# like 연산자
# : 문자열이 일부를 검색

# cf) 와일드 카드 문자
# : _(언더스코어), %(퍼센트)

# % : 무엇이든 허용(0개의 이상의 임의의 문자를 나타냄)
# _ : 한 글자만 허용(정확히 하나의 임의의 문자를 나타냄)

select * from members
where 
	name like 'J___';
    
select * from members
where 
	name like '%un%';
    
# 이름이 두 번째 글자가 u인 모든회원 조회

select * from members
where 
	name like '_u%';
    
# 이름이 네글자인 모든 회원 조회
select * from members
where 
	name like '____';
    
# 날짜, 시간 조회
# date: 'YYYY-MM-DD'
# time: 'HH:MM:SS'

select * from members
where
	join_date = '2022-01-02';
    
#cf) 특정시간 기준 드 이후의 데이터 조회
# 칼럼명 > 특정시간
select * from members
where
	join_date > '2022-01-02';

#cf) 특정 시간 사이의 데이터 조회
#between 키워드 사용
select * from members
where 
	join_date between '2023-01-01' and '2024-01-30';

#연도 일치: year(컬럼명)
#월 일치: month(컬럼명)
#일 일치: day

select * from members
where
	year(join_date) = '2024';
    
# 시간 일치
# curdate();
# now()
select * from members
where
	join_date < curdate();




