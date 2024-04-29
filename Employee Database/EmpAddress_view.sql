use employees;

create or replace view ShowEmpAdd as 
select e.eid, e.efn, e.eln, a.estreet, a.ecity, a.est, a.ezip
from employee e join address a on e.eid = a.eaid
order by e.eid;

select * from showempadd;
