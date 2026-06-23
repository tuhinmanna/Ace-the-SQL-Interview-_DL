with cte as (select transaction_id, merchant_id, transaction_timestamp as cur,
lag(transaction_timestamp) over(partition by merchant_id,credit_card_id,amount order by transaction_timestamp) as prev
from transactions)
select count(*) as payment_count
from cte 
where extract(epoch from (cur - prev)/60) between 0 and 10
