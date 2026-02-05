SELECT 
date_date 
, SUM(ads_cost) AS daily_ads_cost
, SUM(impression) AS daily_impression
, SUM(click) AS daily_click
FROM {{ ref('int_campaigns') }}
GROUP BY date_date
ORDER BY date_date DESC