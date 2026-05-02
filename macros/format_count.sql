{% macro format_count(column_name) %}
    case
        when abs({{ column_name }}) >= 1000000
        then round({{ column_name }} / 1000000, 2)::varchar || ' M'
        when abs({{ column_name }}) >= 1000
        then round({{ column_name }} / 1000, 2)::varchar || ' K'
        else round({{ column_name }}, 2)::varchar
    end
{% endmacro %}
