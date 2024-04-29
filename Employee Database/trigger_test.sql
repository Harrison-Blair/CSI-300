use employees;

delete from Employee where eid >= 163;
delete from DupEntry where new_eid >= 163;
delete from Address where eaid >= 163;
delete from DupAddEntry where new_eaid >=163;

insert into Employee values(163, 'Bruce', 'Jones');
insert into Employee values(164, 'Please', 'Work');
insert into Address values(163, '110 Main Street', 'Winooski', 'VT', '05404', 163);
insert into Address values(164, '158 Mount Mansfield Road', 'Underhill', 'VT', '05423', 164);
insert into empcontact values(163, 1, '802-865-4568');
insert into EmpContact values(163, 2, 'BruceJones@neb.com');

select * from dupaddentry;

select * from dupempentry;

call cleanupEmps();

select * from dupaddentry;

select * from dupempentry;