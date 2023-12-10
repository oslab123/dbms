table name 'man'
name varchar
age int
admnno int
salary int;


create or replace package detail as
function annual_bonus(sal int) return int;
procedure add_emp(vname varchar,vage int,vadmnno int,vsal int);
end detail;


create or replace package body detail is
function annual_bonus(vadmnno int) return int is
oldsal int;
newsal int;
begin
select salary into oldsal from man where admnno=vadmnno;
newsal:=(oldsal*10)/100;
dbms_output.put_line('Annual Bonus ='||newsal);
return newsal;
end annual_bonus;
procedure add_emp(vname varchar,vage int,vadmnno int,vsal int) is
begin
insert into man values(vname,vage,vadmnno,vsal);
end add_emp;
end detail;

----------calling-----------------
select * from man;
begin
dbms_output.put_line(detail.annual_bonus(1001));
detail.add_emp('suresh',45,1655,50000);
end;
