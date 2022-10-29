-- Deliverable 1

SELECT ce.emp_no,
  ce.first_name,
  ce.last_name,
  ti.title,
  ti.from_date,
  ti.to_date
INTO ret_titles
FROM employees AS ce
  INNER JOIN titles AS ti
    ON (ce.emp_no = ti.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY ce.emp_no;



-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM ret_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC;




SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;


-- Deliverable 2
DROP TABLE mentorship_eligibility
SELECT DISTINCT ON(e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
			INNER JOIN titles AS t
				ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;





-- Count of total active employees (for deliverable 3)
DROP TABLE active_employees
SELECT ce.emp_no,
  ce.first_name,
  ce.last_name,
  ti.title,
  ti.from_date,
  ti.to_date
INTO employees_count
FROM employees AS ce
  INNER JOIN titles AS ti
    ON (ce.emp_no = ti.emp_no)
WHERE birth_date BETWEEN '1500-01-01' AND '2022-12-31'
ORDER BY ce.emp_no;


SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO active_employees
FROM employees_count
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC;


-- Expanded mentorship elegibility (for deliverable 3)
DROP TABLE exp_ment_elg
SELECT ce.emp_no,
  ce.first_name,
  ce.last_name,
  ti.title,
  ti.from_date,
  ti.to_date
INTO exp_ment_elg
FROM employees AS ce
  INNER JOIN titles AS ti
    ON (ce.emp_no = ti.emp_no)
WHERE birth_date BETWEEN '1956-01-01' AND '1965-12-31'
ORDER BY ce.emp_no;

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO active_elg_mentors
FROM exp_ment_elg
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC;

