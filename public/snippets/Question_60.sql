-- Repeat Purchase Gap: Avg time between repeat orders
SELECT customer_id, AVG(DATE(next_order) - DATE(order_date)) AS avg_gap_days
FROM (
  SELECT customer_id, order_date,
         LEAD(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS next_order
  FROM orders
) sub
WHERE next_order IS NOT NULL
GROUP BY customer_id;