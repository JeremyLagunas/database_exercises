# 2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
SELECT DISTINCT 
	title
FROM
	titles;
-- 7 distinct titles

# 3. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
SELECT DISTINCT
	last_name
FROM 
	employees
WHERE 
	last_name LIKE 'e%e'
GROUP BY last_name;

# 4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT DISTINCT
	CONCAT(first_name, ' ', last_name) AS 'distinct names', last_name
FROM
	employees
WHERE
	last_name LIKE 'e%e'
ORDER BY last_name ASC;

# 5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT DISTINCT 
	last_name
FROM
	employees
WHERE 
	last_name LIKE '%q%'
    AND last_name NOT LIKE '%qu%';
-- Chleq, Lindqvist, Qiwen

# 6. Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
SELECT DISTINCT 
	COUNT(last_name)
FROM 
	employees
WHERE
	last_name LIKE '%q%'
    AND last_name NOT LIKE '%qu%';
-- 547

# 7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT
	first_name, gender, count(gender)
FROM
	employees
WHERE
	first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender
ORDER BY 
	first_name ASC;
    
# 8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
SELECT DISTINCT 
    LOWER(CONCAT((SUBSTR(first_name, 1, 1)), (SUBSTR(last_name, 1, 4)), ('_'), (SUBSTR(birth_date, 6, 2)), (SUBSTR(birth_date, 3, 2)))) AS username,
    first_name,
    last_name,
    birth_date
FROM
    employees;
-- There are: 300024 total usernames. There are: 300018 DISTINCT usernames. There are 6 DUPLICATE usernames.
