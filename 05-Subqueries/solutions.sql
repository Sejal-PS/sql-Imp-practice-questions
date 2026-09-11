
-- SQL PRACTICE SOLUTIONS - SUBQUERIES
-- ============================================


-- Q1. Find employees who earn more than the average salary.
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


-- Q2. Find the employee(s) who have the highest salary.
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


-- Q3. Find the employee(s) who have the second-highest salary.
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);


-- Q4. Find employees who earn more than the highest salary
-- in the HR department.
SELECT *
FROM employees
WHERE salary > (
    SELECT MAX(salary)
    FROM employees
    WHERE department = 'HR'
);


-- Q5. Find employees who earn more than the average salary
-- of the IT department.
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = 'IT'
);


-- Q6. Find employees who work in the same department as 'Amit'.
SELECT *
FROM employees
WHERE department = (
    SELECT department
    FROM employees
    WHERE name = 'Amit'
);


-- Q7. Find employees whose salary is equal to the highest salary
-- in the Finance department.
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department = 'Finance'
);


-- Q8. Find the department(s) that have at least one employee
-- earning more than 80000.
SELECT DISTINCT department
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    WHERE salary > 80000
);


-- Q9. Find employees who earn more than every employee
-- in the HR department.
SELECT *
FROM employees
WHERE salary > (
    SELECT MAX(salary)
    FROM employees
    WHERE department = 'HR'
);


-- Q10. Find the employee(s) with the third-highest distinct salary.
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
        WHERE salary < (
            SELECT MAX(salary)
            FROM employees
        )
    )
);
