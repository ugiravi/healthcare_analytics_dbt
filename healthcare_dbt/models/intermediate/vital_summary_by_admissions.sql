select
  admission_id,
  avg(avg_heart_rate) as avg_heart_rate,
  max(max_heart_rate) as max_heart_rate,
  min(min_heart_rate) as min_heart_rate,
  avg(avg_temperature) as avg_temperature,
  max(max_temperature) as max_temperature,
  min(min_temperature) as min_temperature
from {{ ref('daily_vital_trends') }}
group by admission_id
