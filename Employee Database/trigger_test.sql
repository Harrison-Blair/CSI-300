use employees;

delete from Employee where eid = 163 or eid = 164;
delete from DupEntry where new_eid = 163 or new_eid = 164;

insert into Employee values(163, 'Bruce', 'Jones');
insert into Employee values(164, 'Please', 'Work');

select eid, efn, eln from employee 
where eid > 162;

select new_eid, new_efn, new_eln from DupEntry 
where new_eid > 162;
