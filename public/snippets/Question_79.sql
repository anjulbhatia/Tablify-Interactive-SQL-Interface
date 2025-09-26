-- Signup Conversion : Are signups converting to actual purchases?
SELECT 
    COUNT(DISTINCT c.customer_id) AS total_signups,
    COUNT(DISTINCT o.customer_id) AS total_purchasers
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;
