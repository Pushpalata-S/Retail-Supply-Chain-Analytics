import pandas as pd
import matplotlib.pyplot as plt
import os

# ===============================================
# Retail Supply Chain Analytics
# Data Validation
# ===============================================

print("="*60)
print("Retail Supply Chain Analytics - Data Validation")
print("="*60)


# Load cleaned dataset
df = pd.read_csv("../data/cleaned/retail_orders_cleaned.csv")

# Convert dates
df["order_date"] = pd.to_datetime(df["order_date"])
df["ship_date"] = pd.to_datetime(df["ship_date"])

# Create folder for figures
os.makedirs("../reports/figures", exist_ok=True)

# ===============================================
# Dataset Overview
# ===============================================

print("\nDataset Shape")
print(df.shape)

print("\nColumns")
print(df.columns.tolist())

print("\nData Types")
print(df.dtypes)

print("\nSummary Statistics")
print(df.describe())

print("\nValidation Summary")

print(f"Rows               : {len(df)}")
print(f"Columns            : {len(df.columns)}")
print(f"Unique Orders      : {df['order_id'].nunique()}")
print(f"Unique Customers   : {df['customer_id'].nunique()}")
print(f"Unique Products    : {df['product_id'].nunique()}")


# ===============================================
# Validation
# ===============================================

print("\nMissing Values")

print(df.isnull().sum())

print("\nDuplicate Rows")

print(df.duplicated().sum())

print("\nNegative Sales")

print((df["sales"] < 0).sum())

print("\nNegative Quantity")

print((df["quantity"] <= 0).sum())

print("\nInvalid Discounts (>1 or <0)")

print(((df["discount"] < 0) | (df["discount"] > 1)).sum())

print("\nOrder Date Range")

print(df["order_date"].min())

print(df["order_date"].max())

print("\nShip Date Before Order Date")

print((df["ship_date"] < df["order_date"]).sum())

# ===============================================
# Discount Analysis
# ===============================================

plt.figure(figsize=(8, 5))
df["discount"].hist(bins=20)
plt.title("Discount Distribution")
plt.tight_layout()
plt.savefig("../reports/figures/discount_distribution.png")
plt.close()

# ===============================================
# Profit Distribution
# ===============================================

plt.figure(figsize=(8, 5))
df["profit"].hist(bins=30)
plt.title("Profit Distribution")
plt.tight_layout()
plt.savefig("../reports/figures/profit_distribution.png")
plt.close()

print("\nData Validation Completed Successfully!")
print("\nValidation Report Generated.")

print("\nFigures saved in reports/figures/")
