{% snapshot snap_suppliers %}

{{
    config(
        target_schema=target.schema,
        unique_key='supplier_id',
        strategy='check',
        check_cols=['supplier_name', 'address', 'phone', 'account_balance']
    )
}}

select * from {{ ref('stg_suppliers') }}

{% endsnapshot %}
