with cte as (SELECT extract(year from transaction_date) as year ,
product_id , 
spend as curr_year_spend,
lag(spend,1) over(partition by product_id order by transaction_date) as prev_year_spend
FROM user_transactions)
select year, product_id, curr_year_spend, prev_year_spend,
round(100.0 * (curr_year_spend - prev_year_spend) / prev_year_spend , 2) as yoy_rate
from cte
