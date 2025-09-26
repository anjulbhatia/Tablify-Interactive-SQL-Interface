-- Average Order Value: AOV = Average revenue per order
SELECT AVG(quantity * price_per_unit) AS AOV
FROM orders;