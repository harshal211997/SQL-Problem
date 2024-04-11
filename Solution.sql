with cte as
(
	select
			name,
			sequance,
			sequance - row_number() over(partition by name order by name) diff
	from sequance
),
cte_final as
(
	select 
			name,
			sequance,
			diff
	from cte
)
select
		name,
		min(sequance) as Min,
		max(sequance) as Max
from cte_final
group by diff,name
order by name,Min asc
