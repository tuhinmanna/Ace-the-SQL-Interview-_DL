with cte as (
select salary , dense_rank() over(order by salary desc) as rnk
from employee
)
select distinct salary as second_highest_salary from cte where rnk = 2
