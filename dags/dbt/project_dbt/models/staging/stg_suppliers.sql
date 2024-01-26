WITH
    source AS (
        SELECT
            supplier_id
          , company_name
          , contact_name
          , contact_title
          , address
          , city
          , IFNULL(region, "N/I")   AS region
          , postal_code
          , country
          , phone
          , IFNULL(fax, "N/I")      AS fax
          , IFNULL(homepage, "N/I") AS homepage      	     				
          FROM {{ source('northwind','suppliers') }}
    )
SELECT * FROM source