## QuickDBD script for ERD


departments
--
dept_no VARCHAR(10) pk
dept_name VARCHAR(30)

dept_emp
--
dept_no VARCHAR(10) fk >- departments.dept_no
emp_no int FK - employees.emp_no

dept_manager
--
dept_no VARCHAR(10) fk >- departments.dept_no
emp_no int

employees
--
emp_no int pk
emp_title VARCHAR(10) FK - titles.title_id
birth_date date(DD/MM/YY)
first_name VARCHAR(15)
last_name VARCHAR(20)
sex VARCHAR(1)
hire_date date(DD/MM/YY)

salaries
--
emp_no int fk - employees.emp_no
salary int 

titles
--
title_id pk VARCHAR(10)
title VARCHAR(30)
