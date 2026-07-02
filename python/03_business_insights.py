import pandas as pd

# ======================================================
# Retail Supply Chain Analytics
# Business Insights Report
# ======================================================

print("=" * 60)
print("Retail Supply Chain Analytics")
print("Business Insights Report")
print("=" * 60)

# Load cleaned data
df = pd.read_csv("../data/cleaned/retail_orders_cleaned.csv")

# Convert dates
df["order_date"] = pd.to_datetime(df["order_date"])
df["ship_date"] = pd.to_datetime(df["ship_date"])

# ======================================================
# Executive KPIs
# ======================================================

total_sales = df["sales"].sum()
total_profit = df["profit"].sum()
total_orders = df["order_id"].nunique()
total_customers = df["customer_id"].nunique()
total_products = df["product_id"].nunique()

profit_margin = total_profit / total_sales * 100
average_order_value = total_sales / total_orders

print("\n========== EXECUTIVE KPIs ==========\n")

print(f"Total Revenue        : ${total_sales:,.2f}")
print(f"Total Profit         : ${total_profit:,.2f}")
print(f"Profit Margin        : {profit_margin:.2f}%")
print(f"Average Order Value  : ${average_order_value:.2f}")
print(f"Total Orders         : {total_orders}")
print(f"Total Customers      : {total_customers}")
print(f"Total Products       : {total_products}")

# ======================================================
# Best Category
# ======================================================

category_sales = (
    df.groupby("category")["sales"]
      .sum()
      .sort_values(ascending=False)
)

best_category = category_sales.idxmax()

print("\nBest Selling Category")
print("----------------------")
print(best_category)

# ======================================================
# Most Profitable Category
# ======================================================

category_profit = (
    df.groupby("category")["profit"]
      .sum()
      .sort_values(ascending=False)
)

print("\nMost Profitable Category")
print("--------------------------")
print(category_profit.idxmax())

# ======================================================
# Best Customer
# ======================================================

customer_sales = (
    df.groupby("customer_name")["sales"]
      .sum()
      .sort_values(ascending=False)
)

print("\nHighest Revenue Customer")
print("--------------------------")
print(customer_sales.head(1))

# ======================================================
# Best Product
# ======================================================

product_sales = (
    df.groupby("product_name")["sales"]
      .sum()
      .sort_values(ascending=False)
)

print("\nHighest Revenue Product")
print("-------------------------")
print(product_sales.head(1))

# ======================================================
# Best Region
# ======================================================

region_sales = (
    df.groupby("region")["sales"]
      .sum()
      .sort_values(ascending=False)
)

print("\nHighest Revenue Region")
print("-----------------------")
print(region_sales)

# ======================================================
# Monthly Sales
# ======================================================

monthly_sales = (
    df.groupby(df["order_date"].dt.to_period("M"))["sales"]
      .sum()
)

best_month = monthly_sales.idxmax()

print("\nBest Sales Month")
print("----------------")
print(best_month)

# ======================================================
# Shipping Time
# ======================================================

df["shipping_days"] = (
    df["ship_date"] - df["order_date"]
).dt.days

print("\nAverage Shipping Days")
print("----------------------")

print(round(df["shipping_days"].mean(), 2))

# ======================================================
# Returns
# ======================================================

return_rate = (
    (df["returned"] == "Yes").mean()
)*100

print("\nReturn Rate")
print("------------")

print(f"{return_rate:.2f}%")

# ======================================================
# Discount Analysis
# ======================================================

print("\nAverage Discount")
print("----------------")

print(round(df["discount"].mean()*100, 2), "%")

# ======================================================
# Top 20% Customers Contribution
# ======================================================

customer_rev = (
    df.groupby("customer_name")["sales"]
      .sum()
      .sort_values(ascending=False)
)

top20 = int(len(customer_rev)*0.2)

contribution = (
    customer_rev.head(top20).sum()
    / customer_rev.sum()
)*100

print("\nTop 20% Customer Contribution")
print("-------------------------------")

print(f"{contribution:.2f}%")

print("\n" + "="*60)
print("Business Insight Report Generated Successfully")
print("="*60)
