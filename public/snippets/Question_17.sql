-- Net sales: Net Sales = Total Sales - Discounts
SELECT SUM((quantity * price_per_unit) - discount) AS net_revenue
FROM orders
WHERE status != 'Cancelled';