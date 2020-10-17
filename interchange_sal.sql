--Write a program to interchange the salaries of employee 120 and 122.

declare

s_120 employees.salary%type;
s_122 employees.salary%type;

begin

select salary into s_120 from employees where employee_id=120;
select salary into s_122 from employees where employee_id=122;

dbms_output.put_line('before interchange s_120 '||s_120);
dbms_output.put_line('before interchange s_122 '||s_122);

dbms_output.put_line('After interchange s_120 '||s_122);
dbms_output.put_line('before interchange s_122 '||s_120);

update employees set salary = s_120 where employee_id=122;
update employees set salary = s_122 where employee_id=120;

commit;

end;