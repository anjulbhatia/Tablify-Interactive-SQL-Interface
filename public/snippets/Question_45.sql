-- Profit/Product: Profit per product
SELECT p.product_name,
       SUM(o.quantity * (o.price_per_unit - p.cost_price)) AS profit
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name;