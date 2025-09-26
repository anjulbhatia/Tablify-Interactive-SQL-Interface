-- Failed vs Successful Trend: Payment outcome over time
SELECT EXTRACT('month' FROM DATE(payment_date)) AS month,
       SUM(CASE WHEN status='Success' THEN 1 ELSE 0 END) AS successful,
       SUM(CASE WHEN status='Failed' THEN 1 ELSE 0 END) AS failed
FROM payments
GROUP BY month
ORDER BY month;