select * from employees;
select * from departments;
select * from jobs;
select * from job_history;
select * from locations;
select * from regions;
select * from countries;

--1. Display details of jobs where the minimum salary is greater than 10000.
select * from jobs where min_salary > 10000;

--2. Display the first name and join date of the employees who joined between 2002 and 2005.
select first_name, hire_date from employees where to_char(hire_date,'yyyy') between 2002 and 2005;

--3. Display first name and join date of the employees who is either IT Programmer or Sales Man
select first_name, hire_date from employees where job_id in (select job_id from jobs where job_title in('Programmer', 'Sales Manager'));

--4. Display employees who joined after 1st January 2008
select * from employees where hire_date > '01-Jan-2008';

--5. Display details of employee with ID 150 or 160.
select * from employees where employee_id in (150, 160);

--6. Display first name, salary, commission pct, and hire date for employees with salary less than 10000.
select first_name, salary, commission_pct, hire_date from employees where salary < 10000;

--7. Display job Title, the difference between minimum and maximum salaries for jobs with max salary in the range 10000 to 20000.
select job_title, max_salary-min_salary difference from jobs where max_salary between 10000 and 20000;

--8. Display first name, salary, and round the salary to thousands.
select first_name, salary, round(salary, -3) from employees;

--9. Display details of jobs in the descending order of the title.
select * from jobs order by job_title desc;

--10. Display employees where the first name or last name starts with S.
select * from employees where first_name like 'S%' or last_name like 's%';

--11. Display employees who joined in the month of May.
select * from employees where to_char(hire_date,'Mon') = 'May';

--12. Display details of the employees where commission percentage is null and salary in the range 5000 to 10000 and department is 30.
select * from employees where commission_pct = null and salary between 5000 and 10000 and department_id = 30;

--13. Display first name and date of first salary of the employees.
select first_name, hire_date, last_day(hire_date)+1 from employees;

--14. Display first name and experience of the employees.


--15. Display first name of employees who joined in 2001.
select first_name,hire_date from employees where to_char(hire_date,'yyyy')= 2001;




























