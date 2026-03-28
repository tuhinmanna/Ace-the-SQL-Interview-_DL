with cte as (
SELECT category, product, sum(spend) as total_spend, 
row_number() over(partition by category order by sum(spend) desc) as rnk 

FROM product_spend
where year(transaction_date) = '2022'
group by 1,2)
select category, product, total_spend
from cte 
where rnk in (1,2)
