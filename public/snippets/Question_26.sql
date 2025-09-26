-- Average Orders per Customer: Average number of orders each customer makes
SELECT AVG(order_count) AS avg_orders_per_customer
FROM (
  SELECT customer_id, COUNT(order_id) AS order_count
  FROM orders
  GROUP BY customer_id
);