-- CHALLENGE
-- PART 1
-- Number of [titles] retiring
SELECT ce.emp_no, ce.first_name, ce.last_name, t.title, t.from_date, s.salary
INTO retirement_titles
FROM current_emp as ce
	RIGHT JOIN titles as t
		ON ce.emp_no = t.emp_no
	RIGHT JOIN salaries as s
		ON ce.emp_no = s.emp_no;

-- Part 1: Duplicate employee records
SELECT emp_no, first_name, last_name, COUNT(*)
INTO duplicate_records
FROM retirement_titles
GROUP BY (emp_no, first_name, last_name)
HAVING COUNT(*)>1
ORDER BY (first_name, last_name);

-- Part 1: delete duplicates and only keeping the lastest titles using PARTITION
SELECT emp_no, first_name, last_name, title, from_date, salary
INTO latest_titles
FROM
	(SELECT *, 
            ROW_NUMBER() 
            OVER  ( PARTITION BY (first_name, last_name)
                    ORDER BY from_date DESC) 
	FROM retirement_titles) tmp
WHERE ROW_NUMBER = 1;

-- Who's ready to be a mentor?
SELECT e.emp_no, e.first_name, e.last_name, t.title, de.from_date, de.to_date
INTO mentorship
FROM employees as e
    INNER JOIN dept_emp as de
            ON e.emp_no = de.emp_no
    INNER JOIN titles as t
            ON e.emp_no = t.emp_no
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY (e.first_name, e.last_name);

