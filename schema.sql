-- data/departments.csv 9 rows
CREATE TABLE IF NOT EXISTS Departments (
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(25) NOT NULL UNIQUE
);

-- data/titles.csv 331603 rows
CREATE TABLE IF NOT EXISTS Titles (
    title_id CHAR(5) PRIMARY KEY,
    title VARCHAR(25) NOT NULL UNIQUE
);

-- data/employees.csv 300024 rows
CREATE TABLE IF NOT EXISTS Employees (
    emp_no INT PRIMARY KEY,
    emp_title_id CHAR(5) NOT NULL,
    birth_date VARCHAR(10) NOT NULL,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date VARCHAR(10) NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES Titles (title_id)
);

-- data/dept_emp.csv 331603 rows
CREATE TABLE IF NOT EXISTS Dept_emp (
    emp_no INT,
    dept_no CHAR(4),
    PRIMARY KEY (emp_no,dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments (dept_no)
);

-- data/dept_manager.csv 24 rows
CREATE TABLE IF NOT EXISTS Dept_manager (
    dept_no CHAR(4) NOT NULL,
    emp_no INT PRIMARY KEY,
    FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

-- data/salaries.csv 300024 rows
CREATE TABLE IF NOT EXISTS Salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);