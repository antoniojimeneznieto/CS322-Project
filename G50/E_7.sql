SELECT L.STATE_NAME state_name, COUNT(L.BUSINESS_ID) business_count FROM BUSINESS_LOCATION L,
(SELECT BUSINESS_ID FROM BUSINESS_DIETARY_RESTRICTIONS B
WHERE B.DIETARY_REST_ID =
(SELECT DIETARY_REST_ID FROM DIETARY_RESTRICTIONS 
WHERE DIETARY_REST_DESCRIPTION = 'vegetarian')) VEG
WHERE L.BUSINESS_ID = VEG.BUSINESS_ID
GROUP BY L.STATE_NAME
ORDER BY business_count DESC;