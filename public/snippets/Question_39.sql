-- Revenue Loss from Failed Payments: How much revenue is lost because payments fail?
SELECT SUM(o.quantity * o.price_per_unit) AS revenue_loss
FROM payments p
JOIN orders o ON p.order_id = o.order_id
WHERE p.status = 'Failed';