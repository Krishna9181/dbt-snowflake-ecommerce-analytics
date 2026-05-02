with customers as (
    select * from {{ ref('int_customer_enriched') }}
),

orders as (
    select * from {{ ref('fct_orders') }}
)

select
    c.customer_id,
    c.customer_name,
    c.address,
    c.phone,
    c.account_balance,
    c.market_segment,
    c.nation_name,
    c.region_name,
    count(o.order_id) as total_orders,
    coalesce(sum(o.net_revenue), 0) as lifetime_revenue,
    avg(o.net_revenue) as avg_order_value,
    min(o.order_date) as first_order_date,
    max(o.order_date) as last_order_date,
    datediff('day', min(o.order_date), max(o.order_date)) as customer_tenure_days,
    coalesce(sum(o.returned_items), 0) as total_returned_items,
    coalesce(sum(o.total_quantity), 0) as total_items_ordered
from customers c
left join orders o on c.customer_id = o.customer_id
group by
    c.customer_id,
    c.customer_name,
    c.address,
    c.phone,
    c.account_balance,
    c.market_segment,
    c.nation_name,
    c.region_name
