-- States with highest number of customers: Which states have the highest number of customers?
SELECT state, COUNT(customer_id) AS total_customers
FROM customers
GROUP BY state
ORDER BY total_customers DESC;