select
 admission_id,
 avg(heart_rate) as avg_heart_rate, 
 max(heart_rate) as max_heart_rate,
 min(heart_rate) as min_heart_rate,
 avg(temperature) as avg_temperature,
 max(temperature) as max_temperature,
 min(temperature) as min_temperature
from {{ ref('stg_vitals') }}
group by admission_id, date
order by admission_id, date