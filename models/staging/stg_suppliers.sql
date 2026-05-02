with source as (
    select * from {{ source('tpch', 'supplier') }}
)

select
    S_SUPPKEY as supplier_id,
    S_NAME as supplier_name,
    S_ADDRESS as address,
    S_NATIONKEY as nation_id,
    S_PHONE as phone,
    S_ACCTBAL as account_balance
from source
