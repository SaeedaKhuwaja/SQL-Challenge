--importing csv files
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salary;
SELECT * FROM titles;

--DATA ANALYSIS

--1. List the employee number, last name, first name, sex, and salary of each employee.
CREATE TABLE one(
	emp_no INT,
	last_name VARCHAR, 
	first_name VARCHAR, 
	sex VARCHAR, 
	salary INT
);
INSERT INTO one
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salary.salary
FROM employees
LEFT JOIN salary
ON employees.emp_no= salary.emp_no
ORDER BY employees.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
CREATE TABLE two(
	emp_no INT, 
	first_name VARCHAR, 
	last_name VARCHAR,
	hire_date DATE
);
INSERT INTO two
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date
BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY employees.emp_no;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
CREATE TABLE three(
	dept_no VARCHAR, 
	dept_name VARCHAR,
	emp_no INT,
	last_name VARCHAR,
	first_name VARCHAR
);
INSERT INTO three
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no
ORDER BY employees.emp_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name
CREATE TABLE four(
	dept_no VARCHAR, 
	emp_no INT,
	last_name VARCHAR,
	first_name VARCHAR,
	dept_name VARCHAR
);
INSERT INTO four
SELECT departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
ORDER BY employees.emp_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
CREATE TABLE five(
	emp_no INT,
    emp_title_id VARCHAR,
    birth_date DATE,
    first_name VARCHAR,
    last_name VARCHAR,
    sex VARCHAR,
    hire_date DATE
);
INSERT INTO five
SELECT * FROM employees
WHERE first_name LIKE 'Hercules'
AND last_name LIKE 'B%'
ORDER BY emp_no;

--6. List each employee in the Sales department, including their employee number, last name, and first name
CREATE TABLE six(
	emp_no INT,
    last_name VARCHAR,
	first_name VARCHAR,
    dept_name VARCHAR
);
INSERT INTO six
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name LIKE 'Sales'
ORDER BY employees.emp_no;

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE TABLE seven(
	emp_no INT,
    last_name VARCHAR,
	first_name VARCHAR,
    dept_name VARCHAR
);
INSERT INTO seven
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name LIKE 'Sales' 
OR departments.dept_name LIKE 'Development'
ORDER BY employees.emp_no;

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
CREATE TABLE eight(
	last_name VARCHAR,
	frequency BIGINT
);
INSERT INTO eight
SELECT last_name, 
COUNT (last_name) AS Frequency
FROM employees
GROUP BY last_name
ORDER BY
COUNT (last_name) DESC





