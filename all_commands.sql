select * from doctors;

select * from department;

select * from inspections;

insert into inspections (inspectionid,patientid,doctorid)
values (7,5,9);

insert into doctors (doctorid,name,position,departmentid)
values (8,'Ben Storage','Attending doctor',1);

drop public synonym doctors;

update inspections set doctorid = 7 where inspectionid = 103;

select * from test_tab1;

insert into test_tab1 (id,name,surname) values (123,'asdf','qwerty');

alter table test_tab1 modify name varchar2(30);

insert into department (departmentid,departmentname,campus) values (1,'Medicine','Site A');
insert into department (departmentid,departmentname,campus) values (2,'Surgery','Site B');
insert into department (departmentid,departmentname,campus) values (3,'Management','Site C');
insert into doctors (doctorid,name,position,department) values (1,'David McGrey','Physician',1);
insert into doctors (doctorid,name,position,department) values (2,'Michael Smith','Senior Physician',2);
insert into doctors (doctorid,name,position,department) values (3,'George Miller','Staff Internist',1);
insert into doctors (doctorid,name,position,department) values (4,'Eva Wilson','Surgical Physician',2);
insert into doctors (doctorid,name,position,department) values (5,'Bill Green',null,1);

insert into doctors (doctorid,name,department)
values (6,'Leia Black',1);


insert into doctors (doctorid,name,position,department)
values (9,'Ben Drive','Attending Major Physician',1);

select * from patient;



insert into patient (patientid,name,address,phone)
values (1,'John Thin','2271  Sundown Lane, Austin, TX 78749','999-888-22-11');

insert into patient (patientid,name,address,phone)
values (2,'Mary Garcia','95 Greystone St.','999-822-90-11');

insert into patient (patientid,name,address,phone)
values (3,'Aaron Wilson','111 Yellow Statue St. Austin, TX 78749','999-801-01-02');

insert into patient (patientid,name,address,phone)
values (4,'Elizabeth Taylor','24 Marsh St. Austin, TX 78749','999-880-00-11');

insert into patient (patientid,name,address,phone)
values (5,'Amanda Lee','123 Hall Avenue, Austin, TX 78749','999-880-00-91');

insert into patient (patientid,name,address,phone)
values (6,'Mark Robinson','77 West Talbot St. Austin, TX 78749','999-808-09-08');

insert into patient (patientid,name,address,phone)
values (7,'John Thin','121 BlackChain St. Austin, TX 78749','999-900-10-12');

insert into patient (patientid,name,address,phone)
values (8,'Carlos Keyton','334 Pearl St. Austin, TX 78749','999-909-22-32');

insert into patient (patientid,name,address,phone)
values (9,'Edmond Icon','12 Dorothy St. Austin, TX 78749','991-909-09-12');


select * from inspections;

insert into inspections (inspectionid,patientid,doctorid,inspectiondate)
values (101,1,1,to_date('04.12.2018','DD.MM.YYYY'));

insert into inspections (inspectionid,patientid,doctorid,inspectiondate)
values (102,2,2,to_date('03.12.2018','DD.MM.YYYY'));

insert into inspections (inspectionid,patientid,doctorid,inspectiondate)
values (103,3,1,to_date('04.12.2018','DD.MM.YYYY'));

insert into inspections (inspectionid,patientid,doctorid,inspectiondate)
values (104,4,3,to_date('02.12.2018','DD.MM.YYYY'));

insert into inspections (inspectionid,patientid,doctorid,inspectiondate)
values (105,5,3,to_date('02.12.2018','DD.MM.YYYY'));

insert into inspections (inspectionid,patientid,doctorid,inspectiondate)
values (106,6,1,to_date('04.12.2018','DD.MM.YYYY'));


--doctorid:4
insert into inspections (inspectionid,patientid,doctorid,inspectiondate)
values (107,7,7,to_date('05.12.2018','DD.MM.YYYY'));





insert into inspectiondetail (inspectiondetailid,inspectionid,diagnosticname)
values (1001,101,'flu');

insert into inspectiondetail (inspectiondetailid,inspectionid,diagnosticname)
values (1002,102,'incision');

insert into inspectiondetail (inspectiondetailid,inspectionid,diagnosticname)
values (1003,103,'cold');

insert into inspectiondetail (inspectiondetailid,inspectionid,diagnosticname)
values (1004,103,'diarrhea');

insert into inspectiondetail (inspectiondetailid,inspectionid,diagnosticname)
values (1005,104,'cold');

insert into inspectiondetail (inspectiondetailid,inspectionid,diagnosticname)
values (1006,105,'flu');

