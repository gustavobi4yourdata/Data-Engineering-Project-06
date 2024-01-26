WITH
    selected AS (
        SELECT
            supplier_id
          , company_name
          , contact_name
          , contact_title
          , address
          , city
          , region
          , postal_code
          , country
          , phone
          , fax
          , homepage                          				    	     
          FROM {{ ref('stg_suppliers') }}
    )
    , transformed AS (
        SELECT
          ROW_NUMBER() OVER (ORDER BY supplier_id) AS supplier_sk
           , *
          FROM selected
    )

SELECT * FROM transformed