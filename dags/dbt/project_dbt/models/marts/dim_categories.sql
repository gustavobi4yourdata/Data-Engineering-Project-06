WITH
    selected AS (
        SELECT
              category_id
            , category_name
            , description
          FROM {{ ref('stg_categories') }}
    ), transformed AS (
        SELECT
            ROW_NUMBER() OVER (ORDER BY category_id) AS category_sk
            , *
          FROM selected
    )
SELECT * FROM transformed