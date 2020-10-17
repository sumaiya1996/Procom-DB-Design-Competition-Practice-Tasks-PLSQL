--Display Job Title and Name of the Employee who joined the job first day.
DECLARE


begin
for rec in (select e.first_name,e.last_name,j.job_id  from employees e inner join jobs j on e.job_id=j.job_id where hire_date=(select min(hire_date) from employees where job_id=e.job_id)) loop 
dbms_output.put_line(rec.first_name||' '||rec.last_name||' ('||rec.job_id||')');
end loop;
end;