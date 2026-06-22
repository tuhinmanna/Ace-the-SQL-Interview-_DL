with cte as (
SELECT user_id, extract( month from login_date) as mnt , lag(login_date) over(partition by user_id order by login_date ), 
(extract(month from login_date) - 
extract(month from (lag(login_date) over(partition by user_id order by login_date )))) as diff
from
user_logins)

-- select user_id, extract(month from login_date) from user_logins
select mnt , count(*) from cte 
where diff is null or diff > 1
group by mnt 
order by mnt asc
