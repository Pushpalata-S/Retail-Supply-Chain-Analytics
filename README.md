# 🛒 Retail Supply Chain Analytics
An End-to-End SQL Business Case Study using MySQL,and Python.

## 📌 Project Overview

This project analyzes a retail supply chain dataset using **MySQL**,and **Python**. The raw dataset was imported, cleaned, normalized into multiple relational tables, and analyzed using SQL to generate business insights.

The project demonstrates an end-to-end data analytics workflow including data ingestion, database design, SQL analysis, and query optimization

---

## 🎯 Objectives

- Import raw retail sales data into MySQL
- Normalize the database into relational tables
- Perform business analysis using SQL
- Apply advanced SQL concepts such as CTEs and Window Functions
- Optimize queries using indexes
- Create reusable SQL Views

---

## 🛠️ Technologies Used

- MySQL 8
- MySQL Workbench
- Python 3
- Pandas
- SQL
- Git & GitHub

---

## 📂 Project Structure

```text
Retail-Supply-Chain-Analytics/
│
├── data/
├── docs/
│   ├── Data_Dictionary.md
│   ├── Business_Insights.md
│   └── ER_Diagram.png
│
├── python/
│   └── import_data.py
│
├── screenshots/
│
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_import_data.sql
│   ├── 03_data_profiling.sql
│   ├── 04_data_quality.sql
│   ├── 05_normalization.sql
│   ├── 06_business_analysis.sql
│   ├── 07_advanced_sql.sql
│   ├── 08_views.sql
│   └── 09_indexes.sql
│
├── README.md
└── requirements.txt
```

---

## 🗄️ Database Schema

The raw dataset was normalized into the following tables:

- customers
- products
- orders
- order_items
- locations

The ER Diagram is available in:

```
docs/ER_Diagram.png
```

---

## 📊 SQL Analysis

The project includes analysis on:

### Executive KPIs

- Total Revenue
- Total Profit
- Total Orders
- Total Customers
- Average Order Value

### Customer Analytics

- Top Customers by Revenue
- Top Customers by Profit
- Customer Lifetime Value

### Product Analytics

- Best Selling Products
- Most Profitable Products
- Category Performance

### Regional Analytics

- Sales by Region
- Profit by Region
- Top Performing Cities

### Time Series Analysis

- Monthly Sales
- Running Revenue
- Moving Average
- Previous Day vs Next Day Sales

### Advanced SQL

- Common Table Expressions (CTEs)
- Window Functions
- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- LAG()
- LEAD()

---

## ⚡ Query Optimization

Indexes were created on frequently queried columns to improve query performance.

Execution plans were analyzed using the EXPLAIN statement.

---

## 📈 Business Insights

Key findings are documented in:

```
docs/Business_Insights.md
```

---

## 📖 Data Dictionary

Table descriptions are available in:

```
docs/Data_Dictionary.md
```

---

## 🚀 Future Improvements

- Add Stored Procedures
- Add SQL Triggers
- Create ETL automation
- Deploy Power BI Dashboard
- Integrate with cloud database

---

## 👨‍💻 Author

**Pushplata**

Data Analytics | SQL | Python 
