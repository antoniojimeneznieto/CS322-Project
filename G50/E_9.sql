-- TODO Select one of the implementation

SELECT COUNT(CATEGORY_ID)
FROM BUSINESS_HAS_CATEGORIES
GROUP BY BUSINESS_ID
ORDER BY COUNT(CATEGORY_ID) DESC
FETCH FIRST 1 ROW ONLY;

SELECT MAX(numCategories) AS count
FROM (
    SELECT COUNT(CATEGORY_ID) AS numCategories
    FROM BUSINESS_HAS_CATEGORIES
    GROUP BY business_id
);


