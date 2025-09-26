-- Orders/Month: Order count by month
SELECT MONTHNAME(DATE(order_date)) AS month, COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;