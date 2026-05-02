with source as (
    select * from {{ source('tpch', 'customer') }}
)

select
    C_CUSTKEY as customer_id,
    C_NAME as customer_name,
    C_ADDRESS as address,
    C_NATIONKEY as nation_id,
    C_PHONE as phone,
    C_ACCTBAL as account_balance,
    C_MKTSEGMENT as market_segment
from source
