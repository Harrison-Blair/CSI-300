use employees;
SET SESSION sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY,',''));

select employee.eid, efn, eln, estreet, ecity, est, ezip,
contact_id, contact, pos_id, salary, comments, status_id, start_date
from Employee join EmpHistory on Employee.eid = EmpHistory.eid
	join Address on Address.eid = Employee.eid
		join EmpContact on EmpContact.eid = Employee.eid
where contact_id = 2
group by contact
having COUNT(*)>1
order by contact;

drop temporary table if exists emps;
create temporary table if not exists emps(
eid int NULL,
efn varchar(45) NULL,
eln varchar(45) NULL,
estreet varchar(45) NULL,
ecity varchar(45) NULL,
est char(2) NULL,
ezip char(5) NULL,
contact_id int NULL,
email varchar(255) NULL,
phone varchar(255) NULL,
pos_id int NULL,
salary int NULL,
start_date datetime NULL,
comments varchar(255) NULL,
status_id int NULL);

insert into emps(
select employee.eid, efn, eln, estreet, ecity, est, ezip,
contact_id, contact, contact, pos_id, salary, start_date, comments, status_id
from Employee join EmpHistory on Employee.eid = EmpHistory.eid
	join Address on Address.eid = Employee.eid
		join EmpContact on EmpContact.eid = Employee.eid
where contact_id = 2
group by contact
having count(*)>1
order by contact
);

select * from emps;

/*
select employee.eid, efn, eln, estreet, ecity, est, ezip,
contact_id, contact, contact, pos_id, salary, start_date, comments, status_id
from Employee join EmpHistory on Employee.eid = EmpHistory.eid
	join Address on Address.eid = Employee.eid
		join EmpContact on EmpContact.eid = Employee.eid
where contact_id = 2 and contact in (select email from emps);
*/

select e.eid, e.efn, e.eln, a.estreet, a.ecity, a.est, a.ezip,
ec.contact_id, ec.contact, eh.pos_id, eh.salary, eh.start_date, eh.comments, eh.status_id
from Employee e join EmpHistory eh on e.eid = eh.eid
	join Address a on a.eid = e.eid
		join EmpContact ec on ec.eid = e.eid
			join emps
where ec.contact_id = 2 and ec.contact = emps.email
order by contact;

drop table if exists DelEmps;
create table if not exists DelEmps(
eid int NULL,
efn varchar(45) NULL,
eln varchar(45) NULL,
estreet varchar(45) NULL,
ecity varchar(45) NULL,
est char(2) NULL,
ezip char(5) NULL,
contact_id int NULL,
email varchar(255) NULL,
phone varchar(255) NULL,
pos_id int NULL,
salary int NULL,
start_date datetime NULL,
comments varchar(255) NULL,
status_id int NULL);

insert into DelEmps(
select e.eid, efn, eln, estreet, ecity, est, ezip,
contact_id, contact, contact, pos_id, salary, start_date, comments, status_id
from Employee e join EmpHistory on e.eid = EmpHistory.eid
join Address on Address.eid = e.eid
join EmpContact on EmpContact.eid = e.eid
where contact_id = 2 and (e.eid=129 or e.eid=155 or e.eid=91 or e.eid=157
or e.eid=137 or e.eid=141 or e.eid=19 or e.eid=16 or e.eid=84
or e.eid=15 or e.eid=92 or e.eid=88 or e.eid=65 or e.eid=90
or e.eid=139 or e.eid=135 or e.eid=43 or e.eid=14 or e.eid=35
or e.eid=67 or e.eid=25 or e.eid=23 or e.eid=156 or e.eid=87
or e.eid=24 or e.eid=44 or e.eid=34 or e.eid=17 or e.eid=140
or e.eid=18 or e.eid=93 or e.eid=38 or e.eid=54)
);
select * from DelEmps;

drop temporary table if exists PhoneEmps;
create temporary table if not exists PhoneEmps(
eid int NULL,
contact varchar(255) NULL
);

insert into PhoneEmps(
select e.eid, contact
from Employee e join EmpContact ec on ec.eid = e.eid
where contact_id = 1 and e.eid in (select eid from DelEmps));

select * from PhoneEmps;
select * from DelEmps;

update DelEmps join PhoneEmps
	on DelEmps.eid = PhoneEmps.eid
set DelEmps.phone = PhoneEmps.contact;

select * from DelEmps;

delete from employee
where eid in (select eid from DelEmps);

select * from Employee;
select * from EmpContact;
select * from EmpHistory;
select * from Address;