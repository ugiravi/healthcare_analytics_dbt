{% macro format_gender(gender_col) %}
    case lower({{ gender_col}})
        when 'm' then 'Male'
        when 'f' then 'female'
        else 'Other'
    end
{% endmacro %}