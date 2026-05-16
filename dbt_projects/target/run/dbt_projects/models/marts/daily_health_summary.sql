
  
    

create or replace transient table FITNESS_DB.STAGING.daily_health_summary
    
    
    
    as (WITH activity AS (
    SELECT * FROM FITNESS_DB.STAGING.stg_daily_activity
),
sleep AS (
    SELECT * FROM FITNESS_DB.STAGING.stg_sleep
)
SELECT
    a.user_id,
    a.activity_date,
    a.total_steps,
    a.calories_burned,
    a.very_active_minutes,
    a.sedentary_minutes,
    s.hours_asleep,
    s.minutes_in_bed,
    CASE
        WHEN a.total_steps >= 10000 THEN 'Goal met'
        WHEN a.total_steps >= 7500  THEN 'Near goal'
        ELSE 'Below goal'
    END AS steps_goal_status,
    ROUND(s.minutes_in_bed - s.minutes_asleep, 0) AS minutes_awake_in_bed
FROM activity a
LEFT JOIN sleep s
    ON a.user_id = s.user_id
    AND a.activity_date = s.sleep_date
    )
;


  