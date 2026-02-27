with cte as (
SELECT user_id, min(post_date) as min , max(post_date) as max 
from posts where 
extract(year from post_date) = 2021 group by 1 having count(user_id) >= 2
)
select user_id, datediff(max,min) as days_between
from cte 
