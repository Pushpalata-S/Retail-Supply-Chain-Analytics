/*
Business Question:
Which products generate the highest revenue?
*/

SELECT
    p.product_name,
    ROUND(SUM(oi.sales),2) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 10;

/*
Business Question:
Which products generate the highest profit?
*/

SELECT
    p.product_name,
    ROUND(SUM(oi.profit),2) AS profit
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY profit DESC
LIMIT 10;

/*
Business Question:
Which products are the least profitable?
*/

SELECT
    p.product_name,
    ROUND(SUM(oi.profit),2) AS profit
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY profit ASC
LIMIT 10;

/*
Business Question:
Which product categories generate the most sales?
*/

SELECT
    p.category,
    ROUND(SUM(oi.sales),2) AS total_sales
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

/*
Business Question:
Which product categories generate the most profit?
*/

SELECT
    p.category,
    ROUND(SUM(oi.profit),2) AS total_profit
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_profit DESC;  

/*
Business Question:
Which sub-categories generate the highest sales?
*/

SELECT
    p.sub_category,
    ROUND(SUM(oi.sales),2) AS total_sales
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.sub_category
ORDER BY total_sales DESC; 

/*
Business Question:
Which categories receive the highest average discount?
*/

SELECT
    p.category,
    ROUND(AVG(oi.discount),2) AS avg_discount
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY avg_discount DESC;

/*
==========================================================
Business Question:
Which region generates the highest revenue?
==========================================================
*/

SELECT
    o.region,
    ROUND(SUM(oi.sales),2) AS total_sales
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.region
ORDER BY total_sales DESC;

/*
==========================================================
Business Question:
Which region generates the highest profit?
==========================================================
*/

SELECT
    o.region,
    ROUND(SUM(oi.profit),2) AS total_profit
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.region
ORDER BY total_profit DESC;

/*
==========================================================
Business Question:
Which states generate the highest sales?
==========================================================
*/

SELECT
    o.state,
    ROUND(SUM(oi.sales),2) AS total_sales
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.state
ORDER BY total_sales DESC;

/*
==========================================================
Business Question:
Which states generate the highest profit?
==========================================================
*/

SELECT
    o.state,
    ROUND(SUM(oi.profit),2) AS total_profit
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.state
ORDER BY total_profit DESC;

/*
==========================================================
Business Question:
Which cities contribute the highest sales?
==========================================================
*/

SELECT
    o.city,
    ROUND(SUM(oi.sales),2) AS total_sales
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.city
ORDER BY total_sales DESC
LIMIT 10;

/*
==========================================================
Business Question:
Which cities generate the highest profit?
==========================================================
*/

SELECT
    o.city,
    ROUND(SUM(oi.profit),2) AS total_profit
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.city
ORDER BY total_profit DESC
LIMIT 10;

/*
==========================================================
Business Question:
What percentage of total sales comes from each region?
==========================================================
*/

SELECT
    o.region,
    ROUND(SUM(oi.sales),2) AS total_sales,
    ROUND(
        SUM(oi.sales) * 100 /
        (SELECT SUM(sales) FROM order_items),
        2
    ) AS sales_percentage
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.region
ORDER BY sales_percentage DESC;

/*
==========================================================
Business Question:
How has monthly sales changed over time?
==========================================================
*/

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    ROUND(SUM(oi.sales),2) AS total_sales
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);

/*
==========================================================
Business Question:
How has monthly profit changed over time?
==========================================================
*/

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    ROUND(SUM(oi.profit),2) AS total_profit
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);

/*
==========================================================
Business Question:
What are the quarterly sales trends?
==========================================================
*/

SELECT
    YEAR(order_date) AS year,
    QUARTER(order_date) AS quarter,
    ROUND(SUM(oi.sales),2) AS total_sales
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY YEAR(order_date), QUARTER(order_date)
ORDER BY year, quarter;

/*
==========================================================
Business Question:
How much revenue was generated each year?
==========================================================
*/

SELECT
    YEAR(order_date) AS year,
    ROUND(SUM(oi.sales),2) AS total_sales
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY YEAR(order_date)
ORDER BY year;

/*
==========================================================
Business Question:
How much profit was generated each year?
==========================================================
*/

SELECT
    YEAR(order_date) AS year,
    ROUND(SUM(oi.profit),2) AS total_profit
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY YEAR(order_date)
ORDER BY year;

/*
==========================================================
Business Question:
Which month recorded the highest sales?
==========================================================
*/

SELECT
    YEAR(order_date) AS year,
    MONTHNAME(order_date) AS month,
    ROUND(SUM(oi.sales),2) AS total_sales
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY YEAR(order_date), MONTH(order_date), MONTHNAME(order_date)
ORDER BY total_sales DESC
LIMIT 1;

/*
==========================================================
Business Question:
Which month recorded the highest profit?
==========================================================
*/

SELECT
    YEAR(order_date) AS year,
    MONTHNAME(order_date) AS month,
    ROUND(SUM(oi.profit),2) AS total_profit
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY YEAR(order_date), MONTH(order_date), MONTHNAME(order_date)
ORDER BY total_profit DESC
LIMIT 1;