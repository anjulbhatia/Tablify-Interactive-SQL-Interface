-- Discount Dependancy : How many products are sold only when a discount is offered
SELECT
  100.0 * COUNT(*) FILTER (WHERE discount > 0) / COUNT(*) AS discount_dependency_pct
FROM orders;