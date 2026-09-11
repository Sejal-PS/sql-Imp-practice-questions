
-- ADVANCED SQL PRACTICE SOLUTIONS
-- ============================================


-- Q1. Categorize employees based on salary.
SELECT
    employee_id,
    name,
    salary,
    CASE
        WHEN salary < 50000 THEN 'Low'
        WHEN salary BETWEEN 50000 AND 70000 THEN 'Medium'
        ELSE 'High'
    END AS salary_category
FROM employees;


-- Q2. Use COALESCE to display 0 instead of NULL
-- for missing salary values.
SELECT
    employee_id,
    name,
    COALESCE(salary, 0) AS salary
FROM employees;


-- Q3. Find employees hired between 2020-01-01
-- and 2022-12-31.
SELECT *
FROM employees
WHERE hire_date BETWEEN '2020-01-01' AND '2022-12-31';


-- Q4. Display employee names in uppercase.
SELECT
    name,
    UPPER(name) AS uppercase_name
FROM employees;


-- Q5. Display employee names and the length
-- of each name.
SELECT
    name,
    LENGTH(name) AS name_length
FROM employees;


-- Q6. Find employees whose salary is greater than
-- at least one employee in the HR department.
SELECT *
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees
    WHERE department = 'HR'
);


-- Q7. Find employees whose salary is greater than
-- all employees in the HR department.
SELECT *
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE department = 'HR'
);


-- Q8. Combine employee names from IT and Finance
-- using UNION.
SELECT name
FROM employees
WHERE department = 'IT'

UNION

SELECT name
FROM employees
WHERE department = 'Finance';


-- Q9. Find pairs of employees who belong to
-- the same department using a SELF JOIN.
SELECT
    e1.name AS employee_1,
    e2.name AS employee_2,
    e1.department
FROM employees e1
JOIN employees e2
    ON e1.department = e2.department
    AND e1.employee_id < e2.employee_id;


-- Q10. Find departments that have no employees
-- using NOT EXISTS.
SELECT d.*
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);
