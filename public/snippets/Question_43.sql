-- Segment Product: Most popular product per segment
SELECT c.customer_segment, p.product_name, COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_segment, p.product_name
ORDER BY c.customer_segment, order_count DESC;