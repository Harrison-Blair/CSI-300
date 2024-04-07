use vendors;

delete from salespersoncontact where s_id>0;
delete from address where company_id>0;
delete from salesperson where s_id>0;
delete from company where company_id>0;
delete from contact where contact_id>0;

insert into contact values(11,"Phone");
insert into contact values(22,"E-Mail");

insert into company values(101,"Acme");
insert into company values(202,"Speedster");
insert into company values(303,'Widget');

insert into address values(101, "45 East West Street","Manchester","NH","02335");
insert into address values(202, "1 Main Street", "Burlington","VT", "05401");
insert into address values(303, "786 Widets Lane","Hershey","PA", "25874");

insert into salesperson values(1,"Sally", "Saw",101);
insert into salesperson values(2,"Steve", "Perez",101);
insert into salesperson values(3,"Jane", "Smith",101);
insert into salesperson values(4,"Elliot", "Jones",202);
insert into salesperson values(5,"Mary", "Course",202);
insert into salesperson values(6,"Sarah", "Hopkins",202);
insert into salesperson values(7,"John", "Cuts",303);

insert into salespersoncontact values(4,22,'ejones@speedster.com');
insert into salespersoncontact values(1,22,'ss@acme.com');
insert into salespersoncontact values(2,22,'sp@acme.com');
insert into salespersoncontact values(7,22,'jc@gmail.com');
insert into salespersoncontact values(3,22,'js@acme.com');
insert into salespersoncontact values(5,22,'mcourse@speedster.com');
insert into salespersoncontact values(6,22,'shopkins@speedster.com');
insert into salespersoncontact values(1,11,'888-865-6547');
insert into salespersoncontact values(2,11,'888-865-1235');
insert into salespersoncontact values(7,11,'800-654-9874');
insert into salespersoncontact values(3,11,'888-865-4569');


select * from company;
select * from contact;
select * from address;
select * from salesperson;
select * from salespersoncontact







