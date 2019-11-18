--Queries in Module 7 Lesson
-- Search for employees born in 1952, 1953, 1954 and 1955
-- 1952
Select first_name, last_name
from employees
where birth_date between '1952-01-01' and '1952-12-31';
-- 1953
Select first_name, last_name
from employees
where birth_date between '1953-01-01' and '1953-12-31';
-- 1954
Select first_name, last_name
from employees
where birth_date between '1954-01-01' and '1954-12-31';
-- 1955
Select first_name, last_name
from employees
where birth_date between '1955-01-01' and '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- NUmber of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create list of employees retiring
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

Drop table retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

--Get department for employees retiring
SELECT first_name, last_name, dept_no
FROM retirement_info as r
LEFT JOIN dept_emp as de ON r.emp_no = de.emp_no;

-- Joining departments and dept_manager tables
SELECT d.dept_name, dm.emp_no, dm.from_date, dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

--JOining retirement_info and dept_emp tables
SELECT r.emp_no, r.first_name, r.last_name, de.to_date
FROM retirement_info as r
LEFT JOIN dept_emp as de
ON r.emp_no = de.emp_no;

--List of all retirement-eligible employees
SELECT ri.emp_no, ri.first_name, ri.last_name, de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE (de.to_date = '9999-01-01');

-- Employee count by department number
SELECT count(ce.emp_no), de.dept_no
INTO dept_count 
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- List 1: EMployee information
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary, de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no = s.emp_no
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 	AND (de.to_date = '9999-01-01');
		
-- List 2: Management
-- List of managers per department
SELECT	dm.dept_no,
		d.dept_name,
		dm.emp_no,
		ce.last_name,
		ce.first_name,
		dm.from_date,
		dm.to_date
-- INTO dept_info
FROM dept_manager as dm
	INNER JOIN departments as d
		ON dm.dept_no = d.dept_no
	INNER JOIN current_emp as ce
		ON dm.emp_no = ce.emp_no;

-- List 3: Department retirees
-- LIST 3 pilot
SELECT 	ce.emp_no, 
		ce.first_name,
		ce.last_name,
		d.dept_name
-- INTO list3
FROM current_emp as ce
	LEFT JOIN dept_emp as de
		ON ce.emp_no = de.emp_no
	LEFT JOIN departments as d
		ON de.dept_no = d.dept_no;

-- Create a tailored list for the Sales team
-- List of sales employees retiring
SELECT ri.emp_no, ri.first_name, ri.last_name, d.dept_name
INTO sales_retirees
FROM retirement_info as ri
	LEFT JOIN dept_emp as de
		ON ri.emp_no = de.emp_no
	LEFT JOIN departments as d
		ON de.dept_no = d.dept_no
WHERE (d.dept_name = 'Sales');

-- List of sales and Development employees retiring
SELECT ri.emp_no, ri.first_name, ri.last_name, d.dept_name
-- INTO sales_retirees
FROM retirement_info as ri
	LEFT JOIN dept_emp as de
		ON ri.emp_no = de.emp_no
	LEFT JOIN departments as d
		ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');