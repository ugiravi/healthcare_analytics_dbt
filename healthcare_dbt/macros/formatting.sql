{% macro format_gender(gender_col) %}
    case lower({{ gender_col}})
        when 'm' then 'Male'
        when 'f' then 'female'
        else 'Other'
    end
{% endmacro %}

{% macro calculate_age(dob, ref_date) %}
    case 
        when {{ dob }} is not null and {{ ref_date }} is not null 
        then date_part('year', age({{ ref_date }}, {{ dob }}))
        else null
    end
{% endmacro %}

{% macro readmission_flag(readmitted_col) %}
    case
        when {{readmitted_col}} = 'Yes' then 1 
        when {{readmitted_col}} = 'No' then 0
        else null
    end
{% endmacro %}
