-- Undiscounted Orders: Find the number of orders placed without any discounts 
SELECT COUNT(*) AS orders_without_discount
FROM orders
WHERE discount = 0 OR discount IS NULL;
