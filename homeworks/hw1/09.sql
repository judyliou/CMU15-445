WITH count_table AS (
    SELECT race, disposition, count(charges.case_id) cnt
    FROM charges, parties
    WHERE charges.case_id = parties.case_id
        AND parties.race <> ''
        AND parties.race IN ('African American', 'Caucasian')
        AND charges.disposition IN ('Guilty', 'Not Guilty')
    GROUP BY race, disposition),
aggregate_table AS(
    SELECT disposition, sum(cnt) as aggr_cnt
    FROM count_table
    GROUP BY disposition
)
SELECT race, count_table.disposition, cnt * 100.0 / aggr_cnt
FROM count_table, aggregate_table
WHERE count_table.disposition = aggregate_table.disposition;
