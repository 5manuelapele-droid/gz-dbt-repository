WITH ship_join AS(
SELECT 
m.orders_id
, m.date_date 
, s.shipping_fee 
, s.logcost
, s.ship_cost
FROM int_orders_margin m
LEFT JOIN stg_gz_raw_data__ship s
USING (orders_id)
)

SELECT 
orders_id
, date_date 
, margin + shipping_fee - log_cost - ship_cost AS operational_margin
FROM ship_join