CREATE TABLE IF NOT EXISTS departments (
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(25) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS titles (
    title_id CHAR(5) PRIMARY KEY,
    title VARCHAR(25) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS employees (
    emp_no INTEGER PRIMARY KEY,
    emp_title_id CHAR(5) NOT NULL,
    birth_date VARCHAR(10) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date VARCHAR(10) NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE IF NOT EXISTS dept_emp (
    emp_no INTEGER NOT NULL UNIQUE,
    dept_no CHAR(4) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE IF NOT EXISTS dept_manager (
    dept_no CHAR(4) NOT NULL,
    emp_no INTEGER NOT NULL UNIQUE,
	PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE IF NOT EXISTS salaries (
    emp_no INTEGER NOT NULL UNIQUE,
    salary INTEGER NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
