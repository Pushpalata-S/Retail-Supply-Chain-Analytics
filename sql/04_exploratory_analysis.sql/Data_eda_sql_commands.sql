USE retail_supply_chain;

/*
==========================================================
Business Question:
What is the total revenue generated?

Objective:
Calculate the company's overall sales.
==========================================================
*/

SELECT ROUND(SUM(Sales),2) AS Total_Revenue
FROM retail_orders;

/*
==========================================================
Business Question:
What is the total profit earned?
==========================================================
*/

SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_orders;

SELECT COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM retail_orders;

SELECT COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM retail_orders;

SELECT
ROUND(
SUM(Sales) /
COUNT(DISTINCT `Order ID`)
,2) AS Average_Order_Value
FROM retail_orders;

SELECT
Category,
ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_orders
GROUP BY Category
ORDER BY Total_Sales DESC;

SELECT
Category,
ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_orders
GROUP BY Category
ORDER BY Total_Profit DESC;

SELECT
`Sub-Category`,
ROUND(SUM(Sales),2) AS Sales
FROM retail_orders
GROUP BY `Sub-Category`
ORDER BY Sales DESC;

SELECT
Region,
ROUND(SUM(Sales),2) AS Revenue
FROM retail_orders
GROUP BY Region
ORDER BY Revenue DESC;

SELECT
Region,
ROUND(SUM(Profit),2) AS Profit
FROM retail_orders
GROUP BY Region
ORDER BY Profit DESC;