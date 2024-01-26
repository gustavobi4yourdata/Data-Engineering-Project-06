WITH
    selected AS (
        SELECT
            shipper_id
          , company_name
          , phone                         				    	     
          FROM {{ ref('stg_shippers') }}
    )
    , transformed AS (
        SELECT
          ROW_NUMBER() OVER (ORDER BY shipper_id) AS shipper_sk
           , *
          FROM selected
    )

SELECT * FROM transformed