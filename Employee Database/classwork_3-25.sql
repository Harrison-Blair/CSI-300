use employees;

select Employee.eid, concat(efn, " ", eln) as Employee,  pos_name, salary, start_date as "As of Date:"
from Employee join EmpHistory on Employee.eid = EmpHistory.eid
	join EmpPos on EmpHistory.pos_id = EmpPos.pos_id
		join SalPos on EmpPos.pos_id = SalPos.pos_id
		inner join (
			select Employee.eid, max(start_date)
            from EmpHistory
            group by Employee.eid)