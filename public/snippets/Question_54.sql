-- YOY Growth: Year-over-year revenue growth
SELECT EXTRACT(YEAR FROM order_date) AS year,
       SUM(quantity * price_per_unit) AS revenue,
       LAG(SUM(quantity * price_per_unit)) OVER (ORDER BY EXTRACT(YEAR FROM order_date)) AS prev_year_revenue,
       (SUM(quantity * price_per_unit) - LAG(SUM(quantity * price_per_unit)) OVER (...)) /
       NULLIF(LAG(SUM(quantity * price_per_unit)) OVER (...), 0) * 100 AS yoy_growth
FROM orders
GROUP BY year
ORDER BY year;
