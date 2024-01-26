WITH
    source AS (
        SELECT
             category_id
            , category_name
            , description
          FROM {{ source('northwind','categories') }}
    )
SELECT * FROM source












