with admissions_with_patient_info as (
    select
        a.admission_id,
        a.patient_id,
        a.admission_date,
        a.discharge_date,
        a.reason,
        a.readmitted,
        p.first_name,
        p.last_name,
        p.full_name,
        p.gender_cleaned
    from {{ ref('stg_admissions') }} a
    join {{ ref('stg_patients') }} p on a.patient_id = p.patient_id
),

admissions_with_vitals as (
    select 
        v.admission_id,
        v.date as vital_date,
        v.heart_rate,
        v.blood_pressure,
        v.temperature
    from {{ ref('stg_vitals') }} v
),

aggregate_admissions as (
    select 
        a.admission_id,
        a.patient_id,
        a.admission_date,
        a.discharge_date,
        a.reason,
        a.readmitted,
        a.first_name,
        a.last_name,
        a.gender_cleaned,
        max(v.heart_rate) as max_heart_rate,
        avg(v.temperature) as avg_temperature
    from admissions_with_patient_info a
    left join admissions_with_vitals v on a.admission_id = v.admission_id
    group by
        a.admission_id,
        a.patient_id,
        a.admission_date,
        a.discharge_date,
        a.reason,
        a.readmitted,
        a.first_name,
        a.last_name,
        a.gender_cleaned
),

final as (
    select
        patient_id,
        first_name,
        last_name,
        gender_cleaned,
        count(distinct admission_id) as total_admissions,
        max(admission_date) as latest_admission,
        avg(max_heart_rate) as avg_max_heart_rate,
        avg(avg_temperature) as avg_temp
    from aggregate_admissions
    group by patient_id, first_name, last_name, gender_cleaned
)

select * from final
