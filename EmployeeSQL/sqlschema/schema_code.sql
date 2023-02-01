CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY NOT NULL,
    title VARCHAR(30) NOT NULL
	);

CREATE TABLE employees (
    emp_no int PRIMARY KEY NOT NULL,
    emp_title VARCHAR(30) NOT NULL,
    birth_date VARCHAR(15) NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR(5) NOT NULL,
    hire_date VARCHAR(15) NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
	);

CREATE TABLE departments (
    dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(30) NOT NULL
	);

CREATE TABLE dept_emp (
    emp_no int NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);


CREATE TABLE dept_manager (
	dept_no VARCHAR(10) NOT NULL,
    emp_no int NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);

CREATE TABLE salaries (
    emp_no int NOT NULL,
    salary int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);
