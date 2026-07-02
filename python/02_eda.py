import pandas as pd
import matplotlib.pyplot as plt
import os

# ===============================================
# Retail Supply Chain Analytics
# Exploratory Data Analysis (EDA)
# ===============================================

print("="*60)
print("Retail Supply Chain Analytics - EDA")
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

# ===============================================
# Revenue, Profit & Orders
# ===============================================

print("\nExecutive KPIs")

print(f"Total Revenue : ${df['sales'].sum():,.2f}")
print(f"Total Profit  : ${df['profit'].sum():,.2f}")
print(f"Total Orders  : {df['order_id'].nunique()}")
print(f"Total Customers : {df['customer_id'].nunique()}")
print(f"Total Products : {df['product_id'].nunique()}")

# ===============================================
# Sales by Category
# ===============================================

category_sales = (
    df.groupby("category")["sales"]
      .sum()
      .sort_values(ascending=False)
)

print("\nSales by Category")
print(category_sales)

plt.figure(figsize=(8, 5))
category_sales.plot(kind="bar")
plt.title("Sales by Category")
plt.ylabel("Sales")
plt.tight_layout()
plt.savefig("../reports/figures/category_sales.png")
plt.close()

# ===============================================
# Profit by Category
# ===============================================

category_profit = (
    df.groupby("category")["profit"]
      .sum()
      .sort_values(ascending=False)
)

plt.figure(figsize=(8, 5))
category_profit.plot(kind="bar")
plt.title("Profit by Category")
plt.ylabel("Profit")
plt.tight_layout()
plt.savefig("../reports/figures/category_profit.png")
plt.close()

# ===============================================
# Top 10 Products
# ===============================================

top_products = (
    df.groupby("product_name")["sales"]
      .sum()
      .sort_values(ascending=False)
      .head(10)
)

plt.figure(figsize=(10, 6))
top_products.plot(kind="bar")
plt.title("Top 10 Products")
plt.tight_layout()
plt.savefig("../reports/figures/top_products.png")
plt.close()

# ===============================================
# Top 10 Customers
# ===============================================

top_customers = (
    df.groupby("customer_name")["sales"]
      .sum()
      .sort_values(ascending=False)
      .head(10)
)

plt.figure(figsize=(10, 6))
top_customers.plot(kind="bar")
plt.title("Top 10 Customers")
plt.tight_layout()
plt.savefig("../reports/figures/top_customers.png")
plt.close()

# ===============================================
# Monthly Sales Trend
# ===============================================

monthly_sales = (
    df.groupby(df["order_date"].dt.to_period("M"))["sales"]
      .sum()
)

monthly_sales.index = monthly_sales.index.astype(str)

plt.figure(figsize=(12, 5))
monthly_sales.plot(marker="o")
plt.title("Monthly Sales Trend")
plt.ylabel("Sales")
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig("../reports/figures/monthly_sales.png")
plt.close()

# ===============================================
# Regional Sales
# ===============================================

region_sales = (
    df.groupby("region")["sales"]
      .sum()
      .sort_values(ascending=False)
)

plt.figure(figsize=(8, 5))
region_sales.plot(kind="bar")
plt.title("Sales by Region")
plt.tight_layout()
plt.savefig("../reports/figures/region_sales.png")
plt.close()

# ===============================================
# Correlation
# ===============================================

print("\nCorrelation Matrix")

print(df[["sales", "profit", "discount", "quantity"]].corr())

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

print("\nEDA Completed Successfully!")

print("\nFigures saved in reports/figures/")
