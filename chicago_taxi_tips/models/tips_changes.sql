WITH monthly_tips AS (
    SELECT
        taxi_id,
        FORMAT_TIMESTAMP('%Y-%m', trip_start_timestamp) AS year_month,
        SUM(tips) AS tips_sum
    FROM 
        {{ source('chicago_taxi', 'taxi_trips') }}
    WHERE
        taxi_id IN (SELECT taxi_id FROM {{ ref('top_3_taxi') }})
    GROUP BY
        taxi_id, year_month
),
tips_with_changes AS (
    SELECT
        taxi_id,
        year_month,
        tips_sum,
        CASE
            WHEN LAG(tips_sum) OVER (PARTITION BY taxi_id ORDER BY year_month) = 0 THEN NULL
            ELSE (tips_sum - LAG(tips_sum) OVER (PARTITION BY taxi_id ORDER BY year_month)) / LAG(tips_sum) OVER (PARTITION BY taxi_id ORDER BY year_month) * 100
        END AS tips_change
    FROM
        monthly_tips
)
SELECT * FROM tips_with_changes

