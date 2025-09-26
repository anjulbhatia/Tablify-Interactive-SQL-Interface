-- Sales & Ratings: Correlation between rating & sales
SELECT p.product_name, p.rating, SUM(o.quantity) AS total_units_sold
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name, p.rating
ORDER BY p.rating DESC;