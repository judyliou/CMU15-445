SELECT filing_year, AVG(age) avg_age
FROM(
    SELECT strftime('%Y', cases.filing_date) filing_year,
        (strftime('%Y.%m%d', cases.filing_date) - strftime('%Y.%m%d', parties.dob))age
    FROM cases, parties, charges
    WHERE cases.case_id = parties.case_id
        AND cases.case_id = charges.case_id
        AND  charges.disposition = 'Guilty'
        AND cases.filing_date <> ''
        AND parties.type = 'Defendant'
        AND parties.name <> ''
        AND 0 < age AND age < 100)
GROUP BY filing_year
ORDER BY filing_year DESC
LIMIT 5;