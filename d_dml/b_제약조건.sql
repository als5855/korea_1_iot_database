###제약조건###

#제약조건 (constraint)
# 1.제약조건 개념
# : 데이터의 정확성, 일관성, 신뢰성, 무결성을 유지하기 위해 dDB 시스템에 의해 강제되는 규칙

# 2. 제약조건 사용 목적
# : 데이터 무결성 보장
# : 오류방지
# : 관계유지 - 테이블 간에 정의된 곤계가 지속적으로 유지
# : 응용 프로그램 수준에서의 복잡성 감소

# 3. 제약조건의 종류
# : Primary Key (기본 키)
# : Foriegn Key (외래 키)
# : UNIQUE (유니크)
# : CHECK (체크)
# : NOT NULL (널 아님)
# : DEFAULT (기본값)

/*
	1.PK, Primary Key (기본 키)
    : 테이블 각 행을 고유하게 식별하는 열
    : 테이블 레코드(행)를 고유하게 구분할 수 있는 식별자 역할
	
    - 고유성: 중복 될 수 X
    - NOT NULL : null 값이 될 수 없다, 반드시 유효한 데이터를 포함
    - 유일성 제약: 
		: 하나의 테이블 당 하나의 기본 키만 지정 가능
        >> 테이블의 특성을 가장 잘 반영한 열 선택을 권장
        EX) members - member_id
			posts - post_id
            books - isbn
*/

# drop database example;
create database `example`;

use `example`;

# 기본키 지정 방법
# 테이블 생성시 
# : 컬럼명 데이터타입 Primary Key(제약조건)
create table `Students` (
	student_id int primary key,
    name varchar(100),
    major varchar(100)
);

# 2) 제일 마지막 부분에 제약 조건 작성
-- create table `students`(
-- 	student_id int,
--     name varchar(100),
-- 	major varchar(100),
-- 	primary key (student_id)
-- );

desc `Students`;

insert into `Students`
values (1, '장지민', 'A전공'),
		(2, '이민진', 'A전공'),
		(3, '장지민', 'B전공');
        
insert into `Stuedents`
value (1, '김다혜', 'C전공');


# 제약조건에 대한 수정 (alter)
# 1) 제약조건 삭제
alter table `Students` 
drop primary key;


# cf) 기본 키 제약 조건 삭제 시 not null에 대한 조건은 사라지지 않음

# 2) 제약조건 추가
alter table `Students`
add primary key (student_id);
desc `Students`; 

/*
	2. FK, Foreign Key (외래 키)
    : 두 테이블 사이의 관계를 연계를, 데이터의 무결성을 유지
    : 외래 키가 설정된 열은 반드시 다른 테이블의 기본 키와 연결!
    
    일관성을 유지 
*/
# 기본 테이블 : 기본 키가 있는 테이블 (회원 테이블)
# 참조 테이블 : 외래 키가 있는 테이블 (구매 테이블)

# 외래 키 사용 예시 
# : 회원 (members) - 주문 (Orders)
# >> 고객이 실제로 존재하는 
create table `members1` (
	member_id int primary key,
    name varchar(100)
);

create table `orders` (
	order_id int primary key,
    order_date date,
    member_id int,
    # 외래 키 지정 방식
    # foreign key (참조컬럼) reference 기본테이블( 기본컬럼)
    foreign key (member_id) references `members1`(member_id)
);

-- 유효하지 않은 고객 참조 시도 (요류)
insert into orders
values (1, '2024-09-24', 123);

insert into members1
value (1, '이지윤');

insert into orderorderss
value (1, '2024-09-24', 1);

#왜래키 제약조건 삭제 & 추가 
# : 왜래키 제약조건 삭제 시 주의 점
# >> 해당 데이터를 참조하는 데이터가 있을 경우 삭제할 수 없음

select constraint_name
from information_schema.key_column_usage
where table_name = 'orders' and column_name = 'member_id';

alter table `orders`
drop foreign key `orders_ibfk_1`;

-- alter table `orders`
-- drop foreign key `외래키_제약조건이 이름;
# >> 외래키 제약조건 삭제 시 제약조건의 이름 을 검색하여 작성
# cf) truncate: 테이블의 모든 행을 삭제
truncate table `orders`;

alter table `orders`
add constraint
	foreign key (member_id)
    references members1(meber_id);

desc orders;
desc members1;

/*
	3.UNIQUE
    : 특정 열에 대해 모든 값이 고유해야 함을 보장
	: 한 테이블 내에서 여러개 지정 가능(각각 다른 컬럼에 독립적으로 적용)
    : NULL값 허용
    
    cf) PK와의 차이
    >> 여러 칼럼에 사용 가능 & NULL 값 허용
*/

create table users (
	user_id int primary key,
    user_name varchar(100),
    ueser_email varchar(100) unique
);

insert into `users`
values
	(1, '이미진', 'aldlwl'),
	(2, '이미진', 'aldlwl');



