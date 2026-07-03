<img width="604" height="630" alt="ER Diagram" src="https://github.com/user-attachments/assets/5fb590c1-66a4-4ad1-880a-2fc6ca115608" />
<img width="604" height="630" alt="ER Diagram" src="https://github.com/user-attachments/assets/42cc4f2c-59a4-49fd-ab98-d661d0814117" />
<img width="604" height="630" alt="ER Diagram" src="https://github.com/user-attachments/assets/3878da1f-d079-4dcb-9707-a04a3fd5b29d" />
# 🛒 Retail Supply Chain Analytics

An end-to-end Retail Supply Chain Analytics project demonstrating a complete data analytics workflow using **Python,and MySQL**

The project covers **data preparation, database design, business analytics, advanced SQL,and query optimization** to transform raw retail sales data into actionable business insights.

---

# 📌 Project Overview

Retail businesses generate large volumes of transactional data every day. However, raw data is often inconsistent, contains missing values, and is not immediately suitable for business analysis.

This project demonstrates how raw retail sales data can be transformed into meaningful business insights through a structured analytics pipeline.

The workflow includes:

- Data Cleaning using Python
- Data Validation
- Feature Engineering
- Exporting SQL-ready datasets
- Relational Database Design
- SQL-based Business Analytics
- Advanced SQL Techniques
- Query Optimization

---

# 🎯 Project Objectives

- Clean and prepare raw retail sales data using Python
- Validate data quality before database import
- Engineer new analytical features
- Design a normalized relational database
- Import prepared data into MySQL
- Perform business analysis using SQL
- Apply advanced SQL concepts
- Optimize query performance using indexes
- Create reusable SQL Views

---

# 🛠️ Technologies Used

- Python 3
- Pandas
- MySQL 8
- MySQL Workbench
- SQL
- Git
- GitHub

---

# 📂 Project Structure

```text
Retail-Supply-Chain-Analytics/
│
├── data/
│   ├── raw/
│   ├── cleaned/
│   └── sql_ready/
│
├── docs/
│   ├── Business_Recommendations.md
│   ├── Data_Dictionary.md
│   └── ER_Diagram.png
│
├── python/
│   ├── 01_data_cleaning.py
│   ├── 02_data_validation.py
│   ├── 03_feature_engineering.py
│   └── 04_export_sql.py
│
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_data_import.sql
│   ├── 03_data_profiling.sql
│   ├── 04_kpi_analysis.sql
│   ├── 05_sales_analysis.sql
│   ├── 06_customer_analysis.sql
│   ├── 07_product_analysis.sql
│   ├── 08_region_analysis.sql
│   ├── 09_advanced_sql.sql
│   └── 10_views_indexes.sql
│
├── reports/
│
├── screenshots/
│
├── README.md
└── requirements.txt
```

---

# 🔄 Project Workflow

```
Raw Retail Dataset
        │
        ▼
Python
──────────────────────────
✔ Data Cleaning
✔ Data Validation
✔ Feature Engineering
✔ SQL-ready Export
──────────────────────────
        │
        ▼
MySQL Database
──────────────────────────
✔ Database Design
✔ Data Profiling
✔ KPI Analysis
✔ Sales Analysis
✔ Customer Analysis
✔ Product Analysis
✔ Regional Analysis
✔ Advanced SQL
✔ Views
✔ Indexes
──────────────────────────
        │
        ▼
Power BI Dashboard
```

---

#  Python Workflow

Python was used for **data preparation** before SQL analysis.

## 1️⃣ Data Cleaning

- Standardized column names
- Removed duplicate records
- Handled missing values
- Converted date columns
- Removed unnecessary whitespaces
- Cleaned categorical values

---

## 2️⃣ Data Validation

Performed quality checks including:

- Missing value analysis
- Duplicate detection
- Invalid records
- Date validation
- Data type verification
- Numeric range validation

---

## 3️⃣ Feature Engineering

Created new analytical columns including:

- Order Year
- Order Month
- Month Name
- Quarter
- Weekday
- Shipping Days
- Profit Margin
- Loss Order Flag
- High Discount Flag

These engineered features were later used in SQL analysis.

---

## 4️⃣ Export

Prepared and exported the final SQL-ready dataset for database import.

---

# 🗄️ Database Design

The dataset was normalized into multiple relational tables:

- Customers
- Orders
- Order Items
- Products

The ER Diagram is available in:

```
docs/ER_Diagram.png
<img width="604" height="630" alt="ER Diagram" src="https://github.com/user-attachments/assets/9e288516-c2eb-48a3-bacf-ec98c35f6d97" />

```

---

# 📊 SQL Analysis

The SQL project is divided into multiple analytical modules.

---

## 📌 Data Profiling

- Dataset Overview
- Table Structure
- Record Counts
- Distinct Categories
- Distinct Customers
- Date Range
- Data Exploration

---

## 📌 Executive KPIs

- Total Revenue
- Total Profit
- Total Orders
- Total Customers
- Average Order Value
- Profit Margin
- Average Discount

---

## 📌 Sales Analysis

- Monthly Sales Trend
- Monthly Profit Trend
- Quarterly Sales
- Yearly Revenue
- Yearly Profit
- Highest Sales Month
- Highest Profit Month

---

## 📌 Customer Analysis

- Top Customers
- Revenue Ranking
- Customer Spending
- Customer Contribution

---

## 📌 Product Analysis

- Highest Revenue Products
- Most Profitable Products
- Least Profitable Products
- Category Performance
- Sub-category Performance
- Discount Analysis

---

## 📌 Regional Analysis

- Sales by Region
- Profit by Region
- State Performance
- City Performance
- Regional Revenue Contribution
- Shipping Performance

---

# 🚀 Advanced SQL Concepts

The project demonstrates advanced SQL techniques including:

- Common Table Expressions (CTEs)
- Window Functions
- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- LAG()
- LEAD()
- Running Totals
- Moving Average
- PARTITION BY

---

# ⚡ Query Optimization

To improve database performance:

- Created indexes on frequently queried columns
- Optimized JOIN operations
- Used EXPLAIN to analyze query execution plans

---

# 📈 SQL Views

Reusable SQL Views were created for:

- Customer Sales Summary
- Product Performance
- Monthly Sales
- Category Performance
- Shipping Performance

---

# 💡 Business Recommendations

Based on the analysis, the following recommendations were identified:

- Focus marketing efforts on high-performing product categories.
- Improve profitability of low-margin products.
- Expand operations in high-performing regions.
- Strengthen customer retention through loyalty programs.
- Optimize discount strategies to improve profit margins.
- Improve logistics in regions with longer shipping times.
- Plan inventory based on seasonal sales trends.
- Monitor return rates to reduce operational losses.

---

# 📖 Documentation

Additional documentation includes:

- Data Dictionary
- ER Diagram
- Business Recommendations

Located in:

```
docs/
```

---

# 📷 Project Screenshots

The repository includes screenshots of:

- Database Schema
- SQL Query Outputs
- Power BI Dashboard
- ER Diagram

---

# 🚀 Future Improvements

- Build an interactive dashboard
- Automate ETL pipeline
- Add Stored Procedures
- Add SQL Triggers
- Connect to Cloud Database
- Perform Forecasting using Python

---

# 👩‍💻 Author

**Pushplata**

Aspiring Data Analyst

**Skills:** SQL • Python • Power BI • Excel • Data Visualization
