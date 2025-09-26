-- Payment Fail %: Failed orders by payment type
SELECT p.payment_type,
       100.0 * SUM(CASE WHEN p.status='Failed' THEN 1 ELSE 0 END) / COUNT(*) AS fail_pct
FROM payments p
GROUP BY p.payment_type;