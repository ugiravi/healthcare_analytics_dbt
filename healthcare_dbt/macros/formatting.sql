{% macro format_gender(gender_col) %}
    case lower({{ gender_col}})
        when 'm' then 'Male'
        when 'f' then 'female'
        else 'Other'
    end
{% endmacro %}

{% macro calculate_age(ref_date, dob) %}
    case 
        when {{ dob }} is not null and {{ ref_date }} is not null 
        then date_part('year', age({{ ref_date }}, {{ dob }}))
        else null
    end
{% endmacro %}

{% macro readmission_yes_flag(col) %}
    case when {{ col }} = 'Yes' then 1 else 0 end
{% endmacro %}

{% macro readmission_no_flag(col) %}
    case when {{ col }} = 'No' then 1 else 0 end
{% endmacro %}

{% macro was_readmitted_flag(col) %}
    case 
        when sum(case when {{ col }} = 'Yes' then 1 else 0 end) > 0 then true
        else false
    end
{% endmacro %}

{% macro length_of_stay(admission_date, discharge_date) %}
    case
        when {{admission_date}} is not null and {{discharge_date}} is not null
        then {{discharge_date}} - {{admission_date}}
        else null
    end
{% endmacro %}

{% macro high_heart_rate_flag(heart_rate_col) %}
    case when {{heart_rate_col}} > 90 then 1 else 0
    end
{% endmacro %}

{% macro high_temperature_flag(temperature_col) %}
    case when {{temperature_col}} > 100.4 then 1 else 0
    end
{% endmacro %}

{% macro is_high_risk_flag(heart_rate_col, temperature_col) %}
    case 
        when {{heart_rate_col}} > 90 or {{temperature_col}} > 100.4 then 1 
        else 0 
    end
{% endmacro %}
