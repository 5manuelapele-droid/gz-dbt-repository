{{ config( materialized='table')}} 

WITH fin1 AS ( 
SELECT 
om.date_date 
, COUNT (DISTINCT om.orders_id) AS nb_transactions
, SUM (om.revenue) AS total_revenue 
, SUM (om.purchase_cost) AS total_purchase_cost
, SUM (sh.shipping_fee) AS total_shipping_fees
, SUM (sh.logcost) AS total_logcost
, SUM (om.quantity) AS quantity_prod_sold
, SUM (om.margin)  AS margin
, SUM (sh.ship_cost) AS total_ship_cost
FROM {{ ref('int_orders_margin') }} om
LEFT JOIN {{ ref('stg_gz_raw_data__ship') }} sh
USING (orders_id)
GROUP BY om.date_date 
)

SELECT 
date_date 
, nb_transactions
, total_revenue
, AVG (total_revenue/nb_transactions) AS avg_basket
, SUM (margin + total_shipping_fees - total_logcost - total_ship_cost) AS operational_margin
, total_purchase_cost
, total_shipping_fees
, total_logcost
, quantity_prod_sold
FROM fin1
GROUP BY date_date 
, nb_transactions
, total_revenue
, total_purchase_cost
, total_shipping_fees
, total_logcost
, quantity_prod_sold


