-- Discount Dependency: Segment by discount usage
SELECT customer_id,
       100.0 * SUM(CASE WHEN discount > 0 THEN 1 ELSE 0 END)/COUNT(*) AS discount_usage_pct
FROM orders
GROUP BY customer_id;