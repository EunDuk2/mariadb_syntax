-- read uncommited : 커밋되지 않은 데이터 read 가능
-- => dirty read 문제 발생
-- 실습 절차
-- 1) 워크벤치에서 auto_commit 해제, update후 commit 하지 않음. (tran 1)
-- 2) 터미널을 열어 select했을 때 위 변경사항이 읽히는지 확인. (tran 2)
-- 결론 : mariadb는 기본이 repeatable read이므로 dirty read 발생하지 않음.


-- read commited : 커밋한 데이터만 read 가능
-- => phantom read 발생(또는 non-repeatable read)
-- 한 트랜잭션에서 중간에 Insert가 들어오면 처음 읽었던 데이터와 다른 데이터가 읽힘
-- 실습 절차
-- 워크 벤치에서 실행
start transaction;
select count(*) from author;
do sleep(15); --> 다른 트랜잭션에서 insert
select count(*) from author;
commit;
-- 터미널에서 실행
insert into author(email) values("xxxxxx@naver.com");
-- 한 트랜잭션에서는 count가 유지 됐다.


-- repeatable read : phantom read 해결 / 읽기의 일관성 보장한다.
-- lost update 문제 발생 -> 베타적 잠금으로 해결
-- insert VS update
-- lost update 문제 발생
DELIMITER //
create procedure concurrent_test1()
begin
    declare count int;
    start transaction;
    insert into post(title, author_id) values('hello world', 1);
    select post_count into count from author where id=1;
    do sleep(15);

    update author set post_count=count+1 where id=1;
    
    commit;

end //
DELIMITER ;

-- 터미널에서는 아래코드 실행
select post_count from author where id=1;

-- lost updqte 문제 해결 : select for update시에 트랙잭션이 종류후에 특정
-- 행에 대한 lock 풀림
DELIMITER //
create procedure concurrent_test2()
begin
    declare count int;
    start transaction;
    insert into post(title, author_id) values('hello world', 1);
    select post_count into count from author where id=1 for update;
    do sleep(15);

    update author set post_count=count+1 where id=1;
    
    commit;

end //
DELIMITER ;

-- 터미널에서는 아래코드 실행
select post_count from author where id=1 for update;

-- serializable : 모든 트랜잭션 순차적 실행 -> 동시성 문제없음 / 성능 저하
