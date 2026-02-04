with 

source as (

    select * from {{ source('gz_raw_data', 'ship') }}

),

renamed as (

    select
        orders_id,
        cast (shipping_fee AS float64) AS shipping_fee,
        cast (logcost AS float64) AS logcost,
        cast (ship_cost AS float64) AS ship_cost

    from source

)

select * from renamed