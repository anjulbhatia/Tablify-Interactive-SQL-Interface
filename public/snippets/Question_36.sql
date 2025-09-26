-- Average Payment Lag : Day of Order - Payment Day
SELECT AVG(DATE(p.payment_date) - DATE(o.order_date)) AS avg_payment_lag_days
FROM payments p
JOIN orders o ON p.order_id = o.order_id;