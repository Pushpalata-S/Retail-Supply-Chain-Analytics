import pandas as pd

# ======================================================
# Retail Supply Chain Analytics
# Data Cleaning
# ======================================================

print("=" * 50)
print("Loading Dataset...")
print("=" * 50)

# Load dataset
df = pd.read_csv(
    "../data/raw/Retail-Supply-Chain-Sales-Dataset_raw.csv",
    encoding="latin1"
)

print(f"Rows   : {df.shape[0]}")
print(f"Columns: {df.shape[1]}")

# ======================================================
# Standardize Column Names
# ======================================================

df.columns = (
    df.columns
      .str.strip()
      .str.lower()
      .str.replace(" ", "_")
      .str.replace("-", "_")
)

print("\nColumn names standardized.")

# ======================================================
# Remove Duplicate Rows
# ======================================================

duplicates = df.duplicated().sum()

print(f"\nDuplicate Rows Before: {duplicates}")

df = df.drop_duplicates()

print(f"Rows After Removing Duplicates: {len(df)}")

# ======================================================
# Missing Values
# ======================================================

print("\nMissing Values:")

missing = df.isnull().sum()

print(missing[missing > 0])

# ======================================================
# Convert Dates
# ======================================================

date_columns = [
    "order_date",
    "ship_date"
]

for col in date_columns:
    df[col] = pd.to_datetime(
        df[col],
        format="%d-%m-%Y",
        errors="coerce"
    )

print("\nDate columns converted.")

# ======================================================
# Remove Leading / Trailing Spaces
# ======================================================

object_cols = df.select_dtypes(include="object").columns

for col in object_cols:
    df[col] = df[col].str.strip()

print("Whitespace removed.")

# ======================================================
# Fix Returned Column
# ======================================================

if "returned" in df.columns:
    df["returned"] = (
        df["returned"]
        .fillna("No")
        .replace({"Yes": "Yes", "No": "No"})
    )

# ======================================================
# Data Types
# ======================================================

print("\nData Types\n")

print(df.dtypes)

# ======================================================
# Missing Values After Cleaning
# ======================================================

print("\nMissing Values After Cleaning\n")

print(df.isnull().sum())

# ======================================================
# Dataset Information
# ======================================================

print("\nDataset Info\n")

print(df.info())

# ======================================================
# Save Clean Dataset
# ======================================================

output_path = "../data/cleaned/retail_orders_cleaned.csv"

df.to_csv(output_path, index=False)

print("\n" + "=" * 50)
print("Data Cleaning Completed Successfully")
print(f"Clean dataset saved to:\n{output_path}")
print("=" * 50)
