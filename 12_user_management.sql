-- 사용자 관리
-- 사용자 목록 관리
select * from mysql.user; -- (스키마.사용자들)

-- 사용자 생성 (localhost는 못들어감 / docker에서)
create user 'bradkim197'@'%' identified by '4321';

-- 사용자에게 권한부여
grant select on board.author to 'bradkim197'@'%';
grant select, insert on board.* to 'bradkim197'@'%';
grant all privileges on board.* to 'bradkim197'@'%';

-- 사용자 권한 회수
revoke select on board.author from 'bradkim197'@'%';
-- 사용자 권한 조회
show grants from 'bradkim197'@'%';
-- 사용자 계정 삭제
drop user 'bradkim197'@'%';


