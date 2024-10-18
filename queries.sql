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

--3. List the manager of each department along with their department number, department
--name, employee number, last name, and first name.
SELECT t.title, dm.dept_no, d.dept_name,dm.emp_no,e.first_name,e.last_name
FROM Dept_manager dm
JOIN employees e ON dm.emp_no = e.emp_no
JOIN Departments d ON dm.dept_no = d.dept_no
JOIN titles t ON e.emp_title_id = t.title_id;


--4. List the department number for each employee along with that employee’s employee
-- number, last name, first name, and department name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
FROM employees e
JOIN Dept_emp de ON de.emp_no = e.emp_no
JOIN Departments d ON d.dept_no = de.dept_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules
--and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List each employee in the Sales department, including their employee number,
--last name, and first name.
SELECT e.emp_no, e.first_name, e.last_name
FROM employees e
JOIN Dept_emp de ON e.emp_no = de.emp_no
WHERE de.dept_no = (SELECT dept_no FROM Departments WHERE dept_name = 'Sales');

--7. List each employee in the Sales and Development departments, including their
--employee number, last name, first name, and department name.
SELECT *
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE de.dept_no IN (SELECT dept_no FROM Departments WHERE dept_name = 'Sales' OR dept_name
= 'Development');

--8. List the frequency counts, in descending order, of all the employee last names
--(that is, how many employees share each last name).
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;