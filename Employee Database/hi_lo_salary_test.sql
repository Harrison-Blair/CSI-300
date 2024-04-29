use employees;

delete from emphistory where eid >= 163;

/*
pos_id = 6
lowsal = 35000
hisal = 45000
*/

select * from emphistory where eid > 162;

insert into emphistory values(163, 6, NOW(), 3300, "Awesome Salary", 121212);
insert into emphistory values(164, 6, NOW(), 1113300, "Awesome Another Salary", 121212);

select * from emphistory where eid > 162;
