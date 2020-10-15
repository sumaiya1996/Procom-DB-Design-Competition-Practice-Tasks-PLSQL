--Increase the salary of employee 115 based on the following conditions: If experience is more than 10 years, increase salary by 20% If experience is greater than 5 years, 
--increase salary by 10% Otherwise 5% Case by Expression:

declare
v_exp number(6);
v_inc number;
v_hike number;
begin


select ((sysdate-hire_date)/365) into v_exp from employees where employee_id=115;
dbms_output.put_line(v_exp);
v_hike:=1.05;
case when v_exp>10 then v_hike:=1.02;
         when v_exp>5 then v_hike:=1.10;
        
        end case;
        
dbms_output.put_line('Your salary increment is '||v_hike);     
update employees set salary=salary*v_hike where employee_id=115;

end;
