-- Basic Case statement to label age groups
SELECT first_name, 
       last_name, 
       CASE
           WHEN age <= 25 THEN 'Very Young'
       END AS age_group
FROM employee_demographics;

-- Adding more age ranges
SELECT first_name, 
       last_name, 
       CASE
           WHEN age <= 25 THEN 'Very Young'
           WHEN age BETWEEN 26 AND 40 THEN 'Middle Aged'
           WHEN age >= 41 THEN 'Senior'
       END AS age_category
FROM employee_demographics;

-- Salary increase structure with new rates
SELECT first_name, 
       last_name, 
       salary,
       CASE
           WHEN salary > 50000 THEN salary + (salary * 0.04) -- 4% raise
           WHEN salary <= 50000 THEN salary + (salary * 0.08) -- 8% raise
       END AS adjusted_salary
FROM employee_salary;

-- Adding bonuses for department 3
SELECT first_name, 
       last_name, 
       salary,
       CASE
           WHEN salary > 50000 THEN salary + (salary * 0.04)
           WHEN salary <= 50000 THEN salary + (salary * 0.08)
       END AS adjusted_salary,
       CASE
           WHEN dept_id = 3 THEN salary * 0.12 -- 12% bonus
       END AS department_bonus
FROM employee_salary;
