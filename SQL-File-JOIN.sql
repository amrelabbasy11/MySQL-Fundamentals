-- JOINS 

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- 1. INNER JOIN 

SELECT *
FROM employee_demographics
JOIN employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id;

SELECT *
FROM employee_demographics  emp_dem
INNER JOIN employee_salary  emp_sal
ON emp_dem.employee_id = emp_sal.employee_id;

-- OUTER JOIN -> (LEFT - RIGHT)

SELECT *
FROM employee_salary emp_sal
LEFT JOIN employee_demographics emp_dem
ON emp_dem.employee_id = emp_sal.employee_id;
    
SELECT *
FROM employee_salary emp_sal
RIGHT JOIN employee_demographics emp_dem
ON emp_dem.employee_id = emp_sal.employee_id;

-- Self join

SELECT *
FROM employee_demographics dem1
JOIN employee_demographics dem2
ON dem1.employee_id = dem2.employee_id;

SELECT *
FROM employee_demographics dem1
JOIN employee_demographics dem2
ON dem1.employee_id + 2 = dem2.employee_id;

SELECT dem1.employee_id as amr1_id,
dem1.first_name as amr1_firstname,
dem1.last_name as amr1_lasttname,
dem2.employee_id as amr2_id,
dem2.first_name as amr2_firstname,
dem2.last_name as amr2_lasttname
FROM employee_demographics dem1
JOIN employee_demographics dem2
ON dem1.employee_id + 2 = dem2.employee_id;

-- JOIN multiples tables

SELECT *
FROM employee_demographics emp_dem
INNER JOIN employee_salary emp_sal
ON emp_dem.employee_id = emp_sal.employee_id
JOIN parks_departments parks_dept
ON parks_dept.department_id = emp_sal.dept_id;













