create or replace procedure cal_sal as

cursor c_emp is select * from employees where employee_id>179;
v_new_sal employees.salary%type;
r_emp employees%rowtype;
v_old_sal employees.salary%type;
begin

open c_emp;


loop
fetch c_emp into r_emp;
exit when c_emp%notfound;
v_old_sal:=r_emp.salary;
r_emp.salary:=r_emp.salary*24+r_emp.salary*nvl(r_emp.commission_pct,0);
dbms_output.put_line('salary# '||c_emp%rowcount||' old salary:'||v_old_sal||' new salary along with commission and increment '||r_emp.salary);
--dbms_output.put_line();
end loop;
close c_emp;


end;

/
execute cal_sal;