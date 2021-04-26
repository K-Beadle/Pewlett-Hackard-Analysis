-- MODULE 7 CHALLENGE 

-- Deliverable 1

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirees_title
FROM employees as e
JOIN title as t
ON (e.emp_no = t.emp_no)
Where (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

SELECT * FROM retirees_title;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirees_title
ORDER BY emp_no, to_date DESC;

SELECT COUNT(ut.title) AS "amount_retiring", ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY amount_retiring DESC;


-- Deliverable 2

-- Mentorship Eligibility
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
-- INTO mentorship_eligibility
FROM employees as e
JOIN dept_employee as de
	ON (e.emp_no = e.emp_no)
JOIN title as t
	ON (e.emp_no = e.emp_no)
WHERE de.to_date = '9999-01-01'
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM dept_employee