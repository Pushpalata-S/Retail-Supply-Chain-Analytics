/*
==========================================================
Business Question:
Rank customers based on total revenue.
Concept: RANK()
==========================================================
*/

SELECT
    c.customer_name,
    ROUND(SUM(oi.sales),2) AS revenue,
    RANK() OVER(
        ORDER BY SUM(oi.sales) DESC
    ) AS revenue_rank
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_name;

/*
==========================================================
Business Question:
Rank products by total profit.
Concept: DENSE_RANK()
==========================================================
*/

SELECT
    p.product_name,
    ROUND(SUM(oi.profit),2) AS profit,
    DENSE_RANK() OVER(
        ORDER BY SUM(oi.profit) DESC
    ) AS profit_rank
FROM products p
JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY p.product_name;

/*
==========================================================
Business Question:
Assign sequential numbers to orders.
Concept: ROW_NUMBER()
==========================================================
*/

SELECT
    order_id,
    order_date,
    ROW_NUMBER() OVER(
        ORDER BY order_date
    ) AS row_num
FROM orders;

/*
==========================================================
Business Question:
Which customers spend more than the average customer?
Concept: CTE
==========================================================
*/

WITH customer_sales AS
(
SELECT
    c.customer_name,
    SUM(oi.sales) revenue
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN order_items oi
ON o.order_id=oi.order_id
GROUP BY c.customer_name
)

SELECT *
FROM customer_sales
WHERE revenue >
(
SELECT AVG(revenue)
FROM customer_sales
);

WITH customer_sales AS
(
SELECT
    c.customer_name,
    SUM(oi.sales) revenue
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN order_items oi
ON o.order_id=oi.order_id
GROUP BY c.customer_name
)

SELECT *
FROM customer_sales
ORDER BY revenue DESC
LIMIT 5;

SELECT
    order_date,
    ROUND(SUM(oi.sales),2) AS daily_sales,
    ROUND(
        SUM(SUM(oi.sales))
        OVER(
            ORDER BY order_date
        ),2
    ) AS running_revenue
FROM orders o
JOIN order_items oi
ON o.order_id=oi.order_id
GROUP BY order_date
ORDER BY order_date;

SELECT
    order_date,
    ROUND(SUM(oi.sales),2) AS daily_sales,

    ROUND(
        AVG(SUM(oi.sales))
        OVER(
            ORDER BY order_date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ),2
    ) AS moving_average
FROM orders o
JOIN order_items oi
ON o.order_id=oi.order_id
GROUP BY order_date
ORDER BY order_date;

WITH daily_sales AS
(
SELECT
    order_date,
    SUM(oi.sales) sales
FROM orders o
JOIN order_items oi
ON o.order_id=oi.order_id
GROUP BY order_date
)

SELECT
    order_date,
    sales,

    LAG(sales)
    OVER(
        ORDER BY order_date
    ) previous_day_sales

FROM daily_sales;

WITH daily_sales AS
(
SELECT
    order_date,
    SUM(oi.sales) sales
FROM orders o
JOIN order_items oi
ON o.order_id=oi.order_id
GROUP BY order_date
)

SELECT
    order_date,
    sales,

    LEAD(sales)
    OVER(
        ORDER BY order_date
    ) next_day_sales

FROM daily_sales;WITH product_sales AS
(
SELECT
    p.category,
    p.product_name,
    SUM(oi.sales) revenue,

    ROW_NUMBER()
    OVER(
        PARTITION BY p.category
        ORDER BY SUM(oi.sales) DESC
    ) rn

FROM products p
JOIN order_items oi
ON p.product_id=oi.product_id

GROUP BY
p.category,
p.product_name
)

SELECT *
FROM product_sales
WHERE rn=1;

WITH product_profit AS
(
SELECT
    p.category,
    p.product_name,
    SUM(oi.profit) profit,

    ROW_NUMBER()
    OVER(
        PARTITION BY p.category
        ORDER BY SUM(oi.profit) DESC
    ) rn

FROM products p
JOIN order_items oi
ON p.product_id=oi.product_id

GROUP BY
p.category,
p.product_name
)

SELECT *
FROM product_profit
WHERE rn=1;

