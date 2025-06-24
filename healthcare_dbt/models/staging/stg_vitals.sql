select 
    vital_id,
    admission_id,
    date,
    heart_rate,
    blood_pressure,
    temperature
from {{ source('healthcare', 'vitals') }} as v
