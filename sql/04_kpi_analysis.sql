USE retail_supply_chain;

/*
==========================================================
What is the total revenue generated?
Objective:
Calculate the company's overall sales.
==========================================================
*/
SELECT ROUND(SUM(Sales),2) AS Total_Revenue
FROM retail_orders;

/*
==========================================================
What is the total profit earned?
==========================================================
*/
SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_orders;

/*
==========================================================
How many unique orders are there?
==========================================================
*/
SELECT COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM retail_orders;

/*
==========================================================
How many unique customers are there?
==========================================================
*/
SELECT COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM retail_orders;
/*
==========================================================
What is the average order value?
==========================================================
*/
SELECT
ROUND(
SUM(Sales) /
COUNT(DISTINCT `Order ID`)
,2) AS Average_Order_Value
FROM retail_orders;

/*
==========================================================
What is the overall profit margin?
==========================================================
*/
SELECT
ROUND(
(SUM(Profit) / SUM(Sales)) * 100,
2
) AS Profit_Margin_Percentage
FROM retail_orders;

/*
==========================================================
What is the average discount offered?
==========================================================
*/
SELECT
ROUND(AVG(Discount) * 100,2) AS Average_Discount_Percentage
FROM retail_orders;