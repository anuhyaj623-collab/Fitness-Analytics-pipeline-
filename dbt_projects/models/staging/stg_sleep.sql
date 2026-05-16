SELECT
    ID                          AS user_id,
    TO_DATE(SLEEPDAY, 'MM/DD/YYYY HH:MI:SS AM') AS sleep_date,
    TOTALSLEEPRECORDS           AS sleep_records,
    TOTALMINUTESASLEEP          AS minutes_asleep,
    TOTALTIMEINBED              AS minutes_in_bed,
    ROUND(TOTALMINUTESASLEEP / 60.0, 2) AS hours_asleep
FROM {{ source('raw', 'SLEEP_DAY') }}