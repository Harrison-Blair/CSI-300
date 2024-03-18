use employees;

select e.efn, e.eln, ep.pos_id, pos_name, salary, sal_value, 
	(salary - sal_value) as 'Difference', sal_date
from Employee e join EmpHistory eh on e.eid = eh.eid
	join EmpPos ep on eh.pos_id = ep.pos_id
		join SalPos sp on sp.pos_id = ep.pos_id
where sal_id = 2 
and (salary - sal_value) > 0;

/*
use employees;

select pos_id, sal_id, sal_date, sal_value
from SalPos
where sal_id = 2
order by sal_date desc
*/
