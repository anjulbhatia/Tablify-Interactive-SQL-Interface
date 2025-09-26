-- Spend Segment: Segment by spend level
SELECT customer_id,
       CASE 
         WHEN SUM(quantity * price_per_unit) < 5000 THEN 'Low'
         WHEN SUM(quantity * price_per_unit) BETWEEN 5000 AND 20000 THEN 'Medium'
         ELSE 'High'
       END AS spend_segment
FROM orders
GROUP BY customer_id;