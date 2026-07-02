import pandas as pd
from sqlalchemy import create_engine

# -------------------------------
# CSV Path
# -------------------------------
csv_path = r"C:\Users\USER\Desktop\Retail-Supply-Chain-Analytics\data\raw\Retail-Supply-Chain-Sales-Dataset_raw.csv"

# Read CSV
df = pd.read_csv(csv_path, encoding="latin1")

print(f"Rows in CSV: {len(df)}")

# -------------------------------
# MySQL Connection
# -------------------------------
username = "root"
password = "@Tenderheart4pl"
host = "localhost"
port = 3306
database = "retail_supply_chain"

# IMPORTANT: URL-encode the @ in your password
password = password.replace("@", "%40")

engine = create_engine(
    f"mysql+pymysql://{username}:{password}@{host}:{port}/{database}"
)

# -------------------------------
# Upload to MySQL
# -------------------------------
df.to_sql(
    "retail_orders",
    con=engine,
    if_exists="replace",
    index=False
)

print("✅ Import Successful!")
