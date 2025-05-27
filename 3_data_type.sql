-- tinyint : 1바이트 정수 타입 / -128 ~ 127까지 표현(unsigned)
-- author테이블에 age컬럼 변경
alter table author modify column age tinyint unsigned;
insert into author(id, email, age) values(6, 'abc@naver.com', 300);

-- int : 4바이트 정수 타입

-- bigint : 4바이트 정수 타입
-- author, post 테이블의 id값, author_id값 bigint 변경

-- 실수
-- decimal(총 자리수, 소수부 자리수)
alter table post add column price decimal(10,3);
-- decimal 소수점 초과 시 짤림 현상 발생
insert into post(id, title, price, author_id) values(7, 'hello python', 10.33412, 1);

-- 문자
-- 문자 타입: 고정길이(char), 가변길이(varchar, text)
alter table author add column gender char(10);
alter table author add column self_introduction text;

-- blob(바이너리 데이터) 타입 실습
-- 일반적으로 blob을 저장하기 보다는 varchar로 설계하고 이미지 경로를 저장장
alter table author add column profile_image longblob;
insert into author(id, email, profile_image) values(8, 'aaa@naver.com', LOAD_FILE('C:\\test.jpg'));

-- enum : 삽입될 수 있는 데이터의 종류를 한정하는 데이터 타입
-- role 컬럼 추가

alter table author add column role enum('admin', 'user') not null default 'user';
-- enum에 지정된 값이 아닌경우
insert into author(id, email, role) values(10, 'sss@naver.com', 'admin2');
-- role을 지정 안 한 경우
insert into author(id, email) values(11, 'dds@naver.com');
-- enum에 지정된 값인 경우
insert into author(id, email, role) values(12, 'sffs@naver.com', 'admin');









