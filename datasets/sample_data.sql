
-- SQL PRACTICE DATASET
-- ============================================

-- Create employees table

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);


-- Insert sample employees

INSERT INTO employees
(employee_id, name, department, salary, hire_date)
VALUES
(1, 'Amit', 'IT', 65000, '2021-03-15'),
(2, 'Priya', 'HR', 48000, '2020-07-20'),
(3, 'Sejal', 'IT', 72000, '2019-01-10'),
(4, 'Sneha', 'Finance', 55000, '2022-05-18'),
(5, 'Anjali', 'IT', 68000, '2021-11-05'),
(6, 'Vikram', 'Sales', 45000, '2023-02-14'),
(7, 'snehal', 'Finance', 75000, '2018-09-25'),
(8, 'Neha', 'HR', 52000, '2022-08-30'),
(9, 'Aakash', 'IT', 82000, '2017-06-12'),
(10, 'Riya', 'Sales', 49000, '2023-04-01'),
(11, 'Karan', 'IT', 58000, '2020-12-11'),
(12, 'Pooja', 'Finance', 62000, '2021-07-19'),
(13, 'Aditya', 'Sales', 70000, '2019-10-07'),
(14, 'Meera', 'HR', 46000, '2023-01-16'),
(15, 'Akshay', 'IT', 90000, '2016-04-22');
