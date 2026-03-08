with cte as (
select e.employee_id , count(distinct q.query_id) as total
from employees e left join queries q 
on e.employee_id  = q.employee_id and
 extract(month from query_starttime) in ('07','08','09')
group by 1
)
select total as unique_queries, count(*) as employee_count
from cte 
group by 1
order by 1 asc
