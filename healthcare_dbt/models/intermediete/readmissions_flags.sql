select 
    a.patient_id,
    count(*) as total_admissions, 
    sum({{readmission_flag('a.readmitted')}}) as total_readmissions,
    sum(case when a.readmitted = 'No' then 1 else 0 end) as total_non_readmissions,
    case when sum(case when a.readmitted = 'Yes' then 1 else 0 end) > 0 then true else false end as was_readmitted 
from {{ref('stg_admissions')}} a
join {{ref('stg_patients')}} p on a.patient_id = p.patient_id
group by a.patient_id