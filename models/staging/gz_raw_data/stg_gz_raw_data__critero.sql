with 

source as (

    select * from {{ source('gz_raw_data', 'critero') }}

),

renamed as (

    select
        date_date,
        paid_source,
        campaign_key,
        cast (campgn_name AS STRING) AS campaign_name,
        cast (ads_cost AS FLOAT64) AS ads_cost,
        impression,
        click

    from source

)

select * from renamed