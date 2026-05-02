with source as (
    select * from {{ source('tpch', 'part') }}
)

select
    P_PARTKEY as part_id,
    P_NAME as part_name,
    P_MFGR as manufacturer,
    P_BRAND as brand,
    P_TYPE as part_type,
    P_SIZE as part_size,
    P_CONTAINER as container,
    P_RETAILPRICE as retail_price
from source
