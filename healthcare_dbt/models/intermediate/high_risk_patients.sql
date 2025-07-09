select 
    a.patient_id, 
    max({{high_heart_rate_flag('v.heart_rate')}}) = 1 as high_heart_rate,
    max({{high_temperature_flag('v.temperature')}}) = 1 as high_temperature,
    max({{is_high_risk_flag('v.heart_rate', 'v.temperature')}}) = 1 as is_high_risk
    from {{ ref('admissions_enriched') }} a
join {{ ref('stg_vitals') }} v on a.admission_id = v.admission_id
group by a.patient_id
