with parts as (
    select * from {{ ref('stg_parts') }}
),

order_items as (
    select * from {{ ref('int_order_items') }}
)

select
    p.part_id,
    p.part_name,
    p.manufacturer,
    p.brand,
    p.part_type,
    p.part_size,
    p.container,
    p.retail_price,
    count(distinct oi.order_id) as total_orders,
    coalesce(sum(oi.quantity), 0) as total_quantity_sold,
    coalesce(sum(oi.discounted_price), 0) as total_revenue,
    count(distinct oi.supplier_id) as supplier_count,
    sum(case when oi.return_flag = 'R' then 1 else 0 end) as returned_items
from parts p
left join order_items oi on p.part_id = oi.part_id
group by
    p.part_id,
    p.part_name,
    p.manufacturer,
    p.brand,
    p.part_type,
    p.part_size,
    p.container,
    p.retail_price
