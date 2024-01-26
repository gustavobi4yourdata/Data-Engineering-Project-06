WITH
    source AS (
        SELECT 
            product_id
            , supplier_id	          	            
            , category_id
            , product_name
            , unit_price            		          	            
            , quantity_per_unit	      	        
            , units_in_stock
            , units_on_order
            , CASE
                WHEN discontinued = 1 THEN True
                ELSE False
              END AS is_discontinued
            , reorder_level
          FROM {{ source('northwind','products') }}
    )
SELECT * FROM source