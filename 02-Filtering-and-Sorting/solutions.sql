
-- SQL PRACTICE SOLUTIONS - FILTERING & SORTING
-- ============================================

-- Q1. Find all employees who work in the IT department.
SELECT *
FROM employees
WHERE department = 'IT';


-- Q2. Find all employees whose salary is greater than 60000.
SELECT *
FROM employees
WHERE salary > 60000;


-- Q3. Find all employees whose salary is less than or equal to 50000.
SELECT *
FROM employees
WHERE salary <= 50000;


-- Q4. Find all employees who work in either IT or Finance.
SELECT *
FROM employees
WHERE department IN ('IT', 'Finance');


-- Q5. Find all employees who do NOT work in the HR department.
SELECT *
FROM employees
WHERE department <> 'HR';


-- Q6. Find all employees whose salary is between 50000 and 75000.
SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 75000;


-- Q7. Find all employees whose name starts with the letter 'A'.
SELECT *
FROM employees
WHERE name LIKE 'A%';


-- Q8. Find all employees whose name ends with the letter 'a'.
SELECT *
FROM employees
WHERE name LIKE '%a';


-- Q9. Display all employees ordered by name alphabetically.
SELECT *
FROM employees
ORDER BY name ASC;


-- Q10. Display all employees ordered by salary from lowest to highest.
SELECT *
FROM employees
ORDER BY salary ASC;
