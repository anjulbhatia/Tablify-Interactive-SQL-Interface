-- Expensive Shopping: What are the most expensive products?
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 3;