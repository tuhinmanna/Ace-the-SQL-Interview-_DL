select candidate_id from candidates
where skill in ('Python', 'Tableau', 'PostgreSQL')
group by 1
having count(distinct skill) = 3  
