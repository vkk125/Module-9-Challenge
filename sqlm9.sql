CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR 
);
--SELECT * FROM titles

CREATE TABLE emp(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

--SELECT * FROM emp

CREATE TABLE dept(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR 
);
--SELECT * FROM dept

