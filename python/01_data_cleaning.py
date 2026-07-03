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

rows_before = len(df)

duplicates = df.duplicated().sum()

print(f"\nRows Before Cleaning      : {rows_before}")
print(f"Duplicate Rows Found      : {duplicates}")

df = df.drop_duplicates()

rows_after_duplicates = len(df)

print(f"Rows After Removing Duplicates : {rows_after_duplicates}")

# ======================================================
# Handle Missing Values
# ======================================================

print("\nMissing Values Before Cleaning:\n")

missing_before = df.isnull().sum()

print(missing_before[missing_before > 0])

# Example Cleaning

if "postal_code" in df.columns:
    df["postal_code"] = df["postal_code"].fillna("Unknown")

if "returned" in df.columns:
    df["returned"] = df["returned"].fillna("No")

# Numeric Columns → Median

numeric_cols = df.select_dtypes(include=["int64", "float64"]).columns

for col in numeric_cols:
    df[col] = df[col].fillna(df[col].median())

missing_after = df.isnull().sum()

print("\nMissing Values After Cleaning:\n")

print(missing_after[missing_after > 0])

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

for col in date_columns:
    invalid_dates = df[col].isna().sum()
    print(f"Invalid dates in {col}: {invalid_dates}")

# ======================================================
# Remove Invalid Records
# ======================================================

rows_before_validation = len(df)

if "sales" in df.columns:
    df = df[df["sales"] >= 0]

if "profit" in df.columns:
    df = df[df["profit"] >= 0]

if "quantity" in df.columns:
    df = df[df["quantity"] > 0]

rows_after_validation = len(df)

print("\nInvalid Records Removed :",
      rows_before_validation - rows_after_validation)

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
# Cleaning Summary
# ======================================================

print("\n" + "=" * 50)
print("Cleaning Summary")
print("=" * 50)

print(f"Initial Rows              : {initial_rows}")
print(f"Initial Columns           : {initial_columns}")
print(f"Duplicate Rows Removed    : {duplicates}")
print(f"Final Rows                : {len(df)}")
print(f"Columns Standardized      : {len(df.columns)}")

# ======================================================
# Save Clean Dataset
# ======================================================

output_path = "../data/cleaned/retail_orders_cleaned.csv"

df.to_csv(output_path, index=False)

print("\n" + "=" * 50)
print("Data Cleaning Completed Successfully")
print(f"Clean dataset saved to:\n{output_path}")
print("=" * 50)
