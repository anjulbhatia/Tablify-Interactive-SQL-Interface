-- Preferred Payment Method : Which payment method should we prioritize for revenue growth?
SELECT 
    payment_type,
    SUM(amount) AS total_revenue
FROM payments
GROUP BY payment_type
ORDER BY total_revenue DESC;