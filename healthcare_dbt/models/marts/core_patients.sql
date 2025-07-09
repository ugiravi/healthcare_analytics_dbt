-- models/marts/patient_summary.sql
select
    a.patient_id,
    a.full_name,
    a.gender,
    a.date_of_birth,
    r.total_admissions,
    r.total_readmissions,
    r.was_readmitted,
    h.high_heart_rate,
    h.high_temperature,
    h.is_high_risk
from {{ ref('admissions_enriched') }} a
left join {{ ref('readmissions_flags') }} r on a.patient_id = r.patient_id
left join {{ ref('high_risk_patients') }} h on a.patient_id = h.patient_id
