-- Failed Payments by State: Which state reports the most failed payments
SELECT o.state,
       100.0 * COUNT(*) FILTER (WHERE p.status = 'Failed') / COUNT(*) AS failed_payment_pct
FROM payments p
JOIN orders o ON p.order_id = o.order_id
GROUP BY o.state
ORDER BY failed_payment_pct DESC;