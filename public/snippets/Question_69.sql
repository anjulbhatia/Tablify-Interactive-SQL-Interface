-- Category Preference: Favorite category per customer
SELECT c.customer_id, p.category, COUNT(*) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_id, p.category
ORDER BY c.customer_id, order_count DESC;