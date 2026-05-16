import os
import pandas as pd
import snowflake.connector
from snowflake.connector.pandas_tools import write_pandas
from dotenv import load_dotenv

load_dotenv()

def get_connection():
    return snowflake.connector.connect(
        account=os.getenv("SNOWFLAKE_ACCOUNT"),
        user=os.getenv("SNOWFLAKE_USER"),
        password=os.getenv("SNOWFLAKE_PASSWORD"),
        database=os.getenv("SNOWFLAKE_DATABASE"),
        warehouse=os.getenv("SNOWFLAKE_WAREHOUSE"),
        schema="RAW"
    )

def load_csv_to_snowflake(filepath, table_name):
    print(f"Loading {filepath} → RAW.{table_name}...")
    df = pd.read_csv(filepath)
    df.columns = [col.upper().replace(" ", "_") for col in df.columns]

    conn = get_connection()
    success, nchunks, nrows, _ = write_pandas(
        conn, df, table_name,
        database="FITNESS_DB",
        schema="RAW",
        auto_create_table=True,
        overwrite=True
    )
    print(f"Done: {nrows} rows loaded into RAW.{table_name}")
    conn.close()

if __name__ == "__main__":
    load_csv_to_snowflake("data/dailyActivity_merged.csv", "DAILY_ACTIVITY")
    load_csv_to_snowflake("data/sleepDay_merged.csv", "SLEEP_DAY")
    print("All files loaded successfully!")