SELECT
    ID                          AS user_id,
    TO_DATE(ACTIVITYDATE, 'MM/DD/YYYY') AS activity_date,
    TOTALSTEPS                  AS total_steps,
    TOTALDISTANCE               AS total_distance_km,
    VERYACTIVEMINUTES           AS very_active_minutes,
    FAIRLYACTIVEMINUTES         AS fairly_active_minutes,
    LIGHTLYACTIVEMINUTES        AS lightly_active_minutes,
    SEDENTARYMINUTES            AS sedentary_minutes,
    CALORIES                    AS calories_burned
FROM {{ source('raw', 'DAILY_ACTIVITY') }}
WHERE TOTALSTEPS > 0