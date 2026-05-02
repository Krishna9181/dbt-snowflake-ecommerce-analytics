{% snapshot snap_parts %}

{{
    config(
        target_schema=target.schema,
        unique_key='part_id',
        strategy='check',
        check_cols=['part_name', 'manufacturer', 'brand', 'part_type', 'part_size', 'container', 'retail_price']
    )
}}

select * from {{ ref('stg_parts') }}

{% endsnapshot %}
