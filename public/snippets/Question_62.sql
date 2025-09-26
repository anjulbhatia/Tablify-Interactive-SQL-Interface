-- Frequency Segment: Segment by order frequency
SELECT customer_id,
       CASE WHEN COUNT(order_id) = 1 THEN 'One-time'
            WHEN COUNT(order_id) BETWEEN 2 AND 5 THEN 'Occasional'
            ELSE 'Frequent'
       END AS frequency_segment
FROM orders
GROUP BY customer_id;