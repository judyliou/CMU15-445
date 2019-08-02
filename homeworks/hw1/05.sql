SELECT count(case_id) as cnt, substr(filing_date, 1, 3) || '0s' AS decade  
FROM cases
WHERE filing_date is not ''
GROUP BY decade 
ORDER BY cnt desc
LIMIT 3;