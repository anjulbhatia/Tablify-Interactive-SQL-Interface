-- Top Customer Reward : Should we introduce loyalty programs for our highest spending customers?
SELECT 
    customer_id,
    SUM(quantity * price_per_unit) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 20;