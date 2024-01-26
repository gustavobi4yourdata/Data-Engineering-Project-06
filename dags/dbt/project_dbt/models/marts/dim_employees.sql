WITH
    selected AS (
        SELECT
            employee_id
          , first_name		        				
          , last_name
          , full_name                  			
          , title	            			
          , title_of_courtesy
          , birth_date
          , age
          , hire_date
          , lenght_of_service
          , address	            			
          , city	            			
          , region	            			
          , postal_code	        			
          , country	            			
          , home_phone	        			
          , extension	        				
          , photo	            			
          , notes	            			
          , reports_to	        				
          , photo_path
          FROM {{ ref('stg_employees') }}
    ), transformed AS (
        SELECT
            ROW_NUMBER() OVER (ORDER BY employee_id) AS employee_sk
            , *
          FROM selected
    )
SELECT * FROM transformed