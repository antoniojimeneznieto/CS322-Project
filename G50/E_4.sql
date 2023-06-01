SELECT BUSINESS_ID, BUSINESS_NAME, REVIEW_COUNT
FROM BUSINESS
WHERE BUSINESS_ID IN (
    SELECT BUSINESS_ID FROM BUSINESS B WHERE REVIEW_COUNT > 3000 AND
        (SELECT COUNT(*) FROM BUSINESS_DIETARY_RESTRICTIONS BDR WHERE B.BUSINESS_ID = BDR.BUSINESS_ID) > 2
    ) ORDER BY REVIEW_COUNT DESC;