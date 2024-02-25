use employees;

select ep.pos_name, st.sal_desc, sp.sal_value, sp.sal_date
from EmpPos ep join SalPos sp on ep.pos_id = sp.pos_id
	join SalType st on st.sal_id = sp.sal_id
		join department d on d.dept_id = ep.dept_id
where dept_name = 'Accounting'