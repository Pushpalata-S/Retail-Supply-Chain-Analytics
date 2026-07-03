--Which region generates the highest revenue?
SELECT
Region,
ROUND(SUM(Sales),2) AS Revenue
FROM retail_orders
GROUP BY Region
ORDER BY Revenue DESC;

--Which region generates the highest profit?
SELECT
Region,
ROUND(SUM(Profit),2) AS Profit
FROM retail_orders
GROUP BY Region
ORDER BY Profit DESC;

