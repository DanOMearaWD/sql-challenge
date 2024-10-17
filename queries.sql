--TEST IMPORTS - COUNTS SHOULD MATCH CSVS
SELECT COUNT(*)
FROM Departments; --SHOULD BE 9

SELECT COUNT(*)
FROM Titles; --SHOULD BE 7

SELECT COUNT(*)
FROM Employees; --SHOULD BE 300024

SELECT COUNT(*)
FROM Dept_emp; --SHOULD BE 331603

SELECT COUNT(*)
FROM Dept_manager; --SHOULD BE 24

SELECT COUNT(*)
FROM Salaries; --SHOULD BE 300024



--1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

--3. List the manager of each department along with their department number, department name,
--employee number, last name, and first name.

--4. List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name.


--5. List first name, last name, and sex of each employee whose first name is Hercules and
--whose last name begins with the letter B.


--6. List each employee in the Sales department, including their employee number, last name,
--and first name.


--7. List each employee in the Sales and Development departments, including their employee number,
--last name, first name, and department name.


--8. List the frequency counts, in descending order, of all the employee last names
--(that is, how many employees share each last name).


