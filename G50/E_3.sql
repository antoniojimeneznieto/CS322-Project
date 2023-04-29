SELECT BUSINESS_ID
FROM REVIEWS
GROUP BY BUSINESS_ID
HAVING COUNT(REVIEW_ID) > 1030
ORDER BY COUNT(REVIEW_ID);

