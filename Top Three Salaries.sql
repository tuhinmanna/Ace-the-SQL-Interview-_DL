with cte as (select d.department_name , e.name , e.salary , 
dense_rank() over(partition by d.department_id order by e.salary desc) as rnk
from employee e inner join department d on 
e.department_id = d.department_id )

select department_name, name , salary 
from cte 
where rnk in (1,2,3)
order by 1, 3 desc, 2 asc
