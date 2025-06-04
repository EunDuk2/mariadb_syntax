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


-- date / datetime
-- 날짜 타입의 입력, 수정, 조회시에 문자열 형식을 사용
alter table author add column birthday date;
alter table post add column created_time datetime;
insert into post(id, title, author_id, created_time) values(10, 'hello', 3, '2025-05-23 14:36:30');
alter table post add column created_time datetime default current_timestamp();

-- 비교연산자
select * from author where id>=2 and id<=4;
select * from author where id between 2 and 4; -- 위 구문과 같은 구문
select * from author where id in(2, 3, 4);

-- like : 특정 문자를 포함하는 데이터를 조회하기 위한 키워드
select * from post where title like 'h%';
select * from post where title like '%h%';
select * from post where title like '%h';

-- regexp : 정규 표현식을 활용한 조회
-- 하나라도 알파벳 소문자가 들어 있는지
select * from post where title regexp '[a-z]';
-- 하나라도 한글이 있는지
select * from post where title regexp '[가-힣]'; 


-- 숫자 -> 날짜
select cast(20250523 as date) (from author); --> 2025-05-23
-- 문자 -> 날짜
select cast('20250523' as date); --> 2025-05-23
-- 문자 -> 숫자
select cast('12' as int); --> 버전에 따라 지원 유무 다름
select cast('12' as unsigned); --> 12

-- 날짜조회 방법
-- like패턴, 부등호 활용, datet_format
select * from post where created_time like '2025-05%'; -- 문자열처럼 조회
-- 5월 1일부터 5월 20일까지, 날짜만 입력 시 시간 부분은 00:00:00이 자동으로 붙음
select * from post where created_time >= '2025-05-01' and created_time < '2025-05-21';

select date_format(created_time, '%Y-%m-%d') from post;
select date_format(created_time, '%H-%i-%s') from post;
select * from post where date_format(created_time, '%m')='05';

-- date_format을 통째로 캐스팅 '문자' -> 숫자
select * from post where cast(date_format(created_time, '%m') as unsigned)=5;