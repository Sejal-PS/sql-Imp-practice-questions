
-- SQL PRACTICE SOLUTIONS - BASICS
-- ============================================

-- Q1. Display all records from the employees table.
SELECT *
FROM employees;


-- Q2. Display only the employee name and salary.
SELECT name, salary
FROM employees;


-- Q3. Find all employees whose salary is greater than 50000.
SELECT *
FROM employees
WHERE salary > 50000;


-- Q4. Find all employees who work in the IT department.
SELECT *
FROM employees
WHERE department = 'IT';


-- Q5. Display all employees sorted by salary from highest to lowest.
SELECT *
FROM employees
ORDER BY salary DESC;


-- Q6. Display the first 5 employees based on salary.
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;


-- Q7. Find employees whose salary is between 40000 and 70000.
SELECT *
FROM employees
WHERE salary BETWEEN 40000 AND 70000;


-- Q8. Find employees whose name starts with the letter 'A'.
SELECT *
FROM employees
WHERE name LIKE 'A%';


-- Q9. Find the unique departments from the employees table.
SELECT DISTINCT department
FROM employees;


-- Q10. Find the total number of employees.
SELECT COUNT(*)
FROM employees;
