WITH
    source AS (
        SELECT
            order_id	        				
          , customer_id	        			
          , employee_id
          , order_date
          , required_date
          , IFNULL(ship_region, "N/I") AS ship_region	
          , shipped_date	    	
          , ship_via                    AS shipper_id	        				
          , ship_name	        			
          , ship_address	    			
          , ship_city                 			
          , ship_postal_code    			
          , ship_country
          , freight     				
           FROM {{ source('northwind','orders') }}
    )
SELECT * FROM source