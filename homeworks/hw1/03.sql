select violation_county, count(cases.case_id) as cnt
from cases, charges
where cases.case_id = charges.case_id
    and violation_county <> ''
    and description like '%RECKLESS%'
group by violation_county
order by cnt desc, violation_county asc
limit 3;