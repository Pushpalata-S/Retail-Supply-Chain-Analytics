--Shows dataset size.
SELECT COUNT(*) AS total_rows
FROM retail_orders;

--Shows schema and data types.
DESCRIBE retail_orders;

SELECT *
FROM retail_orders
LIMIT 10;

--Data profiling.
SELECT COUNT(DISTINCT `Order ID`) AS total_orders
FROM retail_orders;

SELECT COUNT(DISTINCT `Customer ID`) AS total_customers
FROM retail_orders;

SELECT COUNT(DISTINCT `Product ID`) AS total_products
FROM retail_orders;

--Domain exploration.
SELECT DISTINCT Category
FROM retail_orders;

SELECT DISTINCT Region
FROM retail_orders;

SELECT DISTINCT Segment
FROM retail_orders;

SELECT DISTINCT `Ship Mode`
FROM retail_orders;

/*
==========================================================
Business Question:
What time period does the dataset cover?
==========================================================
*/

SELECT
MIN(`Order Date`) AS Start_Date,
MAX(`Order Date`) AS End_Date
FROM retail_orders;

/*
==========================================================
Business Question:
Are there any missing values?
==========================================================
*/

SELECT
SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Missing_Sales,
SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Missing_Profit,
SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS Missing_Discount
FROM retail_orders;

/*
==========================================================
Business Question:
Are there duplicate Order IDs?
==========================================================
*/

SELECT
`Order ID`,
COUNT(*)
FROM retail_orders
GROUP BY `Order ID`
HAVING COUNT(*) > 1;

/*
==========================================================
Business Question:
What are the value ranges for important numeric columns?
==========================================================
*/

SELECT
MIN(Sales) AS Min_Sales,
MAX(Sales) AS Max_Sales,
MIN(Profit) AS Min_Profit,
MAX(Profit) AS Max_Profit,
MIN(Discount) AS Min_Discount,
MAX(Discount) AS Max_Discount
FROM retail_orders;