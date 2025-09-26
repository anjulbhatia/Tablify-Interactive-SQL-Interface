-- Repeat Purchase Rate: Percentage of customers that order multiple times
SELECT 100.0 * COUNT(DISTINCT customer_id) FILTER (WHERE order_count > 1) / COUNT(DISTINCT customer_id) AS repeat_purchase_rate
FROM (
  SELECT customer_id, COUNT(order_id) AS order_count
  FROM orders
  GROUP BY customer_id
) sub;
