select 
    admission_id,
    patient_id,
    admission_date, 
    discharge_date, 
    reason,
    readmitted
from {{ source('healthcare', 'admissions') }} as a

