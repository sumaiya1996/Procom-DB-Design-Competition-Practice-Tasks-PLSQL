declare

--v_job_id varchar(20):='SH_CLERK';
cursor c_emp(v_job_id varchar2) is select employee_id,first_name from employees where job_id=v_job_id;
v_empid number(5);
v_name varchar2(20);
begin

open c_emp('AD_ASST');

 loop

fetch c_emp into v_empid,v_name;
exit when c_emp%notfound;
dbms_output.put_line(v_empid|| ' name '||v_name);

end loop;
close c_emp;
end;