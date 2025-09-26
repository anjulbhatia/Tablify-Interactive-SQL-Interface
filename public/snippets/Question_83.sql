-- Ads Category Targeting : Which product categories should be prioritized in advertising campaigns?
SELECT 
    p.category,
    SUM(o.quantity * o.price_per_unit) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;