-- Gross margin: Gross Margin = Revenue - Cost of Goods Sold
SELECT SUM((o.quantity * o.price_per_unit) - (o.quantity * p.cost_price)) AS gross_margin
FROM orders o
JOIN products p ON o.product_id = p.product_id;