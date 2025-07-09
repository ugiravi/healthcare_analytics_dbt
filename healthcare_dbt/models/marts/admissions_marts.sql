-- models/marts/admissions_summary.sql
select
    a.admission_id,
    a.patient_id,
    a.admission_date,
    a.discharge_date,
    a.reason,
    a.length_of_stay,
    a.age_at_admission,
    a.readmitted,
    v.avg_heart_rate,
    v.max_heart_rate,
    v.min_heart_rate,
    v.avg_temperature,
    v.max_temperature,
    v.min_temperature,
    r.was_readmitted -- patient-level flag indicating if ever readmitted
from {{ ref('admissions_enriched') }} a
left join {{ ref('vital_summary_by_admissions') }} v on a.admission_id = v.admission_id
left join {{ ref('readmissions_flags') }} r on a.patient_id = r.patient_id
