use employees;

drop procedure if exists cleanupEmps;

delimiter //
create procedure cleanupEmps()
begin
declare del_eid int;

set del_eid = (select max(new_eid) from DupEmpEntry);

delete from Employee
where eid = new_eid;

delete from DupEmpEntry
where new_eid = del_eid;

delete from dupaddentry
where new_eaid = del_eaid;

end;
//