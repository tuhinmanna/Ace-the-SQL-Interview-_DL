with cte as (
select item_count* order_occurrences as total_counts, order_occurrences
from items_per_order
)
select round((1.0 * sum(total_counts)/sum(order_occurrences)) ::numeric ,1)  as mean 
from cte 
