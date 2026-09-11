
-- E-COMMERCE SQL PRACTICE DATASET
-- ============================================

-- ============================================
-- 1. CUSTOMERS TABLE
-- ============================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

INSERT INTO customers
(customer_id, customer_name, city, signup_date)
VALUES
(1, 'Amit Sharma', 'Pune', '2022-01-15'),
(2, 'Priya Patel', 'Mumbai', '2022-02-20'),
(3, 'Rahul Verma', 'Delhi', '2022-03-10'),
(4, 'Sneha Joshi', 'Pune', '2022-04-05'),
(5, 'Arjun Mehta', 'Bangalore', '2022-05-18'),
(6, 'Neha Singh', 'Mumbai', '2022-06-22'),
(7, 'Karan Shah', 'Delhi', '2022-07-11'),
(8, 'Pooja Nair', 'Chennai', '2022-08-14'),
(9, 'Aditya Rao', 'Hyderabad', '2022-09-09'),
(10, 'Riya Kapoor', 'Pune', '2022-10-01');


-- ============================================
-- 2. PRODUCTS TABLE
-- ============================================

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products
(product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 75000),
(102, 'Smartphone', 'Electronics', 45000),
(103, 'Headphones', 'Electronics', 5000),
(104, 'Keyboard', 'Accessories', 2500),
(105, 'Mouse', 'Accessories', 1500),
(106, 'Monitor', 'Electronics', 18000),
(107, 'Office Chair', 'Furniture', 12000),
(108, 'Desk', 'Furniture', 15000),
(109, 'Backpack', 'Accessories', 3000),
(110, 'Webcam', 'Electronics', 7000);


-- ============================================
-- 3. ORDERS TABLE
-- ============================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders
(order_id, customer_id, product_id, quantity, order_date)
VALUES
(1001, 1, 101, 1, '2023-01-10'),
(1002, 2, 102, 1, '2023-01-15'),
(1003, 3, 103, 2, '2023-01-20'),
(1004, 1, 104, 2, '2023-02-05'),
(1005, 4, 106, 1, '2023-02-12'),
(1006, 5, 107, 1, '2023-02-18'),
(1007, 2, 105, 3, '2023-03-03'),
(1008, 6, 108, 1, '2023-03-10'),
(1009, 7, 101, 1, '2023-03-15'),
(1010, 3, 109, 2, '2023-03-20'),
(1011, 8, 110, 1, '2023-04-05'),
(1012, 1, 102, 1, '2023-04-10'),
(1013, 5, 103, 2, '2023-04-18'),
(1014, 9, 106, 1, '2023-05-01'),
(1015, 2, 101, 1, '2023-05-08'),
(1016, 4, 104, 3, '2023-05-15'),
(1017, 6, 105, 2, '2023-06-02'),
(1018, 7, 107, 1, '2023-06-10'),
(1019, 3, 102, 1, '2023-06-18'),
(1020, 10, 108, 1, '2023-07-05');
