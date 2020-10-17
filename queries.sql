select * from employees;

select first_name,job_id,salary,
case when job_id='SH_CLERK' then  salary*0.2
     when job_id='AD_ASST' then salary*0.1
     else salary
     end as salary_after_TAX
     
    from employees where job_id in('SH_CLERK','AD_ASST');
    
    create table hr.emp_edu(
    empno number(4),
    ename varchar2(10),
    major varchar2(10),
    uni varchar2(10),
    gpa number(2,1)
    );
    commit;
    select * from emp_edu;