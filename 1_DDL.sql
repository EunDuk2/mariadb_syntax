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



