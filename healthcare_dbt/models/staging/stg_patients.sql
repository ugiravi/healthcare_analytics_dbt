select 
    patient_id,
    first_name,
    last_name,
    gender,
    {{ format_gender('gender')}} as gender_cleaned,
    date_of_birth,
    upper(first_name || ' ' || last_name) as full_name
from {{ source('healthcare', 'patients') }} as p