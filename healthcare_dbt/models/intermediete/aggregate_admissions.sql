select
    a.admission_id,
    max(v.heart_rate) as max_heart_rate,
    max(v.blood_pressure) as max_blood_pressure,
    avg(v.temperature) as avg_temperature
    from {{ ref('stg_admissions') }} a
    left join {{ ref('stg_vitals') }} v on a.admission_id = v.admission_id
group by
    a.admission_id
    