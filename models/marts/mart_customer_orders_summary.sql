with customers as (
    select * from {{ ref('dim_customers') }}
)

select
    region_name,
    nation_name,
    market_segment,
    count(customer_id) as customer_count,
    sum(total_orders) as total_orders,
    sum(lifetime_revenue) as total_revenue,
    avg(avg_order_value) as avg_order_value,
    avg(customer_tenure_days) as avg_customer_tenure_days,
    sum(total_returned_items) as total_returned_items,
    sum(total_items_ordered) as total_items_ordered,
    {{ calculate_return_rate('sum(total_returned_items)', 'sum(total_items_ordered)') }} as return_rate_pct
from customers
group by
    region_name,
    nation_name,
    market_segment
