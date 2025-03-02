select *
from parks_and_recreation.employee_demographics;


select  distinct gender , first_name
from parks_and_recreation.employee_demographics;


select first_name , last_name , age , age + 10
from parks_and_recreation.employee_demographics;

# PEMDAS
select first_name,
last_name,
age,
(age + 10) * 10 + 5
from parks_and_recreation.employee_demographics;