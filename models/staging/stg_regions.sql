with source as (
    select * from {{ source('tpch', 'region') }}
)

select
    R_REGIONKEY as region_id,
    R_NAME as region_name
from source
