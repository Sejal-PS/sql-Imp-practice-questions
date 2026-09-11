
-- SQL PRACTICE SOLUTIONS - WINDOW FUNCTIONS
-- ============================================


-- Q1. Rank all employees by salary from highest to lowest
-- using RANK().
SELECT
    employee_id,
    name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;


-- Q2. Assign a unique row number to employees ordered
-- by salary from highest to lowest.
SELECT
    employee_id,
    name,
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;


-- Q3. Rank employees by salary within each department.
SELECT
    employee_id,
    name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;


-- Q4. Find the top 2 highest-paid employees from each department.
WITH ranked_employees AS (
    SELECT
        employee_id,
        name,
        department,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS row_num
    FROM employees
)
SELECT *
FROM ranked_employees
WHERE row_num <= 2;


-- Q5. Find the second-highest-paid employee in each department.
WITH ranked_employees AS (
    SELECT
        employee_id,
        name,
        department,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT *
FROM ranked_employees
WHERE salary_rank = 2;


-- Q6. Display each employee's salary along with the
-- average salary of their department.
SELECT
    employee_id,
    name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS department_average_salary
FROM employees;


-- Q7. Display each employee's salary and the difference
-- between their salary and their department's average salary.
SELECT
    employee_id,
    name,
    department,
    salary,
    salary - AVG(salary) OVER (
        PARTITION BY department
    ) AS salary_difference
FROM employees;


-- Q8. Display each employee's salary along with the
-- highest salary in their department.
SELECT
    employee_id,
    name,
    department,
    salary,
    MAX(salary) OVER (
        PARTITION BY department
    ) AS department_highest_salary
FROM employees;


-- Q9. Calculate a running total of salaries ordered
-- by employee hire date.
SELECT
    employee_id,
    name,
    hire_date,
    salary,
    SUM(salary) OVER (
        ORDER BY hire_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total_salary
FROM employees;


-- Q10. Find the top 3 highest-paid employees across
-- the entire company using a window function.
WITH ranked_employees AS (
    SELECT
        employee_id,
        name,
        department,
        salary,
        ROW_NUMBER() OVER (
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT *
FROM ranked_employees
WHERE salary_rank <= 3;
