-- Expansion Opportunities : Should we expand into new states for higher sales potential?
SELECT 
    state,
    SUM(quantity * price_per_unit) AS total_sales
FROM orders
GROUP BY state
ORDER BY total_sales DESC;
