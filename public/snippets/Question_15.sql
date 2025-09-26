-- How would you pay: What is the distribution of customers based on their mode of payment?
SELECT payment_type, COUNT(*) AS total_payments
FROM payments
GROUP BY payment_type;