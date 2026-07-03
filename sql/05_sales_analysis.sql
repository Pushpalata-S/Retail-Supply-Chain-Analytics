--Category Sales
SELECT
Category,
ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_orders
GROUP BY Category
ORDER BY Total_Sales DESC;

--Sub-category Sales
SELECT
`Sub-Category`,
ROUND(SUM(Sales),2) AS Sales
FROM retail_orders
GROUP BY `Sub-Category`
ORDER BY Sales DESC;

/*
==========================================================
Which product category generates the highest sales?
==========================================================
*/
SELECT
Category,
ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_orders
GROUP BY Category
ORDER BY Total_Sales DESC;

/*
==========================================================
Which sub-category generates the highest sales?
==========================================================
*/
SELECT
`Sub-Category`,
ROUND(SUM(Sales),2) AS Sales
FROM retail_orders
GROUP BY `Sub-Category`
ORDER BY Sales DESC;

USE retail_supply_chain;

-- ==========================================================
-- Monthly Sales Trend
-- ==========================================================

SELECT
    order_year,
    order_month,
    ROUND(SUM(sales),2) AS total_sales
FROM order_items
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


-- ==========================================================
-- Monthly Profit Trend
-- ==========================================================

SELECT
    order_year,
    order_month,
    ROUND(SUM(profit),2) AS total_profit
FROM order_items
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


-- ==========================================================
-- Quarterly Sales Trend
-- ==========================================================

SELECT
    order_year,
    order_quarter,
    ROUND(SUM(sales),2) AS total_sales
FROM order_items
GROUP BY order_year, order_quarter
ORDER BY order_year, order_quarter;


-- ==========================================================
-- Yearly Revenue
-- ==========================================================

SELECT
    order_year,
    ROUND(SUM(sales),2) AS total_sales
FROM order_items
GROUP BY order_year
ORDER BY order_year;


-- ==========================================================
-- Yearly Profit
-- ==========================================================

SELECT
    order_year,
    ROUND(SUM(profit),2) AS total_profit
FROM order_items
GROUP BY order_year
ORDER BY order_year;


-- ==========================================================
-- Highest Sales Month
-- ==========================================================

SELECT
    order_year,
    order_month_name,
    ROUND(SUM(sales),2) AS total_sales
FROM order_items
GROUP BY order_year, order_month, order_month_name
ORDER BY total_sales DESC
LIMIT 1;


-- ==========================================================
-- Highest Profit Month
-- ==========================================================
SELECT
    order_year,
    order_month_name,
    ROUND(SUM(profit),2) AS total_profit
FROM order_items
GROUP BY order_year, order_month, order_month_name
ORDER BY total_profit DESC
LIMIT 1;

/*
How many orders received a high discount?
*/
SELECT
COUNT(*) AS High_Discount_Orders
FROM order_items
WHERE high_discount = TRUE;

/*
Business Question:
How many orders resulted in a loss?
*/

SELECT
COUNT(*) AS Loss_Orders
FROM order_items
WHERE loss_order = TRUE;