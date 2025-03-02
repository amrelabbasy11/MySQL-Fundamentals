
SELECT *
FROM employee_salary 
WHERE first_name = 'Leisle' 
;

SELECT *
FROM employee_salary 
WHERE salary > 5000
;

SELECT *
FROM employee_demographics
WHERE gender = 'Female'
;

SELECT *
FROM employee_demographics
WHERE gender != 'Female'
;

SELECT *
FROM employee_demographics
WHERE birth_date > '1987-01-01'
;

-- Logical Operetors 

SELECT *
FROM employee_demographics
WHERE gender = 'Female' 
AND age > 34
;

SELECT *
FROM employee_demographics
WHERE gender = 'Female' 
OR age > 44
;

SELECT *
FROM employee_demographics
WHERE (first_name = 'Donna' AND age > 44) OR first_name = ' Leisle'
;
