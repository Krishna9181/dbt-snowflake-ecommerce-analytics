with orders as (
    select * from {{ ref('stg_orders') }}
),

line_items as (
    select * from {{ ref('stg_line_items') }}
),

parts as (
    select * from {{ ref('stg_parts') }}
)

select
    li.order_id,
    li.line_number,
    o.customer_id,
    o.order_date,
    o.order_status,
    o.order_priority,
    li.part_id,
    p.part_name,
    p.brand,
    p.manufacturer,
    p.part_type,
    li.supplier_id,
    li.quantity,
    li.extended_price,
    li.discount,
    li.tax,
    li.discounted_price,
    li.total_price,
    li.return_flag,
    li.line_status,
    li.ship_date,
    li.commit_date,
    li.receipt_date,
    li.ship_mode,
    datediff('day', o.order_date, li.ship_date) as days_to_ship
from line_items li
inner join orders o on li.order_id = o.order_id
inner join parts p on li.part_id = p.part_id
