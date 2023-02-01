-- #1 : List employee number, last name, first name, sex, and salary 

SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON (e.emp_no = s.emp_no);

-- #2 : List first name, last name, hire date for employees hired in 1986

SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE e.hire_date LIKE '%1986';
---- the data type Date didn't work in create table part so it's a string

-- #3 : List first name, last name, employee number, department number, department name of the managers

SELECT e.first_name, e.last_name, dm.emp_no, dm.dept_no, d.dept_name
FROM departments d
JOIN dept_manager dm 
ON (dm.dept_no = d.dept_no)
	JOIN employees e
	ON (e.emp_no = dm.emp_no);
	
-- #4 : List each employee's first & last name, employee number, department number, department name

SELECT e.first_name, e.last_name, de.emp_no, de.dept_no, d.dept_name
FROM dept_emp de
JOIN employees e 
ON (e.emp_no = de.emp_no)
	JOIN departments d
	ON (de.dept_no = d.dept_no);

-- #5 : List first name, last name, sex for employees named 'Hercules' and a last name starting with B

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
	AND last_name LIKE 'B%';

-- #6 : List each employee in Sales department - first name, last name, employee number

SELECT e.first_name, e.last_name, de.emp_no
FROM dept_emp de
JOIN employees e 
ON (e.emp_no = de.emp_no)
	JOIN departments d
	ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales';

-- #7 : List each employee in Sales and Development department - first name, last name, employee number, department name

---- If question is asking employees in multiple departments (1 employee in both sales + development) - nothing comes up (0 results)
---- Removing the 'WHERE d.dept_name IN ('Sales', 'Development)' line in subquery allows you to check that the code works
SELECT e.first_name, e.last_name, de.emp_no, d.dept_name
FROM dept_emp de
JOIN employees e 
ON (e.emp_no = de.emp_no)
	JOIN departments d
	ON (de.dept_no = d.dept_no)
WHERE e.emp_no IN (
	SELECT de.emp_no
	FROM dept_emp de
	JOIN employees e 
	ON (e.emp_no = de.emp_no)
		JOIN departments d
		ON (de.dept_no = d.dept_no)
	WHERE d.dept_name IN ('Sales', 'Development')
	GROUP BY de.emp_no
	HAVING COUNT(DISTINCT d.dept_name) > 1
);

---- If question is simply asking sales OR development:
SELECT e.first_name, e.last_name, de.emp_no, d.dept_name
FROM dept_emp de
JOIN employees e 
ON (e.emp_no = de.emp_no)
	JOIN departments d
	ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development');

-- #8 : List frequency counts in descending order, of all employee last names
SELECT last_name, COUNT(last_name) AS Frequency
FROM employees 
GROUP BY last_name
ORDER BY Frequency DESC


 

