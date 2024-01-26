WITH
    selected AS (
        SELECT 
            product_id
            , supplier_id	          	            
            , category_id
            , product_name
            , unit_price            		          	            
            , quantity_per_unit	      	        
            , units_in_stock
            , units_on_order
            , is_discontinued
            , reorder_level                          				
        	     
          FROM {{ ref('stg_products') }}
    )
    , transformed AS (
        SELECT
          ROW_NUMBER() OVER (ORDER BY product_id) AS product_sk
           , *
          FROM selected
    )

SELECT * FROM transformed



