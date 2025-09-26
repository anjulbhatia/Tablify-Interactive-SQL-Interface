-- Profitable Segments : Which customer segments generate the highest revenue and profits?
SELECT 
    customer_segment,
    SUM(o.quantity * o.price_per_unit) AS total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY customer_segment
ORDER BY total_revenue DESC;
