### DDL 문법정리 ===
# Creat,alter, drop;truncate

-- 데이터베이스 --
# 1. creat: 데이터, 데이터를 저장하고 관리하느 첫 단계
# 기본 형태

create database example;

# --테이블 생성--
# create : 데이블 생성 테이블에 저장될 데이터의 형태와 특성을 정의
# 기본 형태
# create tabel `데이터베이스`.`테이블명` (
	# 컬럼1 데이터타입 (선택적 옵션),
    # 컬럼2 데이터타입 (선택적 옵션),
    # 컬럼3 데이터타입 (선택적 옵션),
    #...
# );student3
create table `example`.`students` (
	student_id int,
    student_name char(8),
    student_gender char(8)
); 

create table `example`.`students2` (
	student_id int,
    student_name char(8),
    student_gender char(8)
) 
default character set = utf8;
-- 테이블 삭제
# drop 키어드 생성
drop table `example`, `students2`;
drop database example2;