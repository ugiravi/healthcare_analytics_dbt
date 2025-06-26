
select 
    a.admission_id,
    a.patient_id,
    a.admission_date, 
    a.discharge_date,
    a.reason,
    a.readmitted,
    p.first_name,
    p.last_name,
    p.full_name,
    p.gender_cleaned
from {{ ref('stg_admissions') }} a
join {{ ref('stg_patients') }} p on a.patient_id = p.patient_id


