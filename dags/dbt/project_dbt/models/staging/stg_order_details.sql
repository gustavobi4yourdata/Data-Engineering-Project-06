WITH 
    source AS (
        SELECT 
              A.order_id
            , A.product_id
            , A.unit_price
            , A.quantity            
            , B.product_name
            , B.supplier_id
            , B.category_id 
            , A.unit_price * A.quantity                             AS total 
            , B.unit_price * A.quantity - A.unit_price * A.quantity AS discount 
          FROM {{ source('northwind','order_details') }} A
          LEFT JOIN {{ source('northwind','products') }} B ON (A.product_id = B.product_id)
    )

SELECT * FROM source