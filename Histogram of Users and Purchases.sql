with cte as (
SELECT transaction_date, user_id, count(*), 
row_number() over(partition by user_id order by transaction_date desc) as rnk
from user_transactions
group by 1,2)
select transaction_date, user_id , count as purchase_count
from cte 
where rnk = 1
order by transaction_date 
