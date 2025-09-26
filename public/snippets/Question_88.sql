-- Price Sensitivity : Should we adjust product prices based on customer sensitivity?
SELECT 
    p.product_name,
    AVG(o.price_per_unit) AS avg_price,
    SUM(o.quantity) AS total_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name;