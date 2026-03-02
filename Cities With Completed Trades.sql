select u.city, count(*) as num 
from trades t inner join users u 
on t.user_id = u.user_id 
where t.status = 'Completed'
group by 1
order by 2 desc 
limit 3
