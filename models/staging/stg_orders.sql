with source as (
    select * from {{ source('tpch', 'orders') }}
)

select
    O_ORDERKEY as order_id,
    O_CUSTKEY as customer_id,
    O_ORDERSTATUS as order_status,
    O_TOTALPRICE as total_price,
    O_ORDERDATE as order_date,
    O_ORDERPRIORITY as order_priority,
    O_CLERK as clerk,
    O_SHIPPRIORITY as ship_priority
from source
