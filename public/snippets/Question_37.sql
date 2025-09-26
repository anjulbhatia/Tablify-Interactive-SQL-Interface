-- Adoption of payment methods: Which payment method is used the most
SELECT payment_type, COUNT(*) AS usage_count
FROM payments
GROUP BY payment_type
ORDER BY usage_count DESC;