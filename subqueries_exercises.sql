USE employees;
SELECT * FROM employees;
SELECT * FROM dept_emp;

# 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
SELECT
	hire_date
FROM
	employees
WHERE 
	emp_no = 101010;
    
 -------------------------- 
 
 SELECT 
	emp_no
FROM
	dept_emp
WHERE
	to_date > NOW();
    
-----------------------
 
SELECT
	first_name, last_name
FROM
	employees
WHERE 
	hire_date = (SELECT
	hire_date
FROM
	employees
WHERE 
	emp_no = 101010)
    AND emp_no IN (SELECT 
	emp_no
FROM
	dept_emp
WHERE
	to_date > NOW());

# 2. Find all the titles ever held by all current employees with the first name Aamod.
SELECT
	emp_no, CONCAT(first_name, ' ', last_name)
FROM
	employees
WHERE 
	first_name = 'Aamod';
    
SELECT
	DISTINCT(title), first_name, last_name
FROM
	titles 
JOIN 
	employees using (emp_no)
JOIN
	dept_emp using (emp_no)
WHERE
	emp_no IN (SELECT
	emp_no
FROM
	employees
WHERE 
	first_name = 'Aamod')
    AND dept_emp.to_date > NOW();
    
# 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT
	emp_no
FROM
	dept_emp
WHERE
	to_date < CURDATE();

SELECT
	first_name, last_name
FROM
	employees
WHERE
	emp_no IN (SELECT
	emp_no
FROM
	dept_emp
WHERE
	to_date < CURDATE());
-- 85108

# 4. Find all the current department managers that are female. List their names in a comment in your code.
SELECT 
	emp_no
FROM
	dept_manager
WHERE
	to_date > CURDATE();
    
SELECT
	first_name, last_name
FROM
	employees
WHERE
	emp_no IN (SELECT 
	emp_no
FROM
	dept_manager
WHERE
	to_date > CURDATE())
    AND gender = 'f';
-- Isamu Leglietner, Karsten Sigstam, Leon DasSarma, Hilary Kambil

# 5.Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT
	AVG(salary)
FROM
	salaries;
-- 63810.7448

SELECT
	emp_no
FROM
	salaries
WHERE
	salary > (SELECT
	AVG(salary)
FROM
	salaries)
    AND to_date > CURDATE();
    
SELECT
	first_name, last_name
FROM
	employees
WHERE
	emp_no IN (SELECT
	emp_no
FROM
	salaries
WHERE
	salary > (SELECT
	AVG(salary)
FROM
	salaries)
    AND to_date > CURDATE());
-- 154543 employees

# 6. 
SELECT
	MAX(salary)
FROM
	salaries
WHERE
	to_date > CURDATE();
-- 158220 current max salary

SELECT
	MAX(salary) - STD(salary)
FROM
	salaries
WHERE
	to_date > CURDATE();
-- 140910 MAX salary - 1 STD

SELECT
	COUNT(emp_no)
FROM
	salaries
WHERE
	salary > (SELECT
	MAX(salary) - STD(salary)
FROM
	salaries
WHERE
	to_date > CURDATE())
    AND to_date > CURDATE();
    
SELECT
	((SELECT
	COUNT(emp_no)
FROM
	salaries
WHERE
	salary > (SELECT
	MAX(salary) - STD(salary)
FROM
	salaries
WHERE
	to_date > CURDATE())
    AND to_date > CURDATE()) / COUNT(salary)) * 100, '%'
FROM
	salaries;
-- 0.0029%