-- 7-Day MA: 7-day moving average of revenue
SELECT order_date,
       AVG(SUM(quantity * price_per_unit)) OVER (
         ORDER BY order_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
       ) AS moving_avg_revenue
FROM orders
GROUP BY order_date
ORDER BY order_date;