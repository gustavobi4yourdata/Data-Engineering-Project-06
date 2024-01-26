WITH
    source AS (
        SELECT
            customer_id	    				
          , company_name					
          , contact_name					
          , contact_title					
          , address	        				
          , city	        				
          , IFNULL(region, "N/I") as region	        				
          , postal_code	    				
          , country	        				
          , phone	        				
          , IFNULL(fax,"N/I")       as fax 
          FROM {{ source('northwind','customers') }}
    )    
SELECT * FROM source  

        