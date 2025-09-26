-- Churn Reduction : Should we invest in reducing churn among specific customer groups?
SELECT 
    customer_segment,
    COUNT(DISTINCT c.customer_id) AS num_customers,
    COUNT(DISTINCT o.customer_id) AS active_customers
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY customer_segment;