-- 30-Day Churn: Rolling churn rate
SELECT EXTRACT('month' FROM DATE(last_order_date)) AS month,
       100.0 * SUM(CASE WHEN DATE(last_order_date) < CURRENT_DATE - INTERVAL '30 days' THEN 1 ELSE 0 END)/COUNT(*) AS churn_rate
FROM (
  SELECT c.customer_id, MAX(o.order_date) AS last_order_date
  FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  GROUP BY c.customer_id
)
GROUP BY month;