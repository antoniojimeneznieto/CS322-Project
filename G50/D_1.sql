SELECT City_Name FROM Cities WHERE (State_Name, City_Name) NOT IN
        (SELECT State_Name, City_Name FROM Business_Location INNER JOIN
        (SELECT Business_Id FROM Business_Hours GROUP BY Business_Id HAVING COUNT(DISTINCT Day_Id) > 4)
         IDS ON IDS.Business_Id = Business_Location.Business_Id) ORDER BY City_Name;