insert into inspectiondetail (inspectiondetailid,inspectionid,diagnosticname)
values (1007,106,'bronchitis');

insert into inspectiondetail (inspectiondetailid,inspectionid,diagnosticname)
values (1008,106,'flu');

insert into inspectiondetail (inspectiondetailid,inspectionid,diagnosticname)
values (1009,107,'fracture');

select * from inspectiondetail;

commit;

select * from doctors where doctorid = 5;
update doctors set position='Staff Internist' where doctorid = 5;
select * from doctors where doctorid = 5;
update doctors set position='Attending Physician' where position is null;
select * from doctors;
commit;
select * from doctors where department = 2;
update doctors set name = 'George Smith' where department = 2;
savepoint doctor;
select * from inspections;
update inspections set doctorid=3;
rollback to savepoint doctor;
rollback;

delete from inspectiondetail where inspectiondetailid = 1003;
select * from inspectiondetail;
delete from inspectiondetail where inspectionid = 106;
delete from inspections where patientid = 3;
select * from inspections;
select * from patient;
delete from patient where patientid = 1;
delete from doctors where doctorid = 1;
delete from inspections where patientid = 6;
select * from doctors;
select * from department;
delete from department where departmentid = 1;
update doctors set department=1 where doctorid = 1;
update inspections set doctorid=8 where inspectionid = 101;
select * from inspections;
delete from inspectiondetail;
rollback;
truncate table inspectiondetail;
savepoint detail;
select * from inspectiondetail;
rollback to savepoint detail;

create user myhospital identified by myhospital;
grant connect, resource to myhospital;
grant unlimited tablespace to myhospital;

drop table employee cascade constraints purge;
create table employee
(employeeid number,
name varchar2(50),
surname varchar2(50),
salary number,
dateofbirth date,
department varchar2(150),
email varchar2(100),
phone varchar2(15),
managerId number);

alter table employee rename column enmployeeid to employeeid;

alter table employee add ( constraint employee_pk primary key (employeeid));
insert into employee (employeeid,name,surname,salary,dateofbirth,department,email,phone,managerId) values (1,'james','smith',1000,'01-05-1983','HR','jmrsmith@zoracle.com','(111) 998 88 21',4);
insert into employee (employeeid,name,surname,salary,dateofbirth,department,email,phone,managerId) values (2,'JAMES','GOLD',3500,'12-03-1971','Management','jgold12@zoracle.com','99999 8819',null);
insert into employee (employeeid,name,surname,salary,dateofbirth,department,email,phone,managerId) values (3,'MARY','Slim',4500,'31-08-1982','Management','abc_def@zoracle.com','(888) 283 88 11',2);
insert into employee (employeeid,name,surname,salary,dateofbirth,department,email,phone,managerId) values (4,'Ken','Rhytym',1500,'23-04-1970','HR','abcdef@zoracle.com','(9991) 992 881',null);
insert into employee (employeeid,name,surname,salary,dateofbirth,department,email,phone,managerId) values (5,'Paula','SMITH',5500,'01-06-1991','Management','paulasmth@zoracle.com','(9991) 91 88 88',2);
insert into employee (employeeid,name,surname,salary,dateofbirth,department,email,phone,managerId) values (6,'Larry','DEEN',3750,'02-07-1992','HR','Larrydeeen@zoracle.com','99199 999',4);
insert into employee (employeeid,name,surname,salary,dateofbirth,department,email,phone,managerId) values (7,'Chris','Been',4400,'03-02-1982','IT','chrisb@zoracle.com','(123) 0299209',8);
insert into employee (employeeid,name,surname,salary,dateofbirth,department,email,phone,managerId) values (8,'Levis','Brian',8700,'14-09-1982','IT','levbri@zoracle.com','(999) 0100 12 2',null);
insert into employee (employeeid,name,surname,salary,dateofbirth,department,email,phone,managerId) values (9,'Cordi','Klun',4500,'17-04-1977','HR','cordikl@zoracle.com','(889) 999 01 23',4);
insert into employee (employeeid,name,surname,salary,dateofbirth,department,email,phone,managerId) values (10,'Berr','Gerr',4600,'18-10-1979','HR','berrger@zoracle.com','(888) 888 23 23',4);
insert into employee (employeeid,name,surname,salary,dateofbirth,department,email,phone,managerId) values (11,'Klint','Kris',4800,'20-11-1981','IT','klintkr@zoracle.com','(778) 888 89 89',8);
insert into employee (employeeid,name,surname,salary,dateofbirth,department,email,phone,managerId) values (12,'Noah','Thura',8100,'21-12-1977','IT','noahtha@zoracle.com','(788) 999 9900',8);

commit;

