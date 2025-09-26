-- Order Completion Rate: Percentage of orders that are completed
SELECT
  100.0 * SUM(CASE WHEN status = 'Delivered' THEN 1 ELSE 0 END) / COUNT(*) AS completion_rate
FROM orders;