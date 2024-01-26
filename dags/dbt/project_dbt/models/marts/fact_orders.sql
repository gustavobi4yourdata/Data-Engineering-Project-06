WITH
    fact_orders AS (
        SELECT
              A.order_id
            , E.product_sk
            , C.customer_sk
            , D.employee_sk
            , F.shipper_sk
            , B.category_sk
            , G.supplier_sk
            , A.order_date
            , A.required_date
            , A.unit_price
            , A.units_in_stock
            , A.units_on_order
            , A.total
            , A.discount
          FROM {{ ref('stg_fact_orders') }} A
     LEFT JOIN {{ ref('dim_categories') }}  B ON A.category_id  = B.category_id
     LEFT JOIN {{ ref('dim_customers') }}   C ON A.customer_id  = C.customer_id
     LEFT JOIN {{ ref('dim_employees') }}   D ON A.employee_id  = D.employee_id
     LEFT JOIN {{ ref('dim_products') }}    E ON A.product_id   = E.product_id
     LEFT JOIN {{ ref('dim_shippers') }}    F ON A.shipper_id   = F.shipper_id
     LEFT JOIN {{ ref('dim_suppliers') }}   G ON A.supplier_id  = G.supplier_id
    )
SELECT 
    order_id
  , product_sk
  , customer_sk
  , employee_sk
  , shipper_sk
  , category_sk
  , supplier_sk
  , order_date
  , required_date
  , unit_price
  , units_in_stock
  , units_on_order
  , total
  , discount 
  FROM fact_orders



