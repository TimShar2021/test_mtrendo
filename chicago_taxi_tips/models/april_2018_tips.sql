WITH april_2018 AS (
    SELECT
        taxi_id,
        EXTRACT(YEAR FROM trip_start_timestamp) AS year,
        EXTRACT(MONTH FROM trip_start_timestamp) AS month,
        SUM(tips) AS tips_sum
    FROM 
        {{ source('chicago_taxi', 'taxi_trips') }}
    WHERE
        EXTRACT(YEAR FROM trip_start_timestamp) = 2018
        AND EXTRACT(MONTH FROM trip_start_timestamp) = 4
    GROUP BY
        taxi_id, year, month
)
SELECT * FROM april_2018

