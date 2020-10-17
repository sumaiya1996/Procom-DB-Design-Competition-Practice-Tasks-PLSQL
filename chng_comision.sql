--Change commission percentage as follows for employee with ID = 150. If salary is more than 10000 then commission is 0.4%, if Salary is less than 10000 but experience is more than 10 years then 0.35%, 
--if salary is less than 3000 then commission is 0.25%. In the remaining cases commission is 0.15%.


declare

v_com employees.commission_pct%type;
v_sal employees.salary%type;
v_exp number;
begin

select salary,ceil((sysdate-hire_date)/365) into v_sal,v_exp from employees where employee_id=150;
dbms_output.put_line('salary is '||v_sal||' with expreience'||v_exp);
case when v_sal>10000 then v_com:=0.4;
    when v_sal<3000 then v_com:=0.25;
    when v_sal<10000 and v_exp>10 then v_com:=0.35;
    else v_com:=0.15;
    end case;
    
    dbms_output.put_line('commision is '||v_com);
    update employees set commission_pct = v_com where employee_id=150;


end;