import pandas as pd
import os

# ======================================================
# Retail Supply Chain Analytics
# Export Dataset for SQL
# ======================================================

print("=" * 60)
print("Retail Supply Chain Analytics - Export for SQL")
print("=" * 60)

# ======================================================
# Load Feature-Engineered Dataset
# ======================================================

input_path = "../data/cleaned/retail_orders_cleaned.csv"

df = pd.read_csv(input_path)

print(f"\nDataset Loaded Successfully")
print(f"Rows    : {len(df)}")
print(f"Columns : {len(df.columns)}")

# ======================================================
# Create Export Folder
# ======================================================

os.makedirs("../data/sql_ready", exist_ok=True)

# ======================================================
# Export Dataset
# ======================================================

output_path = "../data/sql_ready/retail_orders_sql.csv"

df.to_csv(output_path, index=False)

# ======================================================
# Export Summary
# ======================================================

print("\nExport Summary")
print("-" * 60)
print(f"Input File      : {input_path}")
print(f"Output File     : {output_path}")
print(f"Rows Exported   : {len(df)}")
print(f"Columns Exported: {len(df.columns)}")

print("\n" + "=" * 60)
print("Dataset Exported Successfully")
print("Ready for SQL Import")
print("=" * 60)
