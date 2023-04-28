/**
   WARNING: ASSUMPTION:
    When HOURS_FROM From == HOURS_TO == 0:0, we consider that it is open the full day
 */

SELECT COUNT(BUSINESS_ID) FROM (
    (SELECT BUSINESS_ID FROM BUSINESS_HAS_CATEGORIES
                        WHERE CATEGORY_ID IN
        (SELECT CATEGORY_ID FROM BUSINESS_CATEGORIES
                            WHERE CATEGORY_NAME LIKE '%Dry Cleaning%'))
    INTERSECT
    (SELECT DISTINCT BUSINESS_ID FROM BUSINESS_HOURS
                                 WHERE DAY_ID IN
        (SELECT DAY_ID FROM DAY_OF_WEEK
                       WHERE DAY_NAME LIKE 'Saturday' OR DAY_NAME LIKE 'Sunday')));
