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
select first_name, hire_date, ((sysdate-hire_date)/365) from employees;

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
delete from departments where department_id = 20;

--39. Change job ID of employee 110 to IT_PROG if the employee belongs to department 10 and the existing job ID does not start with IT.
update employees set job_id = 'IT_PROG' where department_id = 10 and job_id not like 'IT%';

--40. Insert a row into departments table with manager ID 120 and location ID in any location ID for city Tokyo.
insert into departments values (280, 'MEDICAL', 120, 1200);

--41. Display department name and number of employees in the department.
select d.department_name, count(*) from employees e, departments d where e.department_id = d.department_id group by department_name;

--42. Display job title, employee ID, number of days between ending date and starting date for all jobs in department 30 from job history.
select  h.employee_id, j.job_title, h.end_date - h.start_date from jobs j, job_history h where j.job_id = h.job_id and h.department_id = 30;

--43. Display department name and manager first name.
select d.department_name, e.first_name from employees e, departments d where e.employee_id = d.manager_id;

--44. Display department name, manager name, and city.
select d.department_name, e.first_name, l.city from departments d, employees e, locations l where e.employee_id = d.manager_id and d.location_id = l.location_id;

--45. Display country name, city, and department name.
select c.country_name, l.city, d.department_name from departments d, locations l, countries c where d.location_id = l.location_id and l.country_id = c.country_id;

--46. Display job title, department name, employee last name, starting date for all jobs from 2000 to 2005.
select j.job_title, d.department_name, e.last_name, h.start_date from jobs j, departments d, employees e, job_history h 
where h.job_id = j.job_id and h.department_id = d.department_id and d.department_id = e.department_id 
and to_char(start_date,'yyyy') between 2000 and 2005;

--47. Display job title and average salary of employees
select j.job_title, avg(salary) from employees e, jobs j where e.job_id = j.job_id group by j.job_title;

--48. Display job title, employee name, and the difference between maximum salary for the job and salary of the employee.
select j.job_title, e.first_name, j.max_salary-e.salary from employees e, jobs j where e.job_id = j.job_id;

--49. Display last name, job title of employees who have commission percentage and belongs to department 30.
select e.last_name, j.job_title from employees e, jobs j where e.job_id = j.job_id 
and e.department_id = 30 and e.commission_pct is not null;

--50. Display details of jobs that were done by any employee who is currently drawing more than 15000 of salary
select h.* from job_history h, employees e where e.employee_id = h.employee_id and e.salary > 15000;

--51. Display department name, manager name, and salary of the manager for all managers whose experience is more than 5 years.
select d.department_name, e.first_name, salary from employees e, departments d where e.manager_id = d.manager_id and ((sysdate - e.hire_date)/365) > 5;

--52. Display employee name if the employee joined before his manager.
select e.first_name, e.last_name from employees e, employees m where e.manager_id = m.employee_id and e.hire_date < m.hire_date;

--53. Display employee name, job title for the jobs employee did in the past where the job was done less than six months.
select e.first_name, e.last_name, j.job_title from employees e, jobs j, job_history h where e.employee_id = h.employee_id
and h.job_id = j.job_id and months_between(h.end_date,h.start_date)<6;

--54. Display employee name and country in which he is working.
select e.first_name, e.last_name, c.country_name from employees e, countries c, departments d, locations l 
where e.department_id = d.department_id and d.location_id = l.location_id and l.country_id = c.country_id;

--55. Display department name, average salary and number of employees with commission within the department.
select d.department_name, round(avg(e.salary),2), count(e.commission_pct) from employees e, departments d 
where e.department_id = d.department_id group by d.department_name;

--56. Display details of departments managed by ‘Smith’.
select * from departments where manager_id in (select employee_id from employees where first_name = 'Smith');

--57. Display jobs into which employees joined in the current year.
select * from jobs where job_id in (select job_id from employees where to_char(hire_date,'yyyy') = to_char(sysdate,'yyyy'));

--58. Display employees who did not do any job in the past.
select * from employees where employee_id not in (select employee_id from job_history);

--59. Display job title and average salary for employees who did a job in the past.
select j.job_title, avg(e.salary) from employees e, jobs j where e.job_id = j.job_id and e.employee_id in 
(select employee_id from job_history) group by j.job_title;

--60. Display country name, city, and number of departments where department has more than 5 employees.
select c.country_name, l.city, count(d.department_id) from departments d, locations l, countries c where
d.location_id = l.location_id and l.country_id = c.country_id
and d.department_id in (select department_id from employees group by department_id having count(employee_id)>5)
group by c.country_name, l.city;

--61. Display details of manager who manages more than 5 employees.
select * from employees where employee_id in (select manager_id from employees group by manager_id having count(employee_id)>5);

--62. Display employee name, job title, start date, and end date of past jobs of all employees with commission percentage null.
select e.first_name, e.last_name, j.job_title, h.start_date, h.end_date from employees e, jobs j, job_history h 
where e.employee_id = h.employee_id and h.job_id = j.job_id and e.employee_id IN 
(select employee_id from employees where commission_pct is null);

--63. Display the departments into which no employee joined in last two years.
select * from departments where department_id not in (select department_id from employees where FLOOR((SYSDATE-HIRE_DATE)/365) < 2);

--64. Display the details of departments in which the max salary is greater than 10000 for employees who did a job in the past.
select * from departments where department_id in(select department_id from employees where employee_id in
(select employee_id from job_history) group by department_id having max(salary)>10000);

--65. Display details of current job for employees who worked as IT Programmers in the past.
select * from jobs where job_id in
(select job_id from employees where employee_id in 
(select employee_id from job_history where job_id = (select job_id from jobs where job_title = 'Programmer')));

--66. Display the details of employees drawing the highest salary in the department.
select first_name, department_id, salary from employees e where salary = 
(select max(salary) from employees where department_id = e.department_id);

--67. Display the city of employee whose employee ID is 105.
select city from locations where location_id =
(select location_id from departments where department_id = 
(select department_id from employees where employee_id = 105));

--68. Display third highest salary of all employees
select salary from employees e where 2 = (select count(distinct salary) from employees where salary > e.salary);

















