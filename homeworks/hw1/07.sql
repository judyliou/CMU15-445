SELECT parties.name, COUNT(DISTINCT cases.violation_county) AS cnt
FROM cases, parties
WHERE cases.case_id = parties.case_id
    AND  parties.type = 'Defendant'
    AND parties.name != ''
GROUP BY parties.name
ORDER BY cnt DESC
LIMIT 3;