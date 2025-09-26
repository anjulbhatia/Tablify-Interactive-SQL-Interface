-- Average Discount per Order: Average discount per order 
SELECT AVG(discount / NULLIF(quantity * price_per_unit, 0) * 100) AS avg_discount_pct
FROM orders;