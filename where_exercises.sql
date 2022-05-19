USE employees;

SHOW tables;
DESCRIBE employees;

# 2.
SELECT count(*) FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');
-- 709

# 3.
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    first_name = 'Irena'
    OR first_name = 'Vidya'
	OR first_name = 'Maya';
-- 709

# 4.
SELECT 
    count(*)
FROM
    employees
WHERE
    first_name = 'Irena'
    OR first_name = 'Vidya'
    OR first_name = 'Maya'
    AND gender = 'M';
-- 619

# 5.
SELECT count(*) FROM employees WHERE last_name LIKE ('E%');
-- 7330

# 6.
SELECT 
    count(*)
FROM
    employees
WHERE
    last_name LIKE ('%e')
    OR last_name LIKE ('E%');
-- 30723

# 7. 
SELECT
	count(*)
FROM
	employees
WHERE
	last_name like ('E%')
    AND last_name like ('%e');
-- 899

# 8.
SELECT
	count(*)
FROM 
	employees
WHERE
	hire_date LIKE ('199%');
-- 135214

# 9.
SELECT
	count(*)
FROM 
	employees
WHERE
	birth_date LIKE ('%-12-25'); 
-- 842

# 10. 
SELECT
	count(*)
FROM
	employees
WHERE
	hire_date LIKE ('199%')
    AND birth_date LIKE ('%-12-25');
-- 362

# 11. 
SELECT
	count(*)
FROM 
	employees
WHERE
	last_name LIKE ('%q%');
-- 1873

# 12. 
SELECT
	count(*)
FROM
	employees
WHERE
	last_name LIKE ('%q%')
    AND last_name NOT LIKE ('%qu%');
-- 547
