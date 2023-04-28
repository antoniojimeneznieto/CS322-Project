SELECT BUSINESS_NAME, REVIEW_COUNT 
FROM BUSINESS B
WHERE B.BUSINESS_ID IN
(SELECT BUSINESS_ID FROM BUSINESS_LOCATION 
WHERE CITY_NAME LIKE '%las vegas%')
AND B.BUSINESS_ID IN
(SELECT BUSINESS_ID FROM BUSINESS_PARKING_TYPE P
WHERE P.PARKING_TYPE_ID =
(SELECT PARKING_TYPE_ID FROM PARKING_TYPE WHERE PARKING_TYPE_DESCRIPTION = 'valet'))
AND B.BUSINESS_ID IN
(SELECT BUSINESS_ID FROM BUSINESS_HOURS H
WHERE H.DAY_ID =
(SELECT DAY_ID FROM DAY_OF_WEEK WHERE DAY_NAME = 'Friday'))
AND B.STARS = 5.0
ORDER BY B.BUSINESS_NAME;