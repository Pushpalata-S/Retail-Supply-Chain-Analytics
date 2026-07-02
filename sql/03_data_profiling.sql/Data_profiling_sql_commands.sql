SELECT COUNT(*) AS total_rows
FROM retail_orders;

DESCRIBE retail_orders;

SELECT *
FROM retail_orders
LIMIT 10;

SELECT COUNT(DISTINCT `Order ID`) AS total_orders
FROM retail_orders;

SELECT COUNT(DISTINCT `Customer ID`) AS total_customers
FROM retail_orders;

SELECT COUNT(DISTINCT `Product ID`) AS total_products
FROM retail_orders;

SELECT DISTINCT Category
FROM retail_orders;

SELECT DISTINCT Region
FROM retail_orders;

SELECT DISTINCT Segment
FROM retail_orders;

SELECT DISTINCT `Ship Mode`
FROM retail_orders;