--Display missing employee IDs.
 
 select max(employee_id),min(employee_id) from employees;
 select count(*)  from employees where employee_id=104;
 select distinct employee_id from employees;
 DELETE FROM employees WHERE employees.employee_id  = 104;
 
 select  count(*),to_char(hire_date,'yyyy') 
      from  employees
      group by to_char(hire_date,'yyyy')
      having count(*) = 
             ( select  max( count(*))
               from  employees
               group by to_char(hire_date,'yyyy'));
 
 declare
 
 v_min employees.employee_id%TYPE ;
 v_max employees.employee_id%TYPE ;
 cnt number;
 
 
 begin
 select max(employee_id),min(employee_id) into v_max,v_min from employees;
 FOR j IN v_min..v_max LOOP
     --dbms_output.put_line(j);
     
     select count(*) into cnt from employees where employee_id=j;
     if cnt=0 then
     dbms_output.put_line(j||' is missing');
     end if;
   END LOOP;
 end;