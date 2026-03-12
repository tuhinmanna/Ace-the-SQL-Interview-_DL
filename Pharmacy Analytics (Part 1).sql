with cte as (
select drug, total_sales - cogs as ranks from pharmacy_sales
)
select drug, ranks from cte order by ranks desc limit 3
