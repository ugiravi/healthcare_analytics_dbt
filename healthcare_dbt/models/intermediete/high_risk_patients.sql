select 
    a.patient_id, 
    max(case when v.heart_rate > 90 then 1 else 0 end) = 1 as high_heart_rate,
    max(case when v.temperature > 100.4 then 1 else 0 end) = 1 as high_temperature,
    max(case when v.heart_rate > 90 or v.temperature > 100.4 then 1 else 0 end) = 1 as is_high_risk
    from {{ ref('stg_admissions') }} a
join {{ ref('stg_vitals') }} v on a.admission_id = v.admission_id
group by a.patient_id
