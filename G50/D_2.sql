SELECT State_Name, COUNT(DISTINCT Business_Id) AS Num_Businesses FROM Business_Location
    GROUP BY State_Name ORDER BY Num_Businesses DESC FETCH FIRST 10 ROWS ONLY;