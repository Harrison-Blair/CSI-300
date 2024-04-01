use employees;
-- SET SESSION sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY,',''));

/* 
-- Inserts new status into HistoryStatus for our use
select * from HistoryStatus;

insert into HistoryStatus values(121212, "One-time salary adjustment");

select * from HistoryStatus;

-- Gets most recent salary range end for type sal_id
select sp1.pos_id, sp1.sal_date, sp1.sal_value
from SalPos sp1 inner join (
	select pos_id, max(sal_date) as MaxDate
	from SalPos
	group by pos_id) sp2 on sp1.pos_id = sp2.pos_id
							and sp1.sal_date = sp2.MaxDate
							and sal_id = 1;
                            
drop temporary table if exists Sal_AdjustmentLow;
create temporary table if not exists Sal_AdjustmentLow(
pos_id int not null, 
sal_date datetime not null,
sal_value int not null);

-- Drops the results of the inner join on SalPos into the temp table
insert into Sal_AdjustmentLow
select sp1.pos_id, sp1.sal_date, sp1.sal_value
from SalPos sp1 inner join (
	select pos_id, max(sal_date) as MaxDate
	from SalPos
	group by pos_id) sp2 on sp1.pos_id = sp2.pos_id
							and sp1.sal_date = sp2.MaxDate
							and sal_id = 1;
select * from Sal_AdjustmentLow
*/

insert into EmpHistory
select eh.eid, eh.pos_id, NOW(),
	salary - (eh.salary - saLow.sal_value) as "New Salary", 'One-time adjustment approved by management' as comments, 121212 as status_id
from EmpHistory eh join Sal_AdjustmentLow saLow on eh.pos_id = saLow.pos_id
where (eh.salary - saLow.sal_value) < 0
order by eh.eid;

select * from EmpHistory;

/*
select e.efn, e.eln, ep.pos_id, pos_name, salary, sal_value, 
	(salary - sal_value) as 'Difference', sal_date
from Employee e join EmpHistory eh on e.eid = eh.eid
	join EmpPos ep on eh.pos_id = ep.pos_id
		join SalPos sp on sp.pos_id = ep.pos_id
where sal_id = 2 
and (salary - sal_value) > 0;
*/
/*
use employees;

select pos_id, sal_id, sal_date, sal_value
from SalPos
where sal_id = 2
order by sal_date desc
*/
