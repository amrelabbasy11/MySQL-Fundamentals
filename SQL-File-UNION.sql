
SELECT first_name , last_name
FROM employee_demographics;

SELECT salary , occupation
FROM employee_salary;

SELECT first_name , last_name
FROM employee_demographics
UNION
SELECT salary , occupation
FROM employee_salary;

-- the result will be with duplicated data 
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;

-- Actual Example of UNION
SELECT first_name, last_name, 'Old Lady' as Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Old Man' as Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' as Label
FROM employee_salary
WHERE salary >= 70000
ORDER BY first_name;

