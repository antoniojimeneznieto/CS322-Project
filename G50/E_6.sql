SELECT USER_ID, COUNT(DISTINCT BUSINESS_ID) FROM REVIEWS
GROUP BY USER_ID
ORDER BY COUNT(BUSINESS_ID) DESC
FETCH FIRST 1 ROW ONLY;

-- TODO If I understood correctly, shouldn't we only return the count column ?
-- If that's the case I propose :) :

SELECT MAX(numReviews)
FROM (
    SELECT R.USER_ID, COUNT(DISTINCT R.BUSINESS_ID) AS numReviews
    FROM REVIEWS R
    GROUP BY R.USER_ID
);

