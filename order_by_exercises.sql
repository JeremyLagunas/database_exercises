USE employees;

SHOW tables;
DESCRIBE employees;

# 2.
SELECT
	*
FROM 
	employees
WHERE 
	first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC;
-- First person: Irena Reutenauer.  Last Person: Vidya Simmen

# 3.
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC, last_name ASC;
-- First person: Irena Acton.  Last person: Vidya Zweizig

# 4.
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name ASC, first_name ASC;
-- First person: Irena Acton.  Last person: Maya Zyda

# 5.
SELECT 
	* 
FROM
	employees
WHERE 
	last_name LIKE ('E%')
    AND last_name LIKE ('%e')
ORDER BY emp_no ASC;
-- # of emp: 899.  First emp: 10021 Ramzi Erde.  Last emp: 499648 Tadahiro Erde  

# 6.
SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE ('%e')
    AND last_name LIKE ('E%')
ORDER BY hire_date DESC;
-- # of emp: 899.  Newest: Teiji Eldridge.  Oldest: Sergi Erde

# 7. 
SELECT
	*
FROM
	employees
WHERE
	hire_date LIKE ('199%')
    AND birth_date LIKE ('%-12-25')
ORDER BY birth_date ASC, hire_date DESC;
-- # of emp: 362.  Oldest/hired last: Khun Bernini.  Youngest/hired first: Douadi Pettis
