-- Window Functions

-- Window functions allow you to perform calculations across a set of table rows related to the current row, without collapsing rows like GROUP BY does.
-- They are useful for running totals, rankings, and calculating moving averages.

SELECT * 
FROM employee_demographics;

-- Example of GROUP BY: calculates the average salary for each gender.
SELECT gender, ROUND(AVG(salary),1)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;

-- Window function without partition: calculates the overall average salary for all employees, but retains individual rows.
SELECT dem.employee_id, dem.first_name, gender, salary,
AVG(salary) OVER() -- calculates average salary over all rows
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- Window function with PARTITION BY: calculates average salary by gender, but keeps each row.
SELECT dem.employee_id, dem.first_name, gender, salary,
AVG(salary) OVER(PARTITION BY gender) -- calculates average salary per gender
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- Running total of salaries by gender, ordered by employee_id.
SELECT dem.employee_id, dem.first_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY employee_id) -- running total by gender
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- Row numbering within each gender group.
SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender) -- assigns a row number within each gender group
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- Row numbering by gender, ordered by highest salary.
SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) -- ranks employees by salary within gender
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- Comparison of row_number and rank.
SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) row_num, -- unique row numbers
Rank() OVER(PARTITION BY gender ORDER BY salary DESC) rank_1 -- ranks with ties (skips numbers for ties)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- Comparison of row_number, rank, and dense_rank.
SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) row_num, -- continuous numbering without ties
Rank() OVER(PARTITION BY gender ORDER BY salary DESC) rank_1, -- positional ranking with skips for ties
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) dense_rank_2 -- sequential ranking without skips
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;
