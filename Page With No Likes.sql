select distinct p.page_id
from pages p left join page_likes pl 
on p.page_id = pl.page_id
where pl.page_id is null
order by 1 asc
