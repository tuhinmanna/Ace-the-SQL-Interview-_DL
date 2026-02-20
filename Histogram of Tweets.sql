with cte as (
select user_id, count(tweet_id) as total from tweets
where EXTRACT(year from tweet_date) = '2022'
group by 1)
select total as tweet_bucket, count(user_id) as users_num
from cte 
group by 1
