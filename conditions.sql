select * from employees;
set serveroutput on;
declare
v_name varchar(20);

-----------------if else--------------
begin
select first_name into v_name from employees where job_id='SH_CLERK' and last_name='OConnell';
if v_name='Donald' then

dbms_output.put_line('My name is '||v_name);
else
dbms_output.put_line('My name is not '||v_name);
end if;
end;