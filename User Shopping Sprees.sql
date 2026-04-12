with cte as (
SELECT user_id , transaction_date, 
transaction_date -
(dense_rank() over(partition by user_id order by transaction_date)) * interval '1 day' as rnk 
from transactions )
select user_id 
from cte 
group by user_id
having count(*) >=3 
order by 1
