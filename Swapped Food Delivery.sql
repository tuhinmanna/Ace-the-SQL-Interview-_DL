select order_id as corrected_order_id,
case when order_id%2 = 1 and order_id < max(order_id) over() then lead(item,1) over() 
    when  order_id%2=0  then lag(item,1) over() 
    when order_id%2=1 and order_id =  max(order_id) over() then item  end as item
from orders
