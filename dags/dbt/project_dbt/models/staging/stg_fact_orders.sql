WITH
    source AS (
        SELECT
            A.product_id
          , C.category_id
          , B.supplier_id
          , A.unit_price
          , A.units_in_stock
          , A.units_on_order
          FROM {{ ref('stg_products') }}   A
     LEFT JOIN {{ ref('stg_suppliers') }}  B ON A.supplier_id = B.supplier_id
     LEFT JOIN {{ ref('stg_categories') }} C ON A.category_id = C.category_id 
    ), stg_order_details AS (
        SELECT
            A.order_id
          , A.product_id
          , B.category_id
          , B.supplier_id
          , B.unit_price
          , B.units_in_stock
          , B.units_on_order
          , A.total
          , A.discount
          FROM {{ ref('stg_order_details') }} A
     LEFT JOIN source                         B ON A.product_id = B.product_id

    ), stg_orders AS (
        SELECT
            A.order_id
          , B.customer_id
          , C.employee_id
          , D.shipper_id
          , A.order_date
          , A.required_date
          FROM {{ ref('stg_orders') }}    A
     LEFT JOIN {{ ref('stg_customers') }} B ON A.customer_id = B.customer_id
     LEFT JOIN {{ ref('stg_employees') }} C ON A.employee_id = C.employee_id
     LEFT JOIN {{ ref('stg_shippers') }}  D ON A.shipper_id  = D.shipper_id
    ), final AS (
        SELECT
            A.order_id
          , A.product_id
          , B.customer_id
          , B.employee_id
          , B.shipper_id
          , A.category_id
          , A.supplier_id
          , B.order_date
          , B.required_date
          , A.unit_price
          , A.units_in_stock
          , A.units_on_order
          , ROUND(A.total, 2)    AS total
          , ROUND(A.discount, 2) AS discount
          FROM stg_order_details A
    INNER JOIN stg_orders        B ON A.order_id = B.order_id
    )
SELECT * FROM final