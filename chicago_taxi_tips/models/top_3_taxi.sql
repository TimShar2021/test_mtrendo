WITH top_3_taxi AS (
    SELECT
        taxi_id,
        tips_sum
    FROM {{ ref('april_2018_tips') }}
    ORDER BY tips_sum DESC
    LIMIT 3
)
SELECT * FROM top_3_taxi
