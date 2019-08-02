SELECT (closed_cnt * 100.0) / total_cnt
FROM
(
    SELECT count(case_id) as closed_cnt
    FROM cases
    WHERE status = 'Case Closed Statistically'),
(
    SELECT count(case_id) as total_cnt
    FROM cases);