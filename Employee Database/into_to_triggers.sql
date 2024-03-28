use employees;

create table if not exists DupEntry(
new_eid int not null,
new_efn varchar(45) not null,
new_eln varchar(45) not null
);
/*
The is a trigger that will examine employee first and last name and 
if the exact first name and last name exists, then we will prevent the 
insert of the data
*/

drop trigger if exists checkEmp;

delimiter |
create trigger checkEmp before insert on Employee
for each row begin 
	-- declare vars (two strings)
	declare emp_fn varchar(255);
	declare emp_ln varchar(255);
    declare emp_street varchar(255);
    declare emp_city varchar(255);
    declare emp_st varchar(255);
    declare emp_zip varchar(255);
    declare emp_email varchar(255);
    
    
    declare old_efn varchar(45);
    declare old_eln varchar(45);
	declare old_street varchar(255);
    declare old_city varchar(255);
    declare old_st varchar(255);
    declare old_zip varchar(255);
    declare old_email varchar(255);
    
    set emp_fn = NEW.efn;
    set emp_ln = NEW.eln;
    set emp_street = NEW.estreet;
    set emp_city = NEW.ecity;
    set emp_st = NEW.est;
    set emp_zip = NEW.ezip;
    set emp_email = NEW.conatct;
    
    set old_efn = (select efn from Employee limit 1);
    set old_eln = (select eln from Employee limit 1);
    
    if old_efn = NEW.efn and old_eln = NEW.eln then
	insert into DupEntry values(NEW.eid, NEW.efn, NEW.eln);
    end if;
    
end;

|