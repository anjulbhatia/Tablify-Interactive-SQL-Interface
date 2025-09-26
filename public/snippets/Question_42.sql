-- Regional Revenue: Revenue by region
SELECT o.state, SUM(o.quantity * o.price_per_unit) AS total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY o.state
ORDER BY total_revenue DESC;