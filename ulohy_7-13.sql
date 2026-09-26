SELECT 
    c.region,
    SUM(o.sales) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region;

SELECT 
    c.customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

SELECT 
    p.categotry,
    AVG(o.discount) AS avg_discount
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.categotry;
