with cte as (
SELECT count(policy_holder_id) as c
FROM callers
where case_id is not null
group by policy_holder_id
)
select count(c) as policy_holder_id from cte 
where c >=3
