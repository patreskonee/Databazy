SELECT 
    o.order_id,
    c.customer_name,
    p.categotry,
    o.sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;

SELECT 
    c.region,
    COALESCE(SUM(o.sales), 0) AS total_sales
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region;

SELECT 
    p.product_name,
    COALESCE(SUM(o.sales), 0) AS total_sales
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name;

SELECT 
    c.customer_name,
    o.order_id,
    o.sales
FROM customers c
FULL JOIN orders o ON c.customer_id = o.customer_id;