select * from employee;
select name,surname,salary from employee;
select employeeid empid, name as nameofemployee, surname "Surname of Employee", dateofbirth from employee;
select * from employee where name = 'james';
select * from employee where name in ('JAMES','james');
select * from employee where department = 'HR' and salary between 3000 and 5000;
select * from employee where department = 'Management' or salary > 8000;
select * from employee where (department='HR' and salary<2000) or (department='Management' and salary>4000);

select name,surname from employee where name like 'j%';
select name,surname,phone from employee where phone like '%(___)%';
select * from employee where email like 'abc_%';
select * from employee where email like 'abc\_%' escape '\';

select * from employee order by name, surname;
select * from employee order by name;
select * from employee order by employeeid desc;
select employeeId empId, name "name of employee", surname as sur_name from employee order by "name of employee", sur_name,empId;
select name, surname, salary from employee order by 3 desc , 1;
select name, surname, salary from employee order by 3 desc , 3;
select * from employee order by salary desc;
select * from employee order by salary desc nulls last;
select * from employee order by managerid desc nulls last;

select * from employee order by managerid desc nulls last fetch first 6 rows only;
select * from employee order by managerid desc nulls last fetch first 6 rows with ties;
select * from employee order by managerid desc nulls last offset 0 rows fetch first 4 rows only;
select * from employee order by managerid desc nulls last offset 4 rows fetch next 4 rows only;
select * from employee order by managerid desc nulls last offset 8 rows fetch next 4 rows only;

select name,surname,salary from employee order by &col desc;
select * from employee;
select * from employee order by &col;
select * from &table order by &sortcolumnby desc nulls last fetch next &limit rows only;
select name,&colname from &table where &filtercolumn=&filtervalue
order by &sort
offset &offsetval rows fetch first &limitsize rows only;

select 'This is a column', 'this is another column' col2 from dual;
select employeeid, name, surname, salary actual_salary,
salary*2 salary_doubled,
salary/2 salary_divided_2,
salary + 100 salary_increased_100,
salary - 100 salary_decreased_100,
salary || '$ earns' salary_concatened
from employee;

select lower(name) lowercase_name, upper(name) uppercase_name, initcap(name) initcap_name
from employee;
select * from employee where upper(name) like '%R%';
select upper(concat(name, concat(' ', surname))) as employee,
       nvl2(salary, concat(salary, '$'), 'Not Applicable') as salary
       from employee;

drop table student purge;
create table student (studentId number, name varchar2(50), surname varchar2(50), score number, gender varchar2(10));

insert into student (studentid , name , surname , score, gender ) values ( 1,'emily','brown',88,'female');
insert into student (studentid , name , surname , score, gender ) values ( 2,'artur','blink',65,'male');
insert into student (studentid , name , surname , score, gender ) values ( 3,'anastasia','bryanov',76,'female');
insert into student (studentid , name , surname , score, gender ) values ( 4,'paul','jackson',89,'male');
insert into student (studentid , name , surname , score, gender ) values ( 5,'khalil','khan',75,'male');
insert into student (studentid , name , surname , score, gender ) values ( 6,'irvin','ingza',69,'female');
insert into student (studentid , name , surname , score, gender ) values ( 7,'claudia','karmen',56,'female');
insert into student (studentid , name , surname , score, gender ) values ( 8,'John','clark',55,'male');

commit;

select * from student;
select to_char(1234.43, '9,999.99') as result from dual;
select to_char(1234.43, '9,999.9') as result from dual;
select to_char(1234567890.43, '9,999.9') as result from dual;
select to_char(1234567890.43, '9,999,999,999,999,999.9') as result from dual;

select dateofbirth as dateofbirthoriginal,
to_char(dateofbirth, 'YYYY') "YYYY",
to_char(dateofbirth, 'Q') "Q",
to_char(dateofbirth, 'MM') "MM",
to_char(dateofbirth, 'MON') "MON-ABBREVIATED NAME OF MONTH",
to_char(dateofbirth, 'MONTH') "MONTH-MONTH NAME",
to_char(dateofbirth, 'DAY') "DAY-DAY NAME",
to_char(dateofbirth, 'DD') "DD-DAY OF MONTH",
to_char(dateofbirth, 'DDD') "DDD-DAY OF YEAR",
to_char(dateofbirth, 'HH') "HH-HOUR OF DAY 1-12",
to_char(dateofbirth, 'HH24') "HH24-HOUR OF DAY 1-24",
to_char(dateofbirth, 'MI') "MI-MINUTE",
to_char(dateofbirth, 'SS') "SS-SECOND",
to_char(dateofbirth, 'dd.mm.yyyy hh24:mi')
from employee;
