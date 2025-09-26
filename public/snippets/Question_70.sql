-- Profitability per Cohort: Cohort-level profitability
SELECT EXTRACT('month' FROM DATE(p.launch_date)) AS launch_cohort,
       SUM(o.quantity * (o.price_per_unit - p.cost_price)) AS total_profit
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY launch_cohort;