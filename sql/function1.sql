# SQL Name: function1.sql 
# Command Line: loginj < function1.sql

# pow caused core dump now: Bug030_20171121 

drop table if exists function1;

spool  $QA_HOME/work/function1.out; 

create table function1 ( key: ID_Num char(32), Random1 double(30,28),Random2 double(30,28),Random3 double(30,28),Random4 double(30,28),Random5 double(30,28));

desc function1;  

load $QA_HOME/data/carPlate.txt into function1 ;

sleep 5;


select count(*) from function1;

# test functions:

select sum(random1)  from test.function1;
select sum(random1) as sum_random1  from test.function1;
select avg(random1)  from test.function1;
select min(random1)  from test.function1;
select max(random1)  from test.function1;
select count(random1)  from test.function1;
select stddev(random1)  from test.function1;
select first(random1)  from test.function1;
select last(random1)  from test.function1;
select abs(random1)  from test.function1 limit 3;
select acos(random1)  from test.function1 limit 3;
select upper(id_num)  from test.function1 limit r32;

select substring(random1,1 ,3 )  from test.function1 limit 3;
select date(random1 )  from test.function1 limit 3;

select cos(random1), sin(random2)  from test.function1 limit 3;

select ceil(random1)  from test.function1 limit 3;
select cos(random1)  from test.function1 limit 3;
select floor(random1)  from test.function1 limit 3;

select log(random1)  from test.function1 limit 3;
select log2(random1)  from test.function1 limit 3;
select log10(random1)  from test.function1 limit 3;
select ln(random1)  from test.function1 limit 3;

select mod(random1, random2)  from test.function1 limit 3;

#select pow(random1, random2)  from test.function1 limit 3;

select radians(random1)  from test.function1 limit 3;

select degrees(random1)  from test.function1 limit 3;
select sin(random2)  from test.function1 limit 3;
select sqrt(random1)  from test.function1 limit 3;
select tan(random1)  from test.function1 limit 3;

select substr(random1, 2, 4)  from test.function1 limit 3;
select substr(random1, 2, 4, 'UTF8')  from test.function1 limit 3
select substring(random1, 2, 4, 'utf8')  from test.function1 limit 3;
select substring(random1, 2, 4)  from test.function1 limit 3;

select upper(ID_Num)  from test.function1 limit 3;
select lower(ID_Num)  from test.function1 limit 3;

select ltrim(ID_Num)  from test.function1 limit 3;

select rtrim(ID_Num)  from test.function1 limit 3;
select trim(ID_Num)  from test.function1 limit 3;

select length(random5)  from test.function1 limit 3;
select length(ID_Num)  from test.function1 limit 3;



spool off;
quit;


