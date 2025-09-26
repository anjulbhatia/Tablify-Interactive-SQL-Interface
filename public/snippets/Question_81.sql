-- High Growth Cities : Which cities contribute the most to overall growth?
SELECT 
    city,
    SUM(quantity * price_per_unit) AS total_sales
FROM orders
GROUP BY city
ORDER BY total_sales DESC;