-- RFM: RFM segmentation base table
SELECT customer_id,
       MAX(order_date) AS recent_purchase,
       COUNT(order_id) AS frequency,
       SUM(quantity * price_per_unit) AS monetary
FROM orders
GROUP BY customer_id;