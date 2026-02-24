SELECT part, assembly_step
from parts_assembly
where finish_date is null and assembly_step >=1
