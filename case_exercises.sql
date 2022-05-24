USE employees;

# 1. Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

SELECT
	first_name, last_name, dept_no, hire_date, dept_emp.to_date AS end_date, 
    CASE dept_emp.to_date
		WHEN dept_emp.to_date > CURDATE() THEN TRUE
        ELSE FALSE
	END AS is_current_employee
FROM
	employees
JOIN
	dept_emp USING (emp_no);
    
# 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
SELECT
	first_name, last_name, 
	CASE 
		WHEN last_name LIKE 'A%' OR 'B%' OR 'C%' OR 'D%' OR 'E%' OR 'F%' OR 'G%' OR 'H%' THEN 'A-H'
        WHEN last_name LIKE 'I%' OR 'J%' OR 'K%' OR 'L%' OR 'M%' OR 'N%' OR 'O%' OR 'P%' OR 'Q%' THEN 'I-Q'
        WHEN last_name LIKE 'R%' OR 'S%' OR 'T%' OR 'U%' OR 'V%' OR 'W%' OR 'X%' OR 'Y%' OR 'Z%' THEN 'R-Z'
        END AS alpha_group
FROM
	employees;
	
# 3. How many employees (current or previous) were born in each decade?
SELECT
	CASE	
        WHEN birth_date LIKE '196%' THEN '60s'
        WHEN birth_date LIKE '195%' THEN '50s'
        ELSE NULL
	END AS birth_decade,
    COUNT(*)
FROM
	employees
GROUP BY birth_decade;

# 4. What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT * FROM departments;

SELECT
	CASE 
        WHEN dept_name IN ('Research', 'Development') THEN 'R&D'
        WHEN dept_name IN ('Sales', 'Marketing') THEN 'Sales & Marketing'
        WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
        WHEN dept_name IN ('Finance', 'HR') THEN 'Finance & HR'
        ELSE 'Customer Service'
	END AS dept_group
FROM
	departments;

SELECT
	AVG(salary),
		CASE 
        WHEN dept_name IN ('Research', 'Development') THEN 'R&D'
        WHEN dept_name IN ('Sales', 'Marketing') THEN 'Sales & Marketing'
        WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
        WHEN dept_name IN ('Finance', 'HR') THEN 'Finance & HR'
        ELSE 'Customer Service'
	END AS dept_group
FROM
	salaries
JOIN 
	dept_emp ON salaries.emp_no = dept_emp.emp_no AND dept_emp.to_date > CURDATE()
JOIN
	departments USING (dept_no)
GROUP BY
	dept_group;