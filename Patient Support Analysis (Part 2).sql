select round(
100.0 * sum(case when call_category = 'n/a' or call_category is null then 1 else 0 end)/ count(*)
,1)
as uncategorised_call_pct
from callers 
