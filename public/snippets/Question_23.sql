-- Customer churn rate: Inactive Customers (where last order was 6 months earlier) as a % of total customers
SELECT
  100.0 * COUNT(*) FILTER (WHERE DATE(last_order_date) < CURRENT_DATE - INTERVAL '6 months') / COUNT(*) AS churn_rate
FROM (
  SELECT c.customer_id, MAX(o.order_date) AS last_order_date
  FROM customers c
  LEFT JOIN orders o ON c.customer_id = o.customer_id
  GROUP BY c.customer_id
);