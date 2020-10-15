--Display the year in which maximum number of employees joined along with how many joined in each month in that year.

DECLARE

v_year number(4);
v_count number(4);
v_month number(4);

begin

 select  to_char(hire_date,'yyyy') into v_year
      from  employees
      group by to_char(hire_date,'yyyy')
      having count(*) = 
             ( select  max( count(*))
               from  employees
               group by to_char(hire_date,'yyyy'));
dbms_output.put_line('The year with max employee is '||v_year);
FOR i IN 1..12 LOOP
      select count(*) into v_count from employees where to_char(hire_date,'yyyy')=v_year and to_char(hire_date,'mm') =i   ;
        dbms_output.put_line('in '||TO_CHAR(TO_DATE(i, 'MM'), 'MONTH')||'  '||v_count||' employees joined');
    END LOOP;




end;
