with dup_rows as (
SELECT count(*)  as total
FROM job_listings
group by company_id, title 
having count(*) >1
)
select count(total) as duplicate_companies
from dup_rows
