-- Cancellation Rate: Rate of Orders that have been cancelled or returned
SELECT
  100.0 * COUNT(*) FILTER (WHERE status = 'Returned' or status = 'Cancelled') / COUNT(*) AS cancellation_rate
FROM orders;