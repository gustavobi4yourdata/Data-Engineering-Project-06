WITH
    selected AS (
        SELECT
            customer_id	    				
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
          FROM {{ ref('stg_customers') }}
    ), transformed AS (
        SELECT
            ROW_NUMBER() OVER (ORDER BY customer_id) AS customer_sk
            , *
          FROM selected
    )
SELECT * FROM transformed