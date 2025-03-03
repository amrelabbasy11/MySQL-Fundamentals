-- Selecting all rows from the employee_demographics table
SELECT *
FROM employee_demographics;

-- Selecting all rows from employee_demographics where employee_id matches IDs from employee_salary with dept_id = 1
SELECT *
FROM employee_demographics
WHERE employee_id IN 
			(SELECT employee_id
			 FROM employee_salary
			 WHERE dept_id = 1);

-- This query is invalid because the subquery returns multiple columns (employee_id and salary), but IN expects a single column
-- It will throw an error
SELECT *
FROM employee_demographics
WHERE employee_id IN 
			(SELECT employee_id, salary
			 FROM employee_salary
			 WHERE dept_id = 1);

-- Selecting first_name, salary, and average salary without grouping — this will result in an error since aggregate functions need GROUP BY
SELECT first_name, salary, AVG(salary)
FROM employee_salary;

-- Corrected: Using GROUP BY to show the first_name, salary, and their corresponding averages
SELECT first_name, salary, AVG(salary)
FROM employee_salary
GROUP BY first_name, salary;

-- Selecting first_name, salary, and overall average salary (same value repeated for all rows)
SELECT first_name, 
salary, 
(SELECT AVG(salary) 
	FROM employee_salary)
FROM employee_salary;

-- Using a subquery to get aggregated data: MIN, MAX, COUNT, and AVG grouped by gender
SELECT *
FROM (SELECT gender, MIN(age), MAX(age), COUNT(age),AVG(age)
FROM employee_demographics
GROUP BY gender);

-- Calculating the average of the minimum ages per gender
SELECT gender, AVG(Min_age)
FROM (SELECT gender, MIN(age) Min_age, MAX(age) Max_age, COUNT(age) Count_age ,AVG(age) Avg_age
FROM employee_demographics
GROUP BY gender) AS Agg_Table
GROUP BY gender;

-- Calculating the average of the maximum ages per gender
SELECT AVG(MAX_Age)
FROM 
( 
  SELECT gender,
  AVG(age) AS Avg_Age,
  MAX(age) AS MAX_Age,
  MIN(age) AS MIN_Age
  FROM employee_demographics 
  GROUP BY gender
) AS Age_Data;
