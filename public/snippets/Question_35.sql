-- Payment Success Rate: Payment Success Rate = Successful Payments / Total Payments x 100
SELECT
  100.0 * COUNT(*) FILTER (WHERE status = 'Success') / COUNT(*) AS payment_success_rate
FROM payments;