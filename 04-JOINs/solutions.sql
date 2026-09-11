
-- SQL PRACTICE SOLUTIONS - JOINS
-- ============================================


-- Q1. Display each employee's name along with their department location.
SELECT e.name, d.location
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;


-- Q2. Display employee name, department name, and salary.
SELECT e.name, d.department_name, e.salary
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;


-- Q3. Display all employees who belong to a department
-- that exists in the departments table.
SELECT e.*
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;


-- Q4. Display all departments and the employees working in them.
SELECT d.department_name, e.name
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id;


-- Q5. Display employees who work in the IT department.
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_name = 'IT';


-- Q6. Display the names of employees who work in Pune.
SELECT e.name, d.location
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
WHERE d.location = 'Pune';


-- Q7. Display each department name along with the number
-- of employees working in that department.
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_name;


-- Q8. Display each department name along with the total salary
-- paid to its employees.
SELECT d.department_name, COALESCE(SUM(e.salary), 0) AS total_salary
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_name;


-- Q9. Display employees who earn more than 60000
-- along with their department name.
SELECT e.name, e.salary, d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary > 60000;


-- Q10. Display all departments, including departments
-- that currently have no employees.
SELECT d.department_name, e.name
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id;
