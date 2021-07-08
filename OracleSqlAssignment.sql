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

--16. Display first name and last name after converting the first letter of each name to upper case and the rest to lower case.
select initcap(first_name), initcap(last_name) from employees;

--17. Display the first word in job title.
select job_title,substr(job_title,1,instr(job_title, ' ')-1) from jobs;

--18. Display the length of first name for employees where last name contain character ‘b’ after 3rd position.
select first_name, last_name from employees where instr(last_name, 'b')>3;

--19. Display first name in upper case and email address in lower case for employees where the first name and email address are same irrespective of the case.
select upper(first_name), lower(email) from employees where lower(first_name) = lower(email);

--20. Display employees who joined in the current year
select * from employees where to_char(hire_date, 'yyyy')= to_char(sysdate, 'yyyy');

--21. Display the number of days between system date and 1st January 2011.
select sysdate - to_date('01-Jan-2011') from dual;

--22. Display how many employees joined in each month of the current year
select to_char(hire_date,'MM'), count(*) from employees where to_char(hire_date, 'yyyy') = to_char(sysdate, 'yyyy') group by to_char(hire_date,'MM');
--select to_char(hire_date,'MM'), count(*) from employees where to_char(hire_date, 'yyyy') = 2002 group by to_char(hire_date,'MM');

--23. Display manager ID and number of employees managed by the manager.
select manager_id,count(*) from employees group by manager_id;

--24. Display employee ID and the date on which he ended his previous job.
select employee_id, max(end_date) from job_history group by employee_id;

--25. Display number of employees joined after 15th of the month.
select * from employees where to_char(hire_date,'dd')>15;

--26. Display the country ID and number of cities we have in the country.
select country_id, count(city) from locations group by country_id;

--27. Display average salary of employees in each department who have commission percentage.
select department_id, avg(salary) from employees where commission_pct is not null group by department_id; 

--28. Display job ID, number of employees, sum of salary, and difference between highest salary and lowest salary of the employees of the job.
select job_id, count(*), sum(salary), max(salary)-min(salary) from employees group by job_id;

--29. Display job ID for jobs with average salary more than 10000.
select job_id,avg(salary) from employees group by job_id having avg(salary) > 10000;

--30. Display years in which more than 10 employees joined.
select to_char(hire_date, 'yyyy'), count(*) from employees group by to_char(hire_date, 'yyyy') having count(*) >10;

--31. Display departments in which more than five employees have commission percentage.
select * from departments where department_id in (select department_id from employees where commission_pct is not null group by department_id having count(*)>5);

--32. Display employee ID for employees who did more than one job in the past.
select employee_id, count(*) from job_history group by employee_id having count(employee_id)>1;

--33. Display job ID of jobs that were done by more than 3 employees for more than 100 days.
select job_id, count(employee_id) from job_history where end_date-start_date>100 group by job_id having count(employee_id)>3;

--34. Display department ID, year, and Number of employees joined.
select department_id, to_char(hire_date, 'yyyy'), count(*) from employees group by department_id, to_char(hire_date, 'yyyy');

--35. Display departments where any manager is managing more than 5 employees.
select distinct department_id from employees group by department_id, manager_id having count(*)>5;

--36. Change salary of employee 115 to 8000 if the existing salary is less than 6000.
update employees set salary = 8000 where employee_id = 115 and salary < 6000; 

--37. Insert a new employee into employees with all the required details.
desc employees;
insert into employees values(207, 'John','Cena','JCENA','123.412.4567',sysdate, 'IT_PROG', 20000,null,200, 60);

--38. Delete department 20.



--39. Change job ID of employee 110 to IT_PROG if the employee belongs to department 10 and the existing job ID does not start with IT.


--40. Insert a row into departments table with manager ID 120 and location ID in any location ID for city Tokyo.


























