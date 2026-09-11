
-- REAL-WORLD SQL PRACTICE SOLUTIONS
-- ============================================


-- Q1. Find the total number of customers.
SELECT COUNT(*) AS total_customers
FROM customers;


-- Q2. Find the total number of orders.
SELECT COUNT(*) AS total_orders
FROM orders;


-- Q3. Find the total revenue generated from all orders.
SELECT
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id;


-- Q4. Find the top 5 customers based on total spending.
SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.quantity * p.price) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN products p
    ON o.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC
LIMIT 5;


-- Q5. Find the top 5 products based on total sales.
SELECT
    p.product_id,
    p.product_name,
    SUM(o.quantity * p.price) AS total_sales
FROM products p
JOIN orders o
    ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC
LIMIT 5;


-- Q6. Find the average order value.
SELECT
    AVG(order_total) AS average_order_value
FROM (
    SELECT
        o.order_id,
        SUM(o.quantity * p.price) AS order_total
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY o.order_id
) AS order_totals;


-- Q7. Find the total revenue generated for each month.
SELECT
    EXTRACT(YEAR FROM o.order_date) AS order_year,
    EXTRACT(MONTH FROM o.order_date) AS order_month,
    SUM(o.quantity * p.price) AS monthly_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    EXTRACT(YEAR FROM o.order_date),
    EXTRACT(MONTH FROM o.order_date)
ORDER BY order_year, order_month;


-- Q8. Find customers who have never placed an order.
SELECT
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- Q9. Find the month with the highest revenue.
WITH monthly_revenue AS (
    SELECT
        EXTRACT(YEAR FROM o.order_date) AS order_year,
        EXTRACT(MONTH FROM o.order_date) AS order_month,
        SUM(o.quantity * p.price) AS revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY
        EXTRACT(YEAR FROM o.order_date),
        EXTRACT(MONTH FROM o.order_date)
)
SELECT *
FROM monthly_revenue
ORDER BY revenue DESC
LIMIT 1;


-- Q10. Find customers whose total spending is greater
-- than the average customer spending.
WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.customer_name,
        COALESCE(SUM(o.quantity * p.price), 0) AS total_spending
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    LEFT JOIN products p
        ON o.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT *
FROM customer_spending
WHERE total_spending > (
    SELECT AVG(total_spending)
    FROM customer_spending
)
ORDER BY total_spending DESC;
