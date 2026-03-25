with cte as (
select age_bucket,sum(case when activity_type = 'open' then time_spent else 0 end) as open_time,
sum(case when activity_type = 'send' then time_spent else 0 end) as send_time
from activities a inner join age_breakdown b on a.user_id = b.user_id
group by age_bucket
)
select age_bucket, round(send_time * 100.0 /(send_time+open_time),2) as send_perc,
round(open_time * 100.0 /(send_time+open_time),2) as open_perc
from cte 
