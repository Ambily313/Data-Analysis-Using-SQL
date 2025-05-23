use employee

-- 1. View all records

Select * from employees;

-- 2.Find employees older than 30

Select * from employees where age >30;

-- 3.List all employees in IT department with a salary greater than 70,000

select * from employees where Department= 'IT' and Salary > 70000;

-- 4. Sort employees by salary (descending)

select * from employees 
order by salary desc;

-- 5. List employees with salaries above 60,000

select * from employees where Salary >60000;

-- 6.Get distinct departments.

select distinct department from employees;

-- 7.Find employees whose name starts with "A"

select * from employees where Emp_name like 'a%';

-- 8.Count the number of employees in each department

select department,count(*) from employees group by department;

-- 9.Find the highest salary

select * from  employees where salary=(select max(salary) from employees);
 
 -- Finds the max salary and returns all employees with that salary.
 
select * FROM employees 
where salary = (select salary from employees order by  salary desc limit 1);
  
-- 10 Find the lowest salary in the HR department

select * from employees order by salary asc limit 1;

-- 11.Get the average salary of all employees.

select avg(salary) from employees;

-- 12 Find employees between ages 25 and 35.

select * from employees where age between 25 and 35  order by age;

-- 13.Show employees in the Finance department with salary > 50,000.

select * from employees where Department='Finance' and salary > 50000
order by salary;

-- 14. Count employees earning more than 70,000

select count(*) from employees where salary > 70000;

-- 15. Find employees with the 2nd highest salary

select * from employees order by salary desc limit 1 offset 1;

-- 16. Get department-wise salary expenditure.

select department,sum(salary) as SalaryExpenditure from employees group by Department order by salaryexpenditure;

-- 17. Retrieve the top 5 highest-paid employees.

select * from employees order by salary desc limit 5;

-- 18. Find employees earning below the department average.

select  e.* 
from employees e
where salary < (
select avg(salary ) from employees where department=e.department )


-- 19. Show the youngest employee in each department

select Department,min(age) from employees group by Department

   --  OR
   
select  e.* 
from employees e 
where age=(select min(age) from employees where department=e.department)
order by department

-- 20. Get the median salary.




-- 21. List employees who have the same salary.

select 
    Emp_id,
    Emp_name,
    Age,
    Department,
    Salary
from (
    select *, count(*) over (partition by  Salary) as same_salary_count
    from employees
) as subquery
where same_salary_count > 1
order by Salary, Emp_id;

-- 22.Rank employees by salary within each department.

 select *, dense_rank()  over(partition by department order by salary desc) as Emp_rank
 from employees;
 
-- 23.  Calculate salary percentile for each employee

select
    Emp_id,Emp_name,Age,Department,Salary,
    ROUND(cume_dist() over (order by Salary) * 100, 2) as salary_percentile
from employees;

-- 24.Identify salary gaps between departments.

select  department,
max(salary)- min(salary) as salary_gap,
max(salary) as highest_salary,
min(salary) as lowest_salary
from employees
group by department;
 



-- 25.


