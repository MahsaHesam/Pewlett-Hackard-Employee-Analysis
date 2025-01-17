-- Checking details of my tables
Select * from departments;
Select * from dept_emp;
Select * from dept_manager;
Select * from employees;
Select * from salaries;
Select * from titles;

-- 1. List the employee number, last name, first name, sex, and salary of each employee.

select 
e.emp_no, 
e.first_name, 
e.last_name, 
e.sex,
s.salary
from employees as e
join salaries as s on e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

select 
first_name , 
last_name ,
hire_date
from employees
where hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3.List the manager of each department along with their department number, department name, employee number, last name, and first name.

select 
d.dept_no, 
dp.dept_name, 
d.emp_no, 
e.last_name,
e.first_name		
from dept_manager as d
join departments as dp on dp.dept_no = d.dept_no
join employees as e on d.emp_no = e.emp_no;

-- 4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select 
d.dept_no, 
e.emp_no, 
e.last_name, 
e.first_name, 
dp.dept_name
from dept_emp as d
join employees as e on d.emp_no = e.emp_no
join departments as dp on dp.dept_no = d.dept_no;

-- 5.List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

select 
first_name, 
last_name, 
sex
from employees
where first_name='Hercules' and last_name like 'B%';


--6. List each employee in the Sales department, including their employee number, last name, and first name.

select 
de.emp_no, 
e.last_name, 
e.first_name
from departments as dp
join dept_emp as de on dp.dept_no = de.dept_no
join employees as e on de.emp_no = e.emp_no
where dp.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

select 
de.emp_no, 
e.last_name, 
e.first_name , 
dp.dept_name
from departments as dp
join dept_emp as de on dp.dept_no = de.dept_no
join employees as e on de.emp_no = e.emp_no
where dp.dept_name = 'Sales' or dp.dept_name = 'Development';

-- 8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT 
last_name, 
COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;