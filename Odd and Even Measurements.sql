with cte as (
SELECT measurement_time, date(measurement_time) as day,
measurement_value, 
row_number() over(partition by date(measurement_time) order by measurement_time) as rnk
FROM measurements)
select cast(day as TIMESTAMP),
round(sum(case when rnk %2 =1 then measurement_value end),2) as odd_sum,
round(sum(case when rnk %2 =0 then measurement_value end),2) as even_sum
from cte
group by 1
order by 1 asc
