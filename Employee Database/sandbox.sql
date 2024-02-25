use employees; -- Identify the database to use

select efn, eln
from employee;

select employee.eid, efn, eln, estreet, ecity, est, ezip
from employee join address on employee.eid = address.eid;

/* Alias a table in code */
select e.eid, efn, eln, estreet, ecity, est, ezip
from employee as e join address as a on e.eid = a.eid;

select e.eid, efn, eln, pos_name, dept_name, salary
from employee e join emphistory as eh on e.eid = eh.eid
	join emppos ep on ep.pos_id = eh.pos_id
		join department d on d.dept_id = ep.dept_id
where dept_name = "IT" and salary > 100000
order by eln;

