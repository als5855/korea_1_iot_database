
## 1. case문 활용

# 총 구매액
# 1500 이상 - 최우수 고객
# 1000 ~ 1499 - 우수 고객
# 1 ~ 999 - 일반 고객
# 0 이하 (구매한 적 X) - 일반 회원alter

use market_db;
select * from buy;

select M.mem_id, M.mem_name, sum(B.price * B.amount) "총 구매액",
	case 
		when (sum(B.price * B.amount ) >= 1500) then '최우수 고객'
        when (sum(B.price * B.amount ) >= 1000) then '우수 고객'
        when (sum(B.price * B.amount ) >= 1) then '일반 고객'
        else '일반 회원'
	end '회원등급' 
from member M
	left join buy B
    on B.mem_id = M.mem_id
group by M.mem_id
order by sum(B.price * B.amount) desc;
        









