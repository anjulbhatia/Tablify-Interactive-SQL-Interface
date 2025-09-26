-- Average Transaction Amount: Transaction Variance from different pyment types
SELECT 
    payment_type, 
    AVG(amount) AS avg_transaction_amount
FROM payments
GROUP BY payment_type
ORDER BY avg_transaction_amount DESC;