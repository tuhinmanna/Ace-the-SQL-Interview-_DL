with cte as (
SELECT p.category_name, p.product_name , rating,
dense_rank() over(partition by category_name order by s.sales_quantity desc, rating desc) as rnk
FROM products p inner join product_sales s 
on p.product_id = s.product_id
)
select category_name, product_name 
from cte 
where rnk = 1
