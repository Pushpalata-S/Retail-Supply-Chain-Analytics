CREATE INDEX idx_orders_customer
ON orders(customer_id);

CREATE INDEX idx_orderitems_product
ON order_items(product_id);

CREATE INDEX idx_orderitems_order
ON order_items(order_id);

CREATE INDEX idx_products_category
ON products(category);

EXPLAIN
SELECT
    c.customer_name,
    SUM(oi.sales)
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN order_items oi
ON o.order_id=oi.order_id
GROUP BY c.customer_name;