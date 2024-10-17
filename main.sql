--Data Engineering

--departments.csv
CREATE TABLE IF NOT EXISTS Departments (
    dept_no CHAR(4) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(25) NOT NULL
);

--titles.csv
CREATE TABLE IF NOT EXISTS Titles (
    title_id CHAR(5) NOT NULL PRIMARY KEY,
    title VARCHAR(25) NOT NULL
);

--employees.csv
CREATE TABLE IF NOT EXISTS Employees (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id CHAR(5) NOT NULL,
    birth_date VARCHAR(10) NOT NULL,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date VARCHAR(10) NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES Titles (title_id)
);

--dept_emp.csv
CREATE TABLE IF NOT EXISTS Dept_emp (
    emp_no INT NOT NULL,
    dept_no CHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments (dept_no)
);

--dept_manager.csv
CREATE TABLE IF NOT EXISTS Dept_manager (
    dept_no CHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

--salaries.csv
CREATE TABLE IF NOT EXISTS Salaries (
    emp_no INT NOT NULL PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);


--Data Analysis



