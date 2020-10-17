--Find out the name of the employee and name of the department for the employee who is managing for employee 103.

declare

v_name varchar(30);
v_dept departments.department_name%type;

begin

select e.first_name||' '||e.last_name,d.department_name into v_name,v_dept from employees e join departments d on e.department_id = d.department_id where  employee_id= ( select manager_id from employees    where employee_id = 103);
dbms_output.put_line(v_name||' is from '||v_dept);


end;