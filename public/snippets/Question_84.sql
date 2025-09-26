-- Discount Effectiveness : Are discounts driving sustainable revenue or just lowering margins?
SELECT 
    discount,
    SUM(quantity * price_per_unit) AS revenue
FROM orders
GROUP BY discount
ORDER BY revenue DESC;