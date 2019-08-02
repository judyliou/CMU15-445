SELECT name, cnt, 
    success * 100.0 / cnt AS success_rate
FROM(
    SELECT name, count(*) AS cnt,
            SUM(CASE WHEN disposition = 'Not Guilty' THEN 1 ELSE 0 END) AS success
    FROM attorneys, charges
    WHERE attorneys.case_id = charges.case_id
    AND attorneys.name <> ''
    GROUP BY name)
WHERE cnt > 100
ORDER BY success_rate DESC, cnt DESC
LIMIT 1 OFFSET 6;
