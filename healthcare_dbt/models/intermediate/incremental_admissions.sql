{{ config(
    materialized='incremental',
    unique_key='admission_id'
) }}

with base as (

    select
        admission_id,
        patient_id,
        admission_date,
        discharge_date,
        reason,
        readmitted,
        {{length_of_stay('admission_date', 'discharge_date')}} as length_of_stay
    from {{ ref('stg_admissions') }}

)

select * from base

{% if is_incremental() %}
where admission_date > (select max(admission_date) from {{ this }})
{% endif %}
