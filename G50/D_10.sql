WITH VALID_REVIEWS AS (SELECT Business_Id, COUNT(*) Count FROM Reviews WHERE User_Id IN
    (SELECT User_Id FROM User_Yelp where User_Id NOT IN (
        SELECT User_Id FROM (SELECT User_Id, COUNT(Friends_Id) Count FROM Friends GROUP BY USER_ID) WHERE COUNT > 2
        )
    ) GROUP BY BUSINESS_ID
) SELECT NVL(SUM, 0) Review_Count, C.City_Name FROM Cities C LEFT OUTER JOIN
    (SELECT City_Name, State_Name, SUM(COUNT) SUM FROM VALID_REVIEWS VR INNER JOIN
        (SELECT Business_Id, City_Name, State_Name FROM Business_Location) BL
        ON BL.Business_Id=VR.Business_Id GROUP BY City_Name, State_Name) CC
    ON C.City_Name = CC.City_Name AND C.State_Name = CC.State_Name ORDER BY Review_Count, City_Name;
