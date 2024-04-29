use dogs;

delete from breeds;

insert into breeds values("Test Breed 1", 2, 13.5);
insert into breeds values("Test Breed 2", 200, 413.5);
insert into breeds values("Test Breed 3", 9, 65.5);

select * from breeds;

delete from breeds
where lifespan > 10;

select * from breeds;

select name, lifespan, avgweight as "avgweightlbs", avgweight * 0.45359237 as "avgweightkilo" from breeds;