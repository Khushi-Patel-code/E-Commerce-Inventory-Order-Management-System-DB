-- View 1: Customer Order Summary View 
-- Joining 3 Tables

CREATE OR REPLACE VIEW customer_order_summary AS

SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(p.amount) AS total_spent,
    ROUND(AVG(p.amount), 2) AS avg_order_value,
    MAX(o.order_date) AS last_order_date
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN payments p 
    ON o.order_id = p.order_id
GROUP BY c.customer_id, customer_name
ORDER BY total_spent DESC;

-- ----------------------------------------

-- View 2: High Rated Products View
-- Uses nested queries with the ANY or ALL operator and uses a GROUP BYclause

CREATE OR REPLACE VIEW high_rated_products AS
SELECT 
    p.product_id,
    p.product_name,
    ROUND(AVG(r.rating), 2) AS average_rating
FROM products p
JOIN reviews r 
    ON p.product_id = r.product_id
GROUP BY p.product_id, p.product_name
HAVING AVG(r.rating) >= ALL (
    SELECT AVG(r2.rating)
    FROM reviews r2
    GROUP BY r2.product_id
)
ORDER BY average_rating DESC;
-- ------------------------------------
-- View 3: Above_Average_Sales
-- Uses a correlated nested query

CREATE OR REPLACE VIEW Above_Average_Sales AS
SELECT 
    u.user_id,
    u.username,
    o.order_id,
    o.total
FROM 
    users u
JOIN 
    orders o ON u.user_id = o.created_by
WHERE 
    o.total > (
        SELECT AVG(o2.total)
        FROM orders o2
        WHERE o2.created_by = u.user_id
    )
ORDER BY o.total DESC;

-- ------------------------------------
-- View 4: Customers_Orders
-- Uses a FULL JOIN

CREATE OR REPLACE VIEW Customers_Orders AS
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    o.order_id,
    o.order_number,
    o.total,
    o.order_status,
    o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id

UNION

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    o.order_id,
    o.order_number,
    o.total,
    o.order_status,
    o.order_date
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- ------------------------------------
-- View 5: Customers with oending Payements
-- Uses nested queries with any of the set operations UNION, EXCEPT, or INTERSECT

CREATE OR REPLACE VIEW pending_payments AS
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email
FROM customers c
WHERE c.customer_id IN (
    SELECT o.customer_id
    FROM orders o
)
AND c.customer_id NOT IN (
    SELECT o.customer_id
    FROM orders o
    JOIN payments p ON o.order_id = p.order_id
    WHERE p.payment_status = 'completed' OR p.payment_status = 'refunded'
);


-- ------------------------------------
-- View 6: low_stock_products
-- identifies products with low inventory levels

CREATE OR REPLACE VIEW low_stock_products AS
SELECT 
    p.product_id,
    p.product_name,
    w.warehouse_name,
    i.quantity AS current_stock,
    w.location AS warehouse_location
FROM inventory i
JOIN products p ON i.product_id = p.product_id
JOIN warehouses w ON i.warehouse_id = w.warehouse_id
WHERE i.quantity < 400
ORDER BY i.quantity ASC;


-- ------------------------------------
-- View 7: category_wise_sales
-- calculate the total sales per product category, showing which categories generate the most revenue.

CREATE OR REPLACE VIEW category_wise_sales AS
SELECT 
    c.category_id,
    c.category_name,
    SUM(oi.line_total) AS total_sales
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_id, c.category_name
ORDER BY total_sales DESC;

-- ------------------------------------
-- View 8: most_reliable_suppliers
-- ranks suppliers based on their average lead time for delivering product

CREATE OR REPLACE VIEW most_reliable_suppliers AS
SELECT 
    s.supplier_id,
    s.supplier_name,
    COUNT(ps.product_id) AS total_products_supplied,
    ROUND(AVG(ps.lead_time_days),0) AS average_lead_time
FROM suppliers s
JOIN product_suppliers ps ON s.supplier_id = ps.supplier_id
GROUP BY s.supplier_id, s.supplier_name
HAVING total_products_supplied > 0
ORDER BY average_lead_time ASC, total_products_supplied DESC;

-- --------------------------------------------
-- View 9: Product Performance Overview
-- Lists products with their total sales quantity, total revenue, current inventory, and stock status

CREATE OR REPLACE VIEW product_performance AS
SELECT 
    p.product_id,
    p.product_name,
    p.price,
    IFNULL(SUM(oi.quantity), 0) AS total_sold,
    IFNULL(SUM(oi.line_total), 0) AS total_revenue,
    IFNULL(SUM(i.quantity), 0) AS current_stock,
    CASE 
        WHEN SUM(i.quantity) <= 200 THEN 'Low Stock'
        WHEN SUM(i.quantity) BETWEEN 201 AND 450 THEN 'Moderate Stock'
        ELSE 'Sufficient Stock'
    END AS stock_status
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
LEFT JOIN inventory i ON p.product_id = i.product_id
GROUP BY p.product_id, p.product_name, p.price
ORDER BY total_revenue DESC;

-- --------------------------------------------
-- View 10: Payment Summary
-- Provides an overview of payment activity by method and status, showing transaction counts, totals, averages, and each category’s percentage of total revenue.

CREATE OR REPLACE VIEW payment_summary AS
SELECT 
    payment_method,
    payment_status,
    COUNT(payment_id) AS total_transactions,
    SUM(amount) AS total_amount,
    ROUND(AVG(amount), 2) AS avg_transaction_value,
    CONCAT(ROUND(SUM(amount) / (SELECT SUM(amount) FROM payments) * 100, 2), '%') AS percentage_of_total
FROM payments
GROUP BY payment_method, payment_status;



