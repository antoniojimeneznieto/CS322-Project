
with ALL_CITIES_REVIEWS AS (SELECT City_Name, Review_Count FROM Business_Location BL INNER JOIN
    Business B ON B.Business_Id = BL.Business_Id ORDER BY Review_Count DESC)
SELECT City_Name FROM Cities C WHERE
    ((SELECT SUM(REVIEW_COUNT) FROM
        (SELECT Review_Count FROM ALL_CITIES_REVIEWS WHERE City_Name = C.City_Name FETCH FIRST 100 ROWS ONLY))
    > (2 * (SELECT SUM(REVIEW_COUNT) FROM
        (SELECT Review_Count FROM ALL_CITIES_REVIEWS WHERE City_Name = C.City_Name OFFSET 100 ROWS)))) ;



