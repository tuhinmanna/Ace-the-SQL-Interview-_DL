with cte as (
SELECT user_id, spend, transaction_date, 
row_number() over(partition by user_id order by transaction_date) as rnk

FROM transactions)
select  user_id, spend, transaction_date from cte
where rnk = 3
