import pandas as pd
from datetime import datetime
import os

# ======================================================
# Retail Supply Chain Analytics
# Automatic Business Report Generator
# ======================================================

# Load cleaned dataset
df = pd.read_csv("../data/cleaned/retail_orders_cleaned.csv")

# Convert dates
df["order_date"] = pd.to_datetime(df["order_date"])
df["ship_date"] = pd.to_datetime(df["ship_date"])

# ======================================================
# KPIs
# ======================================================

total_sales = df["sales"].sum()
total_profit = df["profit"].sum()
total_orders = df["order_id"].nunique()
total_customers = df["customer_id"].nunique()
total_products = df["product_id"].nunique()

profit_margin = (total_profit / total_sales) * 100
average_order_value = total_sales / total_orders

# ======================================================
# Top Performers
# ======================================================

best_category = (
    df.groupby("category")["sales"]
      .sum()
      .idxmax()
)

best_product = (
    df.groupby("product_name")["sales"]
      .sum()
      .idxmax()
)

best_customer = (
    df.groupby("customer_name")["sales"]
      .sum()
      .idxmax()
)

best_region = (
    df.groupby("region")["sales"]
      .sum()
      .idxmax()
)

best_month = (
    df.groupby(df["order_date"].dt.to_period("M"))["sales"]
      .sum()
      .idxmax()
)

# ======================================================
# Additional Metrics
# ======================================================

df["shipping_days"] = (
    df["ship_date"] - df["order_date"]
).dt.days

average_shipping = df["shipping_days"].mean()

return_rate = (
    (df["returned"] == "Yes").mean()
) * 100

average_discount = df["discount"].mean() * 100

# ======================================================
# Create reports folder
# ======================================================

os.makedirs("../reports", exist_ok=True)

# ======================================================
# Write Report
# ======================================================

report_path = "../reports/Business_Report.txt"

with open(report_path, "w", encoding="utf-8") as report:

    report.write("=" * 70 + "\n")
    report.write("RETAIL SUPPLY CHAIN ANALYTICS REPORT\n")
    report.write("=" * 70 + "\n\n")

    report.write(f"Generated On : {datetime.now()}\n\n")

    report.write("EXECUTIVE SUMMARY\n")
    report.write("-" * 70 + "\n")

    report.write(f"Total Revenue           : ${total_sales:,.2f}\n")
    report.write(f"Total Profit            : ${total_profit:,.2f}\n")
    report.write(f"Profit Margin           : {profit_margin:.2f}%\n")
    report.write(f"Average Order Value     : ${average_order_value:.2f}\n")
    report.write(f"Total Orders            : {total_orders}\n")
    report.write(f"Total Customers         : {total_customers}\n")
    report.write(f"Total Products          : {total_products}\n\n")

    report.write("TOP PERFORMERS\n")
    report.write("-" * 70 + "\n")

    report.write(f"Highest Revenue Category : {best_category}\n")
    report.write(f"Highest Revenue Product  : {best_product}\n")
    report.write(f"Highest Revenue Customer : {best_customer}\n")
    report.write(f"Best Performing Region   : {best_region}\n")
    report.write(f"Best Sales Month         : {best_month}\n\n")

    report.write("OPERATIONAL METRICS\n")
    report.write("-" * 70 + "\n")

    report.write(f"Average Shipping Days : {average_shipping:.2f}\n")
    report.write(f"Average Discount      : {average_discount:.2f}%\n")
    report.write(f"Return Rate           : {return_rate:.2f}%\n\n")

    report.write("BUSINESS RECOMMENDATIONS\n")
    report.write("-" * 70 + "\n")

    report.write(
        "1. Focus marketing efforts on the best-performing category.\n")
    report.write("2. Retain high-value customers using loyalty programs.\n")
    report.write("3. Review products with low profit margins.\n")
    report.write("4. Investigate regions with lower profitability.\n")
    report.write("5. Monitor discounts to maintain healthy profit margins.\n")
    report.write("6. Reduce shipping time where possible.\n")
    report.write("7. Analyze returned products to reduce return rates.\n")

print("=" * 60)
print("Business Report Generated Successfully!")
print(f"Report saved at: {report_path}")
print("=" * 60)
