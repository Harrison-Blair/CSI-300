use employees;

drop table if exists DupEmpEntry;
create table if not exists DupEmpEntry(
DBTable varchar(45) not null,
time_of_error datetime not null,
new_eid int not null,
new_efn varchar(45) not null,
new_eln varchar(45) not null,
email varchar(255) not null
	default ""
);

drop table if exists DupAddEntry;
create table if not exists DupAddEntry(
DBTable varchar(45) not null,
time_of_error datetime not null,
new_eaid int not null,
new_street varchar(255) not null,
new_city varchar(255) not null,
new_st char(2) not null,
new_zip char(5) not null
);

drop trigger if exists DupEmp;
drop trigger if exists DupAdd;
drop trigger if exists DupContact;

delimiter //
create trigger DupEmp before insert on employee
for each row begin
	declare count_dups int;
    
    select count(*) into count_dups 
    from employee
    where NEW.efn = efn and 
		  NEW.eln = eln;
	if count_dups > 0 then
		insert into DupEmpEntry (DBTable, time_of_error, new_eid, new_efn, new_eln) 
			values ("Employee", NOW(), NEW.eid, NEW.efn, NEW.eln);
	end if;
end;
//

delimiter /
create trigger DupAdd before insert on address
for each row begin
	declare count_dups int;
    
    select count(*) into count_dups 
    from address
    where
		new.estreet = estreet and
        new.ecity = ecity and
        new.est = est and
        new.ezip = ezip;
        
	if count_dups > 0 then
		insert into DupAddEntry values("Address", NOW(), new.eaid, new.estreet,
			new.ecity, new.est, new.ezip);
	end if;
end;
/

delimiter //
create trigger DupContact before insert on EmpContact
for each row begin
	declare count_dups int;
    
    select count(*) into count_dups
    from EmpContact;
    
    if count_dups > 0 then
		update DupEmpEntry
        set email = new.contact
        where new_eid = new.eid;
	end if;
end;
//