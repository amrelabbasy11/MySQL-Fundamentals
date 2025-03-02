
SELECT *
FROM employee_demographics
LIMIT 4;

SELECT *
FROM employee_demographics
ORDER BY first_name
LIMIT 3;

SELECT *
FROM employee_demographics
ORDER BY first_name;

SELECT *
FROM employee_demographics
ORDER BY first_name
LIMIT 3,2;

SELECT *
FROM employee_demographics
ORDER BY age desc;

SELECT *
FROM employee_demographics
ORDER BY age desc
LIMIT 2,1;

-- ALIASING

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;

SELECT gender, AVG(age) AS Avg_age
FROM employee_demographics
GROUP BY gender
;

SELECT gender, AVG(age) Avg_age
FROM employee_demographics
GROUP BY gender
;


