USE join_example_db;

# 1. Use the join_example_db. Select all the records from both the users and roles tables.
SELECT
	*
FROM
	users;
    
SELECT
	*
FROM
	roles;

# 2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
SELECT 
	*
FROM
	users
JOIN 
	roles ON users.role_id = roles.id;
 ---   
SELECT 
	*
FROM
	users
LEFT JOIN
	roles ON users.role_id = roles.id;
 ---   
SELECT
	*
FROM
	users
RIGHT JOIN
	roles ON users.role_id = roles.id;
    
# 3. 
SELECT 
	roles.name, COUNT(users.name) 
FROM
	roles
LEFT JOIN 
	users ON roles.id = users.role_id
GROUP BY roles.name ;

USE employees;
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM employees;

# 2. 
SELECT
	departments.dept_name, CONCAT(employees.first_name, ' ', employees.last_name) AS 'Name'
FROM
	departments
JOIN
	dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN 
	employees ON dept_manager.emp_no = employees.emp_no
WHERE 
	dept_manager.to_date > NOW()
ORDER BY
	dept_name ASC;

# 3. 
SELECT
	dept_name, CONCAT(first_name, ' ', last_name) AS 'Manager Name' 
FROM
	departments
JOIN
	dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN 
	employees ON dept_manager.emp_no = employees.emp_no
WHERE
	employees.gender = 'F'
	AND to_date > NOW()
ORDER BY
	dept_name ASC;
    
