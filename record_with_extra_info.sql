declare

type t_emp_edu is record (
                        major varchar2(20),
                        uni varchar2(30),
                        gpa number(2,1),
                        emp_rec employees%rowtype
                );
                
                emp_details t_emp_edu;


begin

emp_details.major:='BSSE';
emp_details.uni:='MIT';
emp_details.gpa:=3.4;

select * into emp_details.emp_rec from employees where employee_id=179;
dbms_output.put_line(emp_details.emp_rec.first_name||' studied from '||emp_details.uni||' with major '||emp_details.major ||' having gpa '||emp_details.gpa);

insert into emp_edu values(emp_details.emp_rec.employee_id,emp_details.emp_rec.first_name,emp_details.major,emp_details.uni,emp_details.gpa);

end;