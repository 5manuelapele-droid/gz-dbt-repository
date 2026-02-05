
SELECT *
FROM {{ref('stg_gz_raw_data__adwords')}}
UNION ALL
SELECT *
FROM {{ref('stg_gz_raw_data__bing')}}
UNION ALL
SELECT *
FROM {{ref('stg_gz_raw_data__critero')}}
UNION ALL
SELECT *
FROM {{ref('stg_gz_raw_data__facebook')}}