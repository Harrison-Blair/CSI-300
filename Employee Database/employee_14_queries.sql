use employees;
/*
insert into Employee(
select eid, efn, eln
from DelEmps
where eid = 14);

select * from employee
where eid = 14
*/

insert into Address(
select eid, estreet, ecity, est, ezip, eid
from DelEmps
where eid = 14);

select eid, estreet, ecity, est, ezip, eid
from Address
where eid = 14;