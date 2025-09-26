-- Total Revenue: Gross Sales = Quantity Sold * Price
SELECT SUM(quantity * price_per_unit) AS total_revenue
FROM orders
WHERE status != 'Cancelled';