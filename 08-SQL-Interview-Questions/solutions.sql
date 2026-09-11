
-- SQL INTERVIEW PRACTICE SOLUTIONS
-- ============================================


-- Q1. Find the second-highest salary.
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);


-- Q2. Find the third-highest distinct salary.
SELECT MAX(salary) AS third_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);


-- Q3. Find employees who have the highest salary
-- in their department.
SELECT *
FROM employees e
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department = e.department
);


-- Q4. Find duplicate employee names.
SELECT name, COUNT(*) AS name_count
FROM employees
GROUP BY name
HAVING COUNT(*) > 1;


-- Q5. Find departments with more than 2 employees.
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;


-- Q6. Find the employee with the longest tenure.
SELECT *
FROM employees
WHERE hire_date = (
    SELECT MIN(hire_date)
    FROM employees
);


-- Q7. Find the top 3 highest-paid employees.
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;


-- Q8. Find employees whose salary is higher than
-- the average salary of their department.
SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);


-- Q9. Find the department with the highest average salary.
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC
LIMIT 1;


-- Q10. Find employees who were hired before 2020.
SELECT *
FROM employees
WHERE hire_date < '2020-01-01';
