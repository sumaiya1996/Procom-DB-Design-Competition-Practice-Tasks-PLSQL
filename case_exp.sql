select salary  from employees where job_id='AC_MGR' and employee_id=205;  

declare

v_jobid varchar(20);
sal_inc number;
org_sal number;
v_total number;

begin

select distinct job_id into v_jobid from employees where job_id='AC_MGR';
dbms_output.put_line(v_jobid);

sal_inc:=case when v_jobid='AC_MGR' then 0.2
              when v_jobid='SH_CLERK' then 0.1
        else 0
        end ;
select salary into org_sal  from employees where job_id='AC_MGR' and employee_id=205;  
dbms_output.put_line('original salary for '||v_jobid||' is '||org_sal||' and total salary is ...'||org_sal*sal_inc);
        


end;