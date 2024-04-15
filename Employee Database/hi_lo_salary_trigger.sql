use employees;

drop trigger if exists SalAdj;

delimiter //
create trigger SalAdj before insert on emphistory
for each row begin
	declare hisal int;
    declare lowsal int;
    declare diff int;
    
    select sal_value into hisal
    from salpos sp1 inner join (
    select pos_id, max(sal_date) as MaxDate
	from SalPos
	group by pos_id) sp2 on sp1.pos_id = sp2.pos_id and sp1.sal_date = sp2.MaxDate
    where new.pos_id = sp1.pos_id and
			sal_id = 2;
            

    select sal_value into lowsal
    from salpos sp1 inner join (
    select pos_id, max(sal_date) as MaxDate
	from SalPos
	group by pos_id) sp2 on sp1.pos_id = sp2.pos_id and sp1.sal_date = sp2.MaxDate
    where new.pos_id = sp1.pos_id and
			sal_id = 1;
	
    if new.salary > hisal then
		set diff = new.salary - hisal;
		insert into EmpHistory values (new.eid, new.pos_id, now(), (new.salary - diff),
			new.comments, new.status_id);
	end if;
    
    if new.salary < lowsal then
		set diff = lowsal - new.salary;
		insert into EmpHistory values (new.eid, new.pos_id, now(), (new.salary + diff),
			new.comments, new.status_id);
	end if;
    
end;
//

