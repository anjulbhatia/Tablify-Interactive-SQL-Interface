-- Average Rating Problem: Find the average rating of products in each category
SELECT category, ROUND(AVG(rating),1) AS avg_rating
FROM products
GROUP BY category
ORDER BY avg_rating DESC;