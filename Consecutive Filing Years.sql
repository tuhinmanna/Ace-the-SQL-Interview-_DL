with cte as (SELECT user_id, extract(year from filing_date),
row_number() over(PARTITION by user_id order by filing_date) as rn 
fROM filed_taxes
where product like 'TurboTax%'),
cte2 as (
select user_id, extract-rn as grp 
from cte )
select user_id
from cte2
group by user_id
having count(*) >=3
order by user_id
