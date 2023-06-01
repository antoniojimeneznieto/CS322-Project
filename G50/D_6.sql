CREATE INDEX idx_tips_tip_text ON Tips (tip_text);
CREATE INDEX idx_tips_tip_date_user_id ON Tips (tip_date, user_id);

SELECT COUNT(DISTINCT T1.business_id) AS count
FROM Tips T1
JOIN Tips T2 ON T2.user_id = T1.user_id
WHERE T1.tip_text LIKE '%awesome%'
  AND T2.tip_date = T1.tip_date - INTERVAL '1' DAY
  AND T2.tip_text LIKE '%awesome%';


-- Optimized Query
CREATE INDEX idx_tips_tip_date ON TIPS(TIP_DATE);
CREATE INDEX idx_tips_user_id ON TIPS(USER_ID);
CREATE INDEX idx_tips_tip_text ON TIPS(TIP_TEXT);

SELECT COUNT(DISTINCT T1.BUSINESS_ID) AS COUNT
FROM TIPS T1
JOIN TIPS T2 ON T1.USER_ID = T2.USER_ID AND T2.TIP_DATE = T1.TIP_DATE - INTERVAL '1' DAY
WHERE T1.TIP_TEXT LIKE '%awesome%' AND T2.TIP_TEXT LIKE '%awesome%';