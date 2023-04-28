SELECT Y.USER_ID, Y.USER_NAME, Y.YELPING_SINCE FROM USER_YELP Y
WHERE Y.YELPING_SINCE < '01-JAN-2007'
AND LENGTH(Y.USER_NAME) = 1
ORDER BY Y.USER_NAME
FETCH FIRST 50 ROWS ONLY;