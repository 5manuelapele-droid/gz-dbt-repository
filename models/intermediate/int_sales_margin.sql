WITH purchase_cost_calcul AS (
SELECT 
s.products_id
, s.date_date
, s.orders_id
, s.revenue 
, s.quantity
, p.purchase_price
, s.quantity * p.purchase_price AS purchase_cost
FROM {{ ref('stg_gz_raw_data__sales') }} s
LEFT JOIN {{ ref('stg_gz_raw_data__product') }} p
USING (products_id)
GROUP BY s.products_id, s.date_date
, s.orders_id
, s.revenue
, s.quantity
, p.purchase_price
)

SELECT *
,revenue - purchase_cost AS margin
FROM purchase_cost_calcul