
-- SQL PRACTICE SOLUTIONS
-- AGGREGATE FUNCTIONS & GROUP BY
-- ============================================

-- Q1. Find the total number of employees.
SELECT COUNT(*) AS total_employees
FROM employees;


-- Q2. Find the total salary paid to all employees.
SELECT SUM(salary) AS total_salary
FROM employees;


-- Q3. Find the average salary of all employees.
SELECT AVG(salary) AS average_salary
FROM employees;


-- Q4. Find the highest salary among all employees.
SELECT MAX(salary) AS highest_salary
FROM employees;


-- Q5. Find the lowest salary among all employees.
SELECT MIN(salary) AS lowest_salary
FROM employees;


-- Q6. Find the number of employees in each department.
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;


-- Q7. Find the total salary paid for each department.
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;


-- Q8. Find the average salary for each department.
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;


-- Q9. Find the highest salary in each department.
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;


-- Q10. Display departments that have more than 3 employees.
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;
