SELECT case_id, filing_date
FROM cases
WHERE filing_date >= '1950-01-01' and filing_date < '1960-01-01'
ORDER BY filing_date
LIMIT 3;