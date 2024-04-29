use employees;

drop trigger if exists SalAdjLo;
drop trigger if exists SalAdjHi;

delimiter //
create trigger SalAdjLo before insert on emphistory
for each row begin
	-- declare hisal int;
    declare lowsal int;
/*
    select sal_value into hisal
    from salpos sp1 inner join (
    select pos_id, max(sal_date) as MaxDate
	from SalPos
	group by pos_id) sp2 on sp1.pos_id = sp2.pos_id and sp1.sal_date = sp2.MaxDate
    where new.pos_id = sp1.pos_id and
			sal_id = 2;
*/
    select sal_value into lowsal
    from salpos sp1 inner join (
    select pos_id, max(sal_date) as MaxDate
	from SalPos
	group by pos_id) sp2 on sp1.pos_id = sp2.pos_id and sp1.sal_date = sp2.MaxDate
    where new.pos_id = sp1.pos_id and
			sal_id = 1;
/*
    if new.salary > hisal then
		set new.salary = hisal;
	end if;
*/
    if new.salary < lowsal then
		set new.salary = lowsal;
	end if;
end;
//

delimiter |
create trigger SalAdjHi before insert on EmpHistory
for each row begin
	declare hisal int;

    select sal_value into hisal
    from salpos sp1 inner join (
    select pos_id, max(sal_date) as MaxDate
	from SalPos
	group by pos_id) sp2 on sp1.pos_id = sp2.pos_id and sp1.sal_date = sp2.MaxDate
    where new.pos_id = sp1.pos_id and
			sal_id = 2;

    if new.salary > hisal then
		set new.salary = hisal;
	end if;
end;
|
