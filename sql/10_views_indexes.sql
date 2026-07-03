/*
==========================================================
View: Customer Sales Summary
==========================================================
*/

CREATE OR REPLACE VIEW vw_customer_sales AS
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.sales),2) AS total_sales,
    ROUND(SUM(oi.profit),2) AS total_profit
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name;

SELECT *
FROM vw_customer_sales
ORDER BY total_sales DESC
LIMIT 10;

/*
==========================================================
View: Product Performance
==========================================================
*/

CREATE OR REPLACE VIEW vw_product_performance AS
SELECT
    p.product_id,
    p.product_name,
    p.category,
    ROUND(SUM(oi.sales),2) AS total_sales,
    ROUND(SUM(oi.profit),2) AS total_profit,
    SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY
p.product_id,
p.product_name,
p.category;

SELECT *
FROM vw_product_performance
ORDER BY total_sales DESC
LIMIT 10;

/*
==========================================================
View: Monthly Sales Trend
==========================================================
*/

CREATE OR REPLACE VIEW vw_monthly_sales AS

SELECT
    oi.order_year,
    oi.order_month,
    oi.order_month_name,
    ROUND(SUM(oi.sales),2) AS total_sales,
    ROUND(SUM(oi.profit),2) AS total_profit

FROM order_items oi

GROUP BY
    oi.order_year,
    oi.order_month,
    oi.order_month_name;

--View 4
SELECT *
FROM vw_monthly_sales;

CREATE OR REPLACE VIEW vw_category_performance AS
SELECT
    p.category,
    ROUND(SUM(oi.sales),2) AS total_sales,
    ROUND(SUM(oi.profit),2) AS total_profit,
    SUM(oi.quantity) AS quantity_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category;

SELECT *
FROM vw_category_performance;

/*
==========================================================
View: Regional Shipping Performance
==========================================================
*/

CREATE OR REPLACE VIEW vw_shipping_performance AS

SELECT

o.region,

ROUND(AVG(oi.shipping_days),2) AS avg_shipping_days,

COUNT(*) AS total_orders

FROM orders o

JOIN order_items oi
ON o.order_id = oi.order_id

GROUP BY o.region;

SELECT *
FROM vw_shipping_performance;

/*
==========================================================
Indexes for Query Optimization
==========================================================
*/

-- Customer Lookup
CREATE INDEX idx_orders_customer
ON orders(customer_id);

-- Product Lookup
CREATE INDEX idx_orderitems_product
ON order_items(product_id);

-- Order Lookup
CREATE INDEX idx_orderitems_order
ON order_items(order_id);

-- Category Lookup
CREATE INDEX idx_products_category
ON products(category);

-- Date Lookup
CREATE INDEX idx_orders_orderdate
ON orders(order_date);

-- Region Lookup
CREATE INDEX idx_orders_region
ON orders(region);
