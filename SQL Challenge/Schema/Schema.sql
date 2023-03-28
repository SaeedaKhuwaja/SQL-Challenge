--DATA ENGINEERING

--DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
    title_id VARCHAR (30) NOT NULL ,
    title VARCHAR (30)  NOT NULL ,
    PRIMARY KEY (
        title_id
    )
);

--DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_no INT  NOT NULL ,
    emp_title_id VARCHAR (30)  NOT NULL ,
    birth_date DATE  NOT NULL ,
    first_name VARCHAR (30)  NOT NULL ,
    last_name VARCHAR (30)  NOT NULL ,
    sex VARCHAR (30) NOT NULL ,
    hire_date DATE  NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
	PRIMARY KEY (
        emp_no
    )
);

--DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_no VARCHAR (30) NOT NULL ,
    dept_name VARCHAR (30) NOT NULL ,
	PRIMARY KEY (
        dept_no
    )
);

--DROP TABLE IF EXISTS dept_manager;

CREATE TABLE dept_manager (
    dept_no VARCHAR (30) UNIQUE ,
    emp_no INT  UNIQUE,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (
        dept_no, emp_no
    )
);

--DROP TABLE IF EXISTS dept_emp;

CREATE TABLE dept_emp (
    emp_no INT  NOT NULL ,
    dept_no VARCHAR (30) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (
		emp_no, dept_no
    )
);

--DROP TABLE IF EXISTS salary;
CREATE TABLE salary (
    emp_no INT  NOT NULL ,
    salary INT  NOT NULL ,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (
        emp_no
    )
);


