select round(
100.0 * sum(case when pi1.country_id <> pi2.country_id then 1 else 0 end)/count(*)
,1) as international_calls_pct
from phone_calls pc 
inner join phone_info pi1 
on pc.caller_id = pi1.caller_id 
inner join phone_info pi2 on pc.receiver_id = pi2.caller_id 
