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
Rank regions based on average shipping time.
Concept: RANK()
==========================================================
*/

SELECT
    o.region,
    ROUND(AVG(oi.shipping_days),2) AS avg_shipping_days,
    RANK() OVER(
        ORDER BY AVG(oi.shipping_days) DESC
    ) AS shipping_rank
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.region;

/*
==========================================================
Business Question:
Rank product categories by average profit margin.
Concept: DENSE_RANK()
==========================================================
*/

SELECT
    p.category,
    ROUND(AVG(oi.profit_margin),2) AS avg_profit_margin,
    DENSE_RANK() OVER(
        ORDER BY AVG(oi.profit_margin) DESC
    ) AS category_rank
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category;