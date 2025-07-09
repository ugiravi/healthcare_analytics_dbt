select 
    a.reason,
    count(*) as total_admissions,
    avg(a.discharge_date - a.admission_date) as avg_length_of_stay,
    avg(case when a.readmitted = 'Yes' then 1.0 else 0.0 end) as readmission_rate
from {{ ref('stg_admissions') }} a
group by a.reason
