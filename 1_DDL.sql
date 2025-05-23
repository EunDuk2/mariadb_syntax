-- mariadb 서버에 접속
mariardb -u root -p -- 입력 후 비밀번호 별도 입력

-- 스키마(database) 생성
create database board;

-- 스키마 삭제
drop database board;

-- 스키마 목록 조회
show databases;

-- 스키마 선택
use 스키마명;

-- 문자 인코딩 변경
alter database board default character set = utf8mb4

-- 문자 인코딩 조회
show variables like 'character_set_server';

-- 테이블 생성
create table author(id int primary key, name varchar(255), email varchar(255), password varchar(255));

-- 테이블 목록 조회
show tables;

-- 테이블 컬럼 정보 조회
describe author;

-- 테이블 생성명령문 조회
show create table author;

-- posts 테이블 신규 생성(id, title, contents, author_id)
create table posts(id int, title varchar(255), contents varchar(255), author_id int not null, primary key(id), foreign key(author_id) references author(id));

-- 테이블 제약 조건 조회 (시스템 스키마 및 테이블 접근)
select * from _schema.key_column_usage where table table_name='posts';

-- 테이블 index 조회
show index from author;

-- alter : 테이블의 구조를 변경
-- 테이블의 이름 변경
alter table posts rename post;
-- 테이블의 컬럼 추가
alter table author add column age int;
-- 테이블 컬럼 삭제
alter table author drop column age;
-- 테이블 컬럼명 변경
alter table post change column contents content varchar(255);
-- 테이블 컬럼의 타입과 제약조건 변경 => 덮어쓰기(원래 제약조건 적용해줘야 함)
alter table author modify column email varchar(100) not null;
alter table author modify column email varchar(100) not null unique;

-- 실습 : author 테이블에 address컬럼을 추가 (varchar255)
alter table author add column address varchar(255);
-- 실습 : post 테이블에 title은 not null로 변경, content는 길이 3000자로 변경
alter table post modify column title varchar(3000) not null;
-- => 2개 한 번에
alter table post modify column title varchar(255), modify column content varchar(3000) not null;

-- drop : 테이블을 삭제하는 명령어
drop table abc;
-- 없으면 삭제 (없어도 오류 안 남 / 중간에 오류나면 다음 코드 실행 안 됨)
drop table if exists abc;










