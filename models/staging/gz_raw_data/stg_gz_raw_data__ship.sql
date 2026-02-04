with 

source as (

    select * from {{ source('gz_raw_data', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        logcost,
        cast (ship_cost AS float64) AS ship_coast

    from source

)

select * from renamed