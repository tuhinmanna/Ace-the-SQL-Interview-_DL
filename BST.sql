use intess;

create table test1(
N int,
P int
);

insert into test1 values
(1,2),
(3,2),
(6,8),
(9,8),
(2,5),
(8,5),
(5,null);

select * from test1;

with recursive cte as (
select N, P from test1 where P is null

union all

select og.n,og.p from test1 og join cte c
on og.P = c.N
)
select * from cte;


select N,
case when P is NULL then ' Root' 
when N not in (select distinct P from BST where P is not null) then ' Leaf'
else ' Inner'
end as new_col
from BST
order by N
