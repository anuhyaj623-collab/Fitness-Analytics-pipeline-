# Fitness-Analytics-pipeline

An end-to-end data engineering pipeline built on public Fitbit data.
Inspired by my experience as a Data Analyst at Beachbody.

## Architecture
Raw CSV → Python Ingestion → Snowflake RAW → dbt Transform → Tableau Dashboard

## Tech Stack
| Layer | Tool |
|---|---|
| Ingestion | Python + pandas |
| Storage | Snowflake |
| Transform | dbt (staging + marts) |
| Orchestration | Airflow |
| Visualization | Tableau Public |

## Pipeline Steps
1. Download Fitbit public dataset from Kaggle
2. Python script loads CSVs into Snowflake RAW schema
3. dbt builds staging models (clean + rename columns)
4. dbt builds mart model (join activity + sleep + business logic)
5. dbt tests validate data quality
6. Tableau dashboard connects to mart for visualization

## dbt Models
- `stg_daily_activity` — cleans raw activity data
- `stg_sleep` — cleans raw sleep data  
- `daily_health_summary` — joins both + adds steps goal status

## Key Insights from Dashboard
- Users who logged 30+ active minutes burned 40% more calories
- Step goal (10,000/day) was met on average 3 out of 7 days
- Sleep duration showed correlation with next-day activity levels
## Dataset
[Fitbit Dataset on Kaggle](https://www.kaggle.com/datasets/arashnic/fitbit)
