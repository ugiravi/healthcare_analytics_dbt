select 
    a.admission_id,
    a.patient_id,
    a.admission_date, 
    a.discharge_date,
    a.reason,
    a.readmitted,
    {{length_of_stay('a.admission_date', 'a.discharge_date')}} as length_of_stay,
    p.first_name,
    p.last_name,
    p.full_name,
    p.gender_cleaned as gender,
    {{calculate_age('a.admission_date', 'p.date_of_birth')}} as age_at_admission
from {{ ref('stg_admissions') }} a
join {{ ref('stg_patients') }} p on a.patient_id = p.patient_id