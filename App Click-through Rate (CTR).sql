SELECT app_id,
round(sum(case when event_type = 'click' then 1 end) * 100.0 / sum(case when event_type = 'impression' then 1 end),2)
as ctr 
from events
where extract(year from timestamp) = 2022
group by 1
