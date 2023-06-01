SELECT MAX(numReviews)
FROM (
    SELECT COUNT(DISTINCT R.BUSINESS_ID) AS numReviews
    FROM REVIEWS R
    GROUP BY R.USER_ID
);

