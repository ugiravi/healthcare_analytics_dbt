select 
    a.patient_id,
    count(*) as total_admissions, 
    sum({{readmission_yes_flag('a.readmitted')}}) as total_readmissions,
    sum({{readmission_no_flag('a.readmitted')}}) as total_non_readmissions,
    {{was_readmitted_flag('a.readmitted')}} as was_readmitted
from {{ref('admissions_enriched')}} a
group by a.patient_id