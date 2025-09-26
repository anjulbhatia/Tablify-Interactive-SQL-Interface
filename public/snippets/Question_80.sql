-- Payment Failures : Should we fix failed payment flows to reduce revenue leakage?
SELECT 
    status,
    COUNT(*) AS count_orders,
    SUM(amount) AS total_amount
FROM payments
GROUP BY status;