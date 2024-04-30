-- Dropping existing tables
Drop table departments CASCADE;
Drop table employees CASCADE;
Drop table departments;
Drop table dept_emp;
Drop table dept_manager;
Drop table employees;
Drop table salaries;
Drop table titles;

--Checking created tables
Select * from departments;
Select * from dept_emp;
Select * from dept_manager;
Select * from employees;
Select * from salaries;
Select * from titles;


-- Creating tables for Departments
Create table departments(
	Primary key (dept_no),
	dept_no Varchar(30) Not Null,
	dept_name Varchar(30) Not Null
	
);

-- Creating tables for dept_emp
Create table dept_emp(
	Primary key (emp_no,dept_no),
	Foreign key (dept_no) references departments(dept_no),
	Foreign key (emp_no) references employees(emp_no),
	emp_no Int Not Null,
	dept_no Varchar(30) Not Null
);

-- Creating tables for dept_manager
Create table dept_manager(
	Primary key (dept_no,emp_no),
	Foreign key (dept_no) references departments(dept_no),
	Foreign key (emp_no) references employees(emp_no),
	dept_no Varchar(30) Not Null,
	emp_no Int Not Null


);

-- Creating tables for employees
Create table employees(
	Primary key (emp_no),
	Foreign key (emp_title_id) references titles(title_id),
	emp_no Int Not Null,
	emp_title_id Varchar(30),
	birth_date Date Not Null,
	first_name varchar(30) Not Null,
	last_name Varchar(30) Not Null,
	sex char Not Null,
	hire_date Date Not Null
);	

-- Creating tables for Salaries
Create table salaries(
	Foreign key (emp_no) references employees(emp_no),
	emp_no Int Not Null,
	salary Int Not Null
);


-- Creating tables for titles
Create table titles(
	Primary key (title_id),
	title_id Varchar(30) Not Null,
	title Varchar(30) Not Null

);
