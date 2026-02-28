with cte as (
select sender_id, count(*) as total , dense_rank() over(order by count(*) desc) as rn 
from messages
where extract(month from sent_date) = '08' and extract(year from sent_date) = '2022'
group by 1
)
select sender_id, total from cte where rn <=2 order by 2 desc
