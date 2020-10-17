--Change salary of employee 130 to the salary of the employee with first name ‘Joe’. If Joe is not found then take average salary of all employees. 
--If more than one employee with first name ‘Joe’ is found then take the least salary of the employees with first name Joe.


declare

sal employees.salary%TYPE;
cnt  NUMBER;

begin

select count(*) into cnt from employees where last_name='Joe';

if cnt=0 then

select avg(salary) into sal from employees;
dbms_output.put_line('avg sal '||sal);
end if;

if cnt>1 then
select min(salary) into sal from employees where last_name='Joe';
dbms_output.put_line('min sal '||sal);
end if;
dbms_output.put_line('final sal '||sal);

update employees
  SET salary = sal where employee_id = 130;


end;