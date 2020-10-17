select e.employee_id,e.first_name,e.manager_id,e.department_id,d.department_id,d.department_name from employees e inner join departments d on e.department_id=d.department_id where e.department_id=100;
/
select distinct e.first_name,l.city  from employees e inner join departments d on e.department_id=d.department_id 
inner join locations l on d.location_id=l.location_id;


/
--1. Write a query in SQL to display the first name, last name, department number, and department name for each employee.
select e.first_name,e.last_name,d.department_id,d.department_name from employees e inner join departments d on e.department_id=d.department_id;

--2. Write a query in SQL to display the first and last name, department, city, and state province for each employee.
select e.first_name,e.last_name,d.department_id,d.department_name,l.city,l.state_province from employees e inner join departments d on e.department_id=d.department_id inner join locations l on d.location_id=l.location_id where e.first_name='Steven';

--3. Write a query in SQL to display the first name, last name, salary, and job grade for all employees. 
select e.first_name,e.last_name,e.salary,j.job_title from employees e inner join jobs j on e.salary between j.min_salary and j.max_salary;

--4. Write a query in SQL to display the first name, last name, department number and department name, for all employees for departments 80 or 40.
select e.first_name,e.last_name,d.department_id,d.department_name from employees e inner join departments d on e.department_id=d.department_id where e.department_id in (40,80);

--5. Write a query in SQL to display those employees who contain a letter z to their first name and also display their last name, department, city, and state province.
select e.first_name,e.last_name,d.department_id,d.department_name,l.city,l.state_province from employees e inner join departments d on e.department_id=d.department_id inner join locations l on d.location_id=l.location_id 
where e.first_name like '%z%';

--6. Write a query in SQL to display all departments including those where does not have any employee.
select DISTINCT d.department_name,d.manager_id from employees e inner join departments d on e.department_id=d.department_id or e.department_id<> d.department_id; --approach#1
select distinct d.department_name,d.manager_id from employees e right outer join departments d on e.department_id=d.department_id or e.department_id<> d.department_id; --approach#2

--7. Write a query in SQL to display the first and last name and salary for those employees who earn less than the employee earn whose number is 182.
select first_name,last_name,salary from employees  where salary<(select salary FROM employees WHERE employee_id=182);

--8. Write a query in SQL to display the first name of all employees including the first name of their manager.
select e.first_name emp_name,m.first_name manager_name from employees e inner join employees m on e.manager_id=m.employee_id ;

--9. Write a query in SQL to display the department name, city, and state province for each department. 
select d.department_name,l.city,l.state_province from departments d inner join locations l on d.location_id=l.location_id;

--10. Write a query in SQL to display the first name, last name, department number and name, for all employees who have or have not any department.
select e.first_name,e.last_name,d.department_id, d.department_name from employees e left outer join departments d on e.department_id=d.department_id ;

--11. Write a query in SQL to display the first name of all employees and the first name of their manager including those who does not working under any manager.
select e.first_name emp_name,m.first_name manager_name from employees e left outer join employees m on e.manager_id=m.employee_id ;

--12. Write a query in SQL to display the first name, last name, and department number for those employees who works in the same department as the employee who holds the last name as Taylor.
select first_name,last_name,department_id from employees where department_id in (select department_id from employees where last_name='Taylor');

--13. Write a query in SQL to display the job title, department name, full name (first and last name ) of employee, and starting date for all the jobs 
--which started on or after 1st January, 1993 and ending with on or before 31 August, 1997. 
select e.first_name||' '||e.last_name full_name,j.job_title,d.department_name,jh.start_date from employees e inner join departments d on e.department_id=d.department_id inner join  job_history jh 
on e.employee_id=jh.employee_id inner join jobs j on j.job_id=jh.job_id where jh.start_date>='01-JAN-93' and jh.start_date<='31-AUG-97'; 

--14. Write a query in SQL to display job title, full name (first and last name ) of employee, and the difference between maximum salary for the job and salary of the employee.
select j.job_title,e.first_name||' '||e.last_name full_name,j.max_salary-e.salary as difference from employees e inner join jobs j on e.job_id=j.job_id;

--15. Write a query in SQL to display the name of the department, average salary and number of employees working in that department who got commission.
select d.department_name,trunc(avg(e.salary)),count(e.employee_id) from employees e inner join departments d on e.department_id=d.department_id  group by d.department_name ;

--16. Write a query in SQL to display the full name (first and last name ) of employees, job title and the salary differences to their own job for those employees who is working in the department ID 80.
select e.first_name||' '||e.last_name,j.job_title,e.salary,e.job_id,j.max_salary-e.salary,j.max_salary from employees e inner join jobs j on j.job_id=e.job_id where e.department_id=80;

--17. Write a query in SQL to display the name of the country, city, and the departments which are running there. 
select d.department_name,co.country_name,l.city from countries co inner join locations l on l.country_id = co.country_id inner join departments d on l.location_id=d.location_id;

--18. Write a query in SQL to display department name and the full name (first and last name) of the manager.
select d.department_name,e.first_name||' '||e.last_name from departments d inner join employees e on d.manager_id=e.employee_id;

--19. Write a query in SQL to display job title and average salary of employees.
select j.job_title,avg(e.salary) from jobs j inner join employees e on j.job_id=e.job_id group by j.job_title;

--20. Write a query in SQL to display the details of jobs which was done by any of the employees who is presently earning a salary on and above 12000.
select j.*,e.employee_id,e.first_name,e.salary from job_history j inner join employees e on j.employee_id=e.employee_id where e.salary>=12000;

--21. Write a query in SQL to display the country name, city, and number of those departments where at least 2 employees are working.
select c.country_name,l.city,count(d.department_id) from countries c inner join locations l on l.country_id = c.country_id inner join departments d on l.location_id=d.location_id
where d.department_id in (select department_id from employees group by department_id having count(department_id)>=2) group by  c.country_name,l.city;

--22. Write a query in SQL to display the department name, full name (first and last name) of manager, and their city.
select d.department_name,e.first_name||' '||e.last_name manager_name,l.city from departments d inner join employees  e on d.manager_id=e.employee_id  inner join locations l on d.location_id=l.location_id;

--23. Write a query in SQL to display the employee ID, job name, number of days worked in for all those jobs in department 80.
select jh.employee_id,j.job_title,trunc(jh.end_date-jh.start_date) days,jh.department_id from job_history jh inner join jobs j on jh.job_id=j.job_id  WHERE jh.department_id=80;

--24. Write a query in SQL to display the full name (first and last name), and salary of those employees who working in any department located in London.
select e.first_name||' ' ||e.last_name,e.salary,l.city,d.department_name from employees e inner join departments d on e.department_id=d.department_id inner join locations l on d.location_id=l.location_id where l.city='London'; 

                                                    --(WRONG)
---25. Write a query in SQL to display full name(first and last name), job title, starting and ending date of last jobs for those employees with worked without a commission percentage.
select e.employee_id,e.first_name||' ' ||e.last_name,j.job_title,jh.end_date,jh.start_date,e.commission_pct from employees e inner join job_history jh on e.employee_id=jh.employee_id 
inner join jobs j on e.job_id=j.job_id where e.commission_pct=0 or e.commission_pct is null  ;

--26. Write a query in SQL to display the department name and number of employees in each of the department. 
select d.department_name,count(e.employee_id) no_of_emp from employees e inner join departments d on e.department_id=d.department_id group by d.department_name;

--27. Write a query in SQL to display the full name (firt and last name ) of employee with ID and name of the country presently where (s)he is working.
select e.first_name||' ' ||e.last_name,e.employee_id,c.country_name from employees e inner join departments d on e.department_id=d.department_id inner join locations l on d.location_id=l.location_id 
inner join countries c on l.country_id=c.country_id order by e.employee_id; 

