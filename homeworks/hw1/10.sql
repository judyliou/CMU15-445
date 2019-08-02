SELECT zip, count(*) cnt
FROM charges, parties
WHERE charges.case_id = parties.case_id
    AND zip <> ''
GROUP BY zip
ORDER BY cnt DESC
LIMIT 3;