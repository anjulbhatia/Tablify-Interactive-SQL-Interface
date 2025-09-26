-- Discount vs Sales : Should we increase discounts to drive higher sales?
SELECT 
    discount,
    SUM(quantity * price_per_unit) AS total_sales
FROM orders
GROUP BY discount
ORDER BY discount DESC;
