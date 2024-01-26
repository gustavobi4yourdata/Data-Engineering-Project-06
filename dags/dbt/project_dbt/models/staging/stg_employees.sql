WITH
    source AS (
        SELECT
            employee_id
          , first_name		        				
          , last_name
          , CONCAT(first_name, ' ' , last_name)                               AS full_name                  			
          , title	            			
          , title_of_courtesy
          , birth_date
          , EXTRACT(YEAR FROM CURRENT_DATE()) - EXTRACT(YEAR FROM birth_date) AS age
          , hire_date
          , EXTRACT(YEAR FROM CURRENT_DATE()) - EXTRACT(YEAR FROM hire_date)  AS lenght_of_service
          , address	            			
          , city	            			
          , IFNULL(region, "N/I")                                             AS region	            			
          , postal_code	        			
          , country	            			
          , home_phone	        			
          , extension	        				
          , photo	            			
          , notes	            			
          , reports_to	        				
          , photo_path
          FROM {{ source('northwind','employees') }}
    )    
SELECT * FROM source






