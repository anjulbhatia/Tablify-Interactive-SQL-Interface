-- Revenue Trend: Monthly revenue trend
SELECT DATE_TRUNC('month', DATE(order_date)) AS month, SUM(quantity * price_per_unit) AS revenue
FROM orders
GROUP BY month
ORDER BY month;