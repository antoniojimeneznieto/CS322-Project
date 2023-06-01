SELECT MAX(numReviews) AS count
FROM (
    SELECT R.USER_ID, COUNT(DISTINCT R.BUSINESS_ID) AS numReviews
    FROM REVIEWS R
    GROUP BY R.USER_ID
);

