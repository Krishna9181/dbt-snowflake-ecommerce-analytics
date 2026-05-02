{% macro calculate_return_rate(returned_column, total_column) %}
    case
        when {{ total_column }} > 0
        then round({{ returned_column }}::numeric / {{ total_column }} * 100, 2)
        else 0
    end
{% endmacro %}
