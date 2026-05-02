{% snapshot snap_customers %}

{{
    config(
        target_schema='ANALYTICS',
        unique_key='customer_id',
        strategy='check',
        check_cols=['customer_name', 'address', 'phone', 'account_balance', 'market_segment']
    )
}}

select * from {{ ref('stg_customers') }}

{% endsnapshot %}
