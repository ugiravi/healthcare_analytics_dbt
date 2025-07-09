{% snapshot patients_snapshot %}

{{ 
  config(
    target_schema='snapshots',
    unique_key='patient_id',
    strategy='timestamp',
    updated_at='updated_at' 
  ) 
}}

select
    patient_id,
    first_name,
    last_name,
    gender_cleaned as gender,
    date_of_birth,
    current_timestamp as updated_at 
from {{ ref('stg_patients') }}

{% endsnapshot %}
