-- Deliverable 1

SELECT * FROM titles;

SELECT  
em.emp_no,
em.first_name,
em.last_name,
tit.title,
tit.from_date,
tit.to_date
INTO retirement_titles
FROM employees as em
INNER JOIN titles as tit
ON (em.emp_no = tit.emp_no)

WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no, to_date DESC;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- retrieve the number of titles
--SELECT DISTINCT ON (title)
--title
--INTO list_titles
--FROM retirement_titles


SELECT title, COUNT(*)
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;

-----------------------------------------------------------------------------------------------------------------
-- Deliverable 2

SELECT DISTINCT ON (emp_no)  
em.emp_no,
em.first_name,
em.last_name,
em.birth_date,
dp.from_date,
dp.to_date,
tit.title
INTO mentorship_eligibilty
FROM employees as em
INNER JOIN dept_emp as dp
ON (em.emp_no = dp.emp_no)
INNER JOIN titles as tit
ON (em.emp_no = tit.emp_no)
WHERE (dp.to_date = '9999-01-01')
AND (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY em.emp_no, to_date DESC;

