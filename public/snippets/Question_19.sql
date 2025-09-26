-- Profit margin % of product: Profit Margin = (Selling Price - Cost Price)/Cost Price * 100
SELECT p.product_name,
       ROUND(100.0 * (SUM(o.quantity * o.price_per_unit) - SUM(o.quantity * p.cost_price)) / SUM(o.quantity * o.price_per_unit),1) AS profit_margin_pct
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name;