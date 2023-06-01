SELECT MIN(COUNT_ID) min_categories, MAX(COUNT_ID) max_categories,
       AVG(COUNT_ID) mean_categories, MEDIAN(COUNT_ID) median_categories  FROM
(SELECT NVL(COUNT(CATEGORY_ID), 0) COUNT_ID FROM (Business LEFT JOIN BUSINESS_HAS_CATEGORIES ON Business.Business_Id = Business_Has_Categories.Business_Id) GROUP BY Business.BUSINESS_ID)