-- 흐름제어 : case when, if, ifnull

-- if(a, b, c) : a 조건이 참이면 b 반환, 그렇지 않으면 c를 반환
select id, if(name is null, '익명사용자', name) from author;

-- ifnull(a, b) : a가 null이면 b를 반환, null이 아니면 a 를 그대로 반환
select id, ifnull(name, '익명사용자') from author;

case
    when name is null then '익명사용자'
    when name='eunduk' then '조은성'
    else name
end as name
from author;







