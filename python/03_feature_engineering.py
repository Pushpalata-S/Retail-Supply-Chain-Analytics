import pandas as pd

# ======================================================
# Retail Supply Chain Analytics
# Feature Engineering
# ======================================================

print("=" * 60)
print("Retail Supply Chain Analytics - Feature Engineering")
print("=" * 60)

# Load cleaned dataset
df = pd.read_csv("../data/cleaned/retail_orders_cleaned.csv")

# Convert dates FIRST
df["order_date"] = pd.to_datetime(df["order_date"])
df["ship_date"] = pd.to_datetime(df["ship_date"])

# ======================================================
# Feature Engineering
# ======================================================

print("\nCreating New Features...")

# Year
df["order_year"] = df["order_date"].dt.year

# Month Number
df["order_month"] = df["order_date"].dt.month

# Month Name
df["order_month_name"] = df["order_date"].dt.month_name()

# Quarter
df["order_quarter"] = df["order_date"].dt.quarter

# Weekday
df["order_weekday"] = df["order_date"].dt.day_name()

# Shipping Days
df["shipping_days"] = (
    df["ship_date"] - df["order_date"]
).dt.days

# Profit Margin
df["profit_margin"] = (
    (df["profit"] / df["sales"]) * 100
).round(2)

# Loss Order
df["loss_order"] = df["profit"] < 0

# High Discount
df["high_discount"] = df["discount"] >= 0.30

print("\nFeatures Created Successfully")
print(f"New Columns Added : 8")

print(df[[
    "order_year",
    "order_month",
    "order_month_name",
    "order_quarter",
    "order_weekday",
    "shipping_days",
    "profit_margin",
    "loss_order",
    "high_discount"
]].head())

# Shipping Delay Flag
df["late_shipping"] = df["shipping_days"] > 5

# Order Weekend Flag
df["weekend_order"] = df["order_weekday"].isin(["Saturday", "Sunday"])

# High Value Order
df["high_value_order"] = df["sales"] >= df["sales"].quantile(0.75)

# ======================================================
# Save Dataset
# ======================================================

output_path = "../data/cleaned/retail_orders_cleaned.csv"

df.to_csv(output_path, index=False)

print("\n" + "=" * 60)
print("Feature Engineering Completed Successfully")
print(f"Dataset saved to:\n{output_path}")
print("=" * 60)
