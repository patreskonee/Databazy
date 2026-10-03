--7
SELECT 
    c.region,
    SUM(o.sales) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region;
--8
SELECT 
    c.customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;
--9
SELECT 
    p.sub_category,
    AVG(o.discount) AS avg_discount
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.sub_category;
--10
SELECT 
    c.customer_name,
    SUM(o.sales) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.sales) > 2000;
--11
SELECT 
    c.region,
    SUM(o.sales) AS total_sales,
    AVG(o.discount) AS avg_discount,
    COUNT(DISTINCT o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region;
--12
SELECT 
    c.region,
    COUNT(DISTINCT CASE WHEN o.sales > 1000 THEN o.order_id END) AS high_value_orders,
    COUNT(DISTINCT CASE WHEN o.sales <= 1000 THEN o.order_id END) AS low_value_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region;
--13
SELECT 
    c.customer_name,
    SUM(o.sales) AS total_sales,
    AVG(o.discount) AS avg_discount,
    COUNT(DISTINCT o.order_id) AS order_count,
    CASE 
        WHEN SUM(o.sales) > 2500 THEN 'VIP'
        ELSE 'REGULAR'
    END AS customer_type
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_sales DESC;