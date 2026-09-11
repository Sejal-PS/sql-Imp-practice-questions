
-- SQL PRACTICE SOLUTIONS - CTEs
-- ============================================


-- Q1. Create a CTE that calculates the average salary
-- and find employees earning more than the average.
WITH average_salary AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT e.*
FROM employees e
CROSS JOIN average_salary a
WHERE e.salary > a.avg_salary;


-- Q2. Create a CTE that calculates the total salary
-- for each department.
WITH department_salary AS (
    SELECT department, SUM(salary) AS total_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM department_salary;


-- Q3. Create a CTE that calculates the average salary
-- for each department and display departments whose
-- average salary is greater than 60000.
WITH department_average AS (
    SELECT department, AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM department_average
WHERE average_salary > 60000;


-- Q4. Create a CTE that finds the highest-paid employee
-- in each department.
WITH department_max_salary AS (
    SELECT department, MAX(salary) AS max_salary
    FROM employees
    GROUP BY department
)
SELECT e.*
FROM employees e
JOIN department_max_salary d
    ON e.department = d.department
    AND e.salary = d.max_salary;


-- Q5. Create a CTE that ranks employees by salary
-- from highest to lowest.
WITH ranked_employees AS (
    SELECT
        employee_id,
        name,
        department,
        salary,
        RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
)
SELECT *
FROM ranked_employees;


-- Q6. Create a CTE that calculates the number of employees
-- in each department and display departments having
-- more than 3 employees.
WITH department_count AS (
    SELECT department, COUNT(*) AS employee_count
    FROM employees
    GROUP BY department
)
SELECT *
FROM department_count
WHERE employee_count > 3;


-- Q7. Create a CTE that finds employees earning more
-- than 70000 and display their names and salaries.
WITH high_earners AS (
    SELECT name, salary
    FROM employees
    WHERE salary > 70000
)
SELECT *
FROM high_earners;


-- Q8. Create a CTE that calculates the average salary
-- of IT employees and find employees earning more than
-- that average.
WITH it_average AS (
    SELECT AVG(salary) AS average_salary
    FROM employees
    WHERE department = 'IT'
)
SELECT e.*
FROM employees e
CROSS JOIN it_average i
WHERE e.salary > i.average_salary;


-- Q9. Create a CTE that calculates total salary by department
-- and display the department with the highest total salary.
WITH department_total AS (
    SELECT department, SUM(salary) AS total_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM department_total
WHERE total_salary = (
    SELECT MAX(total_salary)
    FROM department_total
);


-- Q10. Create a CTE that identifies the top 3 highest-paid
-- employees.
WITH ranked_employees AS (
    SELECT
        employee_id,
        name,
        department,
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
)
SELECT *
FROM ranked_employees
WHERE salary_rank <= 3;
