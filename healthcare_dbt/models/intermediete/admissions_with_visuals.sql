select
    v.admission_id,
    v.date as vital_date,
    v.heart_rate,
    v.blood_pressure,
    v.temperature
from {{ ref('stg_vitals') }} v
    