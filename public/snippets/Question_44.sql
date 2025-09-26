-- Payment Fail Orders: Orders with no successful payment
SELECT o.order_id
FROM orders o
LEFT JOIN payments p ON o.order_id = p.order_id AND p.status = 'Success'
WHERE p.payment_id IS NULL;