with cte as 
(SELECT e.email_id, max(case when t.signup_action  = 'Confirmed' then 1 else 0 end) as counts
from emails e left join texts t on e.email_id = t.email_id
group by 1)
select round(
1.0 * sum(counts)/ count(*) ,2) as confirm_rate
from cte 
