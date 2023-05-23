SELECT * FROM (
    SELECT R.Business_Id, ROW_NUMBER() OVER (PARTITION BY R.Business_Id ORDER BY Review_Count DESC) as Reviewer_Rank, UC.Review_Count FROM (
        ((SELECT Business_Id FROM Business ORDER BY Review_Count DESC FETCH FIRST 10 ROWS ONLY) B
            INNER JOIN Reviews R ON B.Business_Id = R.Business_Id)
        INNER JOIN
            (SELECT User_Id, COUNT(*) AS Review_Count FROM Reviews GROUP BY User_Id ORDER BY COUNT(*) DESC) UC
        ON R.User_Id = UC.User_Id))
WHERE Reviewer_Rank < 4 ORDER BY Business_Id, Reviewer_Rank;
