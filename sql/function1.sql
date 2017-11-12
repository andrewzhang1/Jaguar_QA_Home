# SQL Name: function1.sql 

spool  $QA_HOME/work/function1.out; 

create table function1 ( key: ID_Num char(32), value: Random1 float(2, 20), Random2 float(2, 20), Random3 float(2, 20), Random4 float(2, 20), Random5 float(2, 20);

desc function1;

load $QA_HOME/data/carPlate.txt into function1;
select count(*) from function1;

spool off;
quit;


load $QA_HOME/data/10kLine.txt into data_load;

sleep 5;

select count(*) from  data_load;
select * from data_load  where v3 = "Apple31234567890";
select * from data_load  where v3 = 'Apple31234567890';

show create table data_load;
drop table data_load;

#spool off;
quit;


