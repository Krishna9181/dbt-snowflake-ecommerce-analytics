{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

with order_items as (
    select * from {{ ref('int_order_items') }}
    {% if is_incremental() %}
    where order_date > (select max(order_date) from {{ this }})
    {% endif %}
)

select
    order_id,
    customer_id,
    order_date,
    order_status,
    order_priority,
    count(line_number) as line_item_count,
    sum(quantity) as total_quantity,
    sum(extended_price) as gross_revenue,
    sum(discounted_price) as net_revenue,
    sum(total_price) as total_revenue_with_tax,
    avg(discount) as avg_discount,
    min(ship_date) as first_ship_date,
    max(ship_date) as last_ship_date,
    avg(days_to_ship) as avg_days_to_ship,
    count(distinct ship_mode) as distinct_ship_modes,
    sum(case when return_flag = 'R' then 1 else 0 end) as returned_items,
    count(distinct brand) as distinct_brands
from order_items
group by
    order_id,
    customer_id,
    order_date,
    order_status,
    order_priority
