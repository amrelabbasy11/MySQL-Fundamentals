-- Get the length of a string
SELECT LENGTH('Amr'); -- Returns 3, because "Amr" has 3 characters

-- Get the length of each name in the first_name column
SELECT first_name, LENGTH(first_name) 
FROM employee_demographics;

-- Convert a string to uppercase
SELECT UPPER('Amr'); -- Returns "AMR"

-- Convert all names in first_name to uppercase
SELECT first_name, UPPER(first_name) 
FROM employee_demographics;

-- Convert a string to lowercase
SELECT LOWER('Amr'); -- Returns "amr"

-- Convert all names in first_name to lowercase
SELECT first_name, LOWER(first_name) 
FROM employee_demographics;

-- Remove whitespace from both sides of a string
SELECT TRIM('   Amr   '); -- Returns "Amr"

-- Try to remove whitespace only at the start (left side)
SELECT LTRIM('     I           love          SQL'); -- Trims only the leading spaces

-- Remove whitespace only from the left side
SELECT LTRIM('     I love SQL'); -- Returns "I love SQL"

-- Remove whitespace only from the right side
SELECT RTRIM('I love SQL    '); -- Returns "I love SQL"

-- Get a substring from the left side (first 4 characters)
SELECT LEFT('Elabbasy', 4); -- Returns "Elab"

-- Get the first 4 characters from each first_name
SELECT first_name, LEFT(first_name, 4) 
FROM employee_demographics;

-- Get a substring from the right side (last 6 characters)
SELECT RIGHT('Elabbasy', 6); -- Returns "abbasy"

-- Get the last 4 characters from each first_name
SELECT first_name, RIGHT(first_name, 4) 
FROM employee_demographics;

-- Get a substring starting from a position (start at 2nd character, get 3 characters)
SELECT SUBSTRING('Elabbasy', 2, 3); -- Returns "lab"

-- Get the birth year by extracting the first 4 characters of birth_date
SELECT birth_date, SUBSTRING(birth_date, 1, 4) AS birth_year
FROM employee_demographics;

-- Replace all occurrences of 'a' with 'y' in first_name
SELECT REPLACE(first_name, 'a', 'y') 
FROM employee_demographics;

-- Find the position of 'b' in "Elabbasy" (starts counting at 1)
SELECT LOCATE('b', 'Elabbasy'); -- Returns 4

-- Find the position of the first 'e' in "Alexander"
SELECT LOCATE('e', 'Alexander'); -- Returns 3 (only first occurrence)

-- Find the position of 'a' in each first_name
SELECT first_name, LOCATE('a', first_name) 
FROM employee_demographics;

-- Find the position of "Mic" in each first_name
SELECT first_name, LOCATE('Mic', first_name) 
FROM employee_demographics;

-- Concatenate (combine) two strings
SELECT CONCAT('Amr', ' Elabbasy'); -- Returns "Amr Elabbasy"

-- Concatenate first_name and last_name with a space in between, and give it an alias "full_name"
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics;
