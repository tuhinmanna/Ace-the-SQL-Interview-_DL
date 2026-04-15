with cte as (SELECT card_name ,issued_amount,
row_number() over(partition by card_name order by issue_year, issue_month asc ) as rnk
FROM 
monthly_cards_issued)
select card_name , issued_amount 
from cte 
where rnk = 1
order by 2 desc
