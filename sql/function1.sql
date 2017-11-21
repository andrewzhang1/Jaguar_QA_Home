# SQL Name: function1.sql 

drop table if exists function1;

spool  $QA_HOME/work/function1.out; 

create table function1 ( key: ID_Num char(32), Random1 double(30,28),Random2 double(30,28),Random3 double(30,28),Random4 double(30,28),Random5 double(30,28));

desc function1;  

load $QA_HOME/data/carPlate.txt into function1 ;

sleep 5;


select count(*) from function1;

# test functions:

select sum(random1)  from test.function1;
select sum(random1) as sum_random1  from test.function1 limit 3;
select avg(random1)  from test.function1;
select min(random1)  from test.function1;
select max(random1)  from test.function1;
select count(random1)  from test.function1;
select stddev(random1)  from test.function1;
select first(random1)  from test.function1;
select last(random1)  from test.function1;
select abs(random1)  from test.function1 limit 10;
select acos(random1)  from test.function1 limit 10;
select upper(id_num)  from test.function1 limit 2;

select substring(random1,1 ,3 )  from test.function1 limit 2;
select date(random1 )  from test.function1 limit 2;

select cos(random1), sin(random2)  from test.function1 limit 3;


spool off;
quit;


