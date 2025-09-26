-- Retention vs New : Should we invest more in retaining repeat customers or acquiring new ones?
SELECT 
    customer_segment,
    COUNT(DISTINCT c.customer_id) AS num_customers,
    SUM(quantity * price_per_unit) AS total_sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY customer_segment;