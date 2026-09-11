
-- SQL JOIN PRACTICE DATASET
-- ============================================

-- Create departments table

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(100)
);


-- Insert sample departments

INSERT INTO departments
(department_id, department_name, location)
VALUES
(1, 'IT', 'Pune'),
(2, 'HR', 'Mumbai'),
(3, 'Finance', 'Bangalore'),
(4, 'Sales', 'Delhi'),
(5, 'Marketing', 'Hyderabad');


-- Add department_id to employees

ALTER TABLE employees
ADD department_id INT;


-- Update department IDs

UPDATE employees
SET department_id = 1
WHERE department = 'IT';

UPDATE employees
SET department_id = 2
WHERE department = 'HR';

UPDATE employees
SET department_id = 3
WHERE department = 'Finance';

UPDATE employees
SET department_id = 4
WHERE department = 'Sales';
