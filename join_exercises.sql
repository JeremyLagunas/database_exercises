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
    
# 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
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
SELECT * FROM dept_emp;
SELECT * FROM employees;
SELECT * FROM titles;

# 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
SELECT
	departments.dept_name, CONCAT(employees.first_name, ' ', employees.last_name) AS 'Department Manager'
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

# 3. Find the name of all departments currently managed by women.
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
    
# 4. Find the current titles of employees currently working in the Customer Service department.
SELECT 
    titles.title, COUNT(titles.title)
FROM
	titles
JOIN
	dept_emp ON titles.emp_no = dept_emp.emp_no
WHERE
	titles.to_date > NOW()
    AND dept_emp.dept_no = 'd009'
GROUP BY
	titles.title
ORDER BY
	titles.title;
    
# 5. Find the current salary of all current managers.
SELECT
	dept_name, CONCAT(employees.first_name, ' ', employees.last_name), salaries.salary
FROM
	departments
JOIN
	dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN 
	employees ON dept_manager.emp_no = employees.emp_no
JOIN
	salaries ON employees.emp_no = salaries.emp_no
WHERE
	salaries.to_date > NOW()
    AND dept_manager.to_date > NOW()
ORDER BY departments.dept_name;

# 6. Find the number of current employees in each department.
SELECT
	departments.dept_no, departments.dept_name, COUNT(departments.dept_no) AS num_employees
FROM
	departments
JOIN 
	dept_emp ON departments.dept_no = dept_emp.dept_no
JOIN 
	employees on dept_emp.emp_no = employees.emp_no
WHERE 
	dept_emp.to_date > NOW()
GROUP BY
	departments.dept_no
ORDER BY 
	departments.dept_no;
    
# 7. Which department has the highest average salary? Hint: Use current not historic information.
SELECT
	departments.dept_name, (AVG(salaries.salary)) AS average_salary
FROM
	departments
JOIN
	dept_emp ON departments.dept_no = dept_emp.dept_no
JOIN 
	salaries ON dept_emp.emp_no = salaries.emp_no
WHERE
	salaries.to_date > NOW()
    AND dept_emp.to_date > NOW()
GROUP BY 
	departments.dept_name
ORDER BY
	average_salary DESC
LIMIT 1;

# 8. Who is the highest paid employee in the Marketing department?
SELECT
	employees.first_name, employees.last_name
FROM 
	employees
JOIN 
	salaries ON employees.emp_no = salaries.emp_no
JOIN
	dept_emp ON salaries.emp_no = dept_emp.emp_no
JOIN
	departments ON dept_emp.dept_no = departments.dept_no
WHERE
	departments.dept_no = 'd001'
ORDER BY
	salaries.salary DESC
LIMIT 1;

# 9. Which current department manager has the highest salary?
SELECT
	employees.first_name, employees.last_name, salaries.salary, departments.dept_name
FROM 
	employees
JOIN
	salaries ON employees.emp_no = salaries.emp_no
JOIN
	dept_manager ON salaries.emp_no = dept_manager.emp_no
JOIN
	departments ON dept_manager.dept_no = departments.dept_no
WHERE
	dept_manager.to_date > NOW()
ORDER BY
	salaries.salary DESC
LIMIT 1;

# 10. Determine the average salary for each department. Use all salary information and round your results.
SELECT
	departments.dept_name, ROUND(AVG(salaries.salary)) AS average_salary
FROM
	departments
JOIN
	dept_emp ON departments.dept_no = dept_emp.dept_no
JOIN 
	salaries ON dept_emp.emp_no = salaries.emp_no
GROUP BY
	departments.dept_name
ORDER BY average_salary DESC;