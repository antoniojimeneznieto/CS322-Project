SELECT COUNT(DISTINCT BUSINESS_ID) AS COUNT
FROM TIPS T1
WHERE T1.TIP_TEXT LIKE '%awesome%' AND T1.USER_ID IN (
    SELECT T2.USER_ID
    FROM TIPS T2
    WHERE T2.TIP_DATE = T1.TIP_DATE - INTERVAL '1' DAY AND T2.TIP_TEXT LIKE '%awesome%'
);
