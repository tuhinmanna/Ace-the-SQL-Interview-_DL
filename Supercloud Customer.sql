
with cte as (SELECT c.customer_id , count(distinct p.product_category) as cnt 
from customer_contracts c inner join products p 
on c.product_id = p.product_id
group by c.customer_id)
select customer_id 
from cte 
where cnt  = (select count(distinct product_category) from products )
