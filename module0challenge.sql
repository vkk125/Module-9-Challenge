CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,	title VARCHAR 
);
--SELECT * FROM titles

CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

--SELECT * FROM employees

CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR 
);
--SELECT * FROM departments


CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no INT, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);
--SELECT * FROM departments
CREATE TABLE dept_emp(
	emp_no INT, 
	dept_no VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

--SELECT * FROM dept_emp

CREATE TABLE salaries(
	emp_no INT, 
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--SElECT * FROM salaries

--employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, 
employees.first_name,employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries
ON salaries.emp_no=employees.emp_no;

--List first name, last name, and hire date 
--for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with :
--department number, department name, the manager's employee number, last name, first name.

SELECT employees.last_name, employees.first_name, dept_manager.emp_no,
departments.dept_no, departments.dept_name, employees.emp_no
FROM dept_manager
INNER JOIN departments
ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees
ON employees.emp_no=dept_manager.emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name,employees.first_name,departments.dept_name
FROM departments
INNER JOIN dept_emp
ON departments.dept_no=dept_emp.dept_no
INNER JOIN employees
ON dept_emp.emp_no=employees.emp_no;

--List first name, last name, and sex for employees 
--whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, 
--employee number, last name, first name, and department name.

SELECT 
employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM departments
INNER JOIN dept_emp
ON departments.dept_no=dept_emp.dept_no
INNER JOIN employees
ON dept_emp.emp_no=employees.emp_no
WHERE departments.dept_name = 'Sales';
--List all employees in the Sales and Development departments
--including their employee number, last name, first name, and department name.

SELECT 
employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM departments
INNER JOIN dept_emp
ON departments.dept_no=dept_emp.dept_no
INNER JOIN employees
ON dept_emp.emp_no=employees.emp_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';
--List the frequency count of employee last names
--(i.e., how many employees share each last name) 
--in descending order.
SELECT last_name,COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;