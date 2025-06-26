select
    a.admission_id,
    a.patient_id,
    a.admission_date,
    a.discharge_date,
    a.reason,
    a.readmitted,
    a.first_name,
    a.last_name,
    a.full_name,
    a.gender_cleaned,
    v.max_heart_rate,
    v.max_blood_pressure,
    v.avg_temperature
from {{ ref('admissions_with_patient_info') }} a
left join {{ ref('aggregate_admissions') }} v on a.admission_id = v.admission_id
