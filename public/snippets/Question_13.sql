-- Out of Stock: Which products are out of stock but appearing in orders?
SELECT DISTINCT p.product_id, p.product_name
FROM products p
JOIN orders o ON p.product_id = o.product_id
WHERE p.availability = 'Out of Stock';