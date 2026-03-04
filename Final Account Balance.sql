SELECT account_id ,
sum(case when transaction_type = 'Deposit' then amount end) - 
sum(case when transaction_type = 'Withdrawal' then amount end) as final_balance
from transactions
group by 1 
