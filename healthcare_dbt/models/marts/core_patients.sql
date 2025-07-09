-- models/marts/patient_summary.sql
select
    p.patient_id,
    p.full_name,
    p.gender,
    p.date_of_birth,
    r.total_admissions,
    r.total_readmissions,
    r.was_readmitted,
    h.high_heart_rate,
    h.high_temperature,
    h.is_high_risk
from {{ ref('stg_patients') }} p
left join {{ ref('readmissions_flags') }} r on p.patient_id = r.patient_id
left join {{ ref('high_risk_patients') }} h on p.patient_id = h.patient_id
