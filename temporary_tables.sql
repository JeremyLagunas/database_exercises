USE kalpana_1814;

USE employees;

# 1. Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.

CREATE TEMPORARY TABLE kalpana_1814.employees_with_departments AS
SELECT 
	first_name, last_name, dept_name
FROM
	employees
JOIN 
	dept_emp USING (emp_no)
JOIN
	departments USING (dept_no)
LIMIT 
	100;

SELECT * FROM kalpana_1814.employees_with_departments;

# 1a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
ALTER TABLE kalpana_1814.employees_with_departments ADD full_name VARCHAR(25);

# 1b. Update the table so that full name column contains the correct data
UPDATE kalpana_1814.employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);

# 1c. Remove the first_name and last_name columns from the table.
ALTER TABLE kalpana_1814.employees_with_departments 
DROP COLUMN first_name;
ALTER TABLE kalpana_1814.employees_with_departments
DROP COLUMN last_name;

# 1d.  What is another way you could have ended up with this same table?
-- I could have made my initial query in such a way that would return the changes I have made. 

SELECT * FROM kalpana_1814.employees_with_departments;

# 2. Create a temporary table based on the payment table from the sakila database.
# Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
USE sakila;

CREATE TEMPORARY TABLE kalpana_1814.payment_sakila AS
SELECT
	*
FROM
	payment;
    
SELECT * FROM kalpana_1814.payment_sakila;

ALTER TABLE kalpana_1814.payment_sakila
MODIFY amount INT(5);

ALTER TABLE kalpana_1814.payment_sakila
DROP COLUMN new_;

SELECT * FROM kalpana_1814.payment_sakila;

# 3. Find out how the current average pay in each department compares to the overall current pay for everyone at the company. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?
USE employees;
CREATE TEMPORARY TABLE kalpana_1814.avg_salary AS
SELECT 
	AVG(salary)
FROM
	salaries;
    
SELECT * FROM kalpana_1814.avg_salary;

CREATE TEMPORARY TABLE kalpana_1814.dept_avg_salary AS
SELECT
	AVG(salary), dept_name
FROM
	salaries
JOIN
	dept_emp using (emp_no)
JOIN 
	departments using (dept_no)
GROUP BY 
	dept_name;



