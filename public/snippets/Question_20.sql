-- Average Revenue Per Customer: Average Revenue = Total Revenue from Each customer on every order / Number of Customers
SELECT AVG(total_revenue) AS avg_revenue_per_customer
FROM (
  SELECT c.customer_id, SUM(o.quantity * o.price_per_unit) AS total_revenue
  FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  GROUP BY c.customer_id
) sub;