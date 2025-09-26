-- Units of Products sold: How many units of of each product is sold?
SELECT product_id, SUM(quantity) AS total_quantity
FROM orders
GROUP BY product_id
ORDER BY total_quantity DESC;