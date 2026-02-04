WITH ship_join AS(
SELECT 
m.orders_id
, m.date_date 
, m.margin
, s.shipping_fee 
, s.logcost
, s.ship_cost
FROM {{ ref('int_orders_margin') }} m
LEFT JOIN {{ ref('stg_gz_raw_data__ship') }}  s
USING (orders_id)
)

SELECT 
orders_id
, date_date 
, margin + shipping_fee - logcost - ship_cost AS operational_margin
FROM ship_join