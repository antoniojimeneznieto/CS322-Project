
with ALL_CITIES_REVIEWS AS (SELECT City_Name, State_Name, Review_Count FROM Business_Location BL INNER JOIN
    Business B ON B.Business_Id = BL.Business_Id ORDER BY Review_Count DESC)
SELECT CITY_NAME as city from (
SELECT CITY_NAME, STATE_NAME FROM Cities C WHERE
    ((SELECT SUM(REVIEW_COUNT) FROM
        (SELECT Review_Count FROM ALL_CITIES_REVIEWS ACR WHERE ACR.City_Name = C.City_Name AND ACR.State_Name = C.State_Name FETCH FIRST 100 ROWS ONLY))
    > (2 * (SELECT SUM(REVIEW_COUNT) FROM
        (SELECT Review_Count FROM ALL_CITIES_REVIEWS ACR WHERE ACR.City_Name = C.CITY_NAME AND ACR.State_Name = C.State_Name OFFSET 100 ROWS)))));