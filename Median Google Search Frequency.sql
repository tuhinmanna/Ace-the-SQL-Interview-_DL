with cte as (
SELECT searches, sum(num_users) over(order by searches asc) as rn1,
sum(num_users) over(order by searches desc) as rn2,
sum(num_users) over() as totalu
FROM search_frequency
)
select round(avg(searches),1) as median
from cte 
where rn1 >= totalu/2.0 and rn2 >= totalu/2.0
