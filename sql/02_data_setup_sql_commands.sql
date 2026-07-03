USE retail_supply_chain;

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    segment VARCHAR(30)
);
INSERT INTO customers (customer_id, customer_name, segment)
SELECT DISTINCT
    `Customer ID`,
    `Customer Name`,
    Segment
FROM retail_orders;


DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id VARCHAR(30) PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(50),
    sub_category VARCHAR(50)
);
INSERT INTO products (product_id, product_name, category, sub_category)
SELECT
    `Product ID`,
    MAX(`Product Name`),
    MAX(Category),
    MAX(`Sub-Category`)
FROM retail_orders
GROUP BY `Product ID`;


DROP TABLE IF EXISTS locations;

CREATE TABLE locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    postal_code INT,
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    region VARCHAR(50)
);
INSERT INTO locations (postal_code, city, state, country, region)
SELECT DISTINCT
    `Postal Code`,
    City,
    State,
    Country,
    Region
FROM retail_orders;


DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(30),
    customer_id VARCHAR(20),

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);
INSERT INTO orders (
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id
)
SELECT
    `Order ID`,
    MIN(`Order Date`),
    MIN(`Ship Date`),
    MAX(`Ship Mode`),
    MAX(`Customer ID`)
FROM retail_orders
GROUP BY `Order ID`;


DROP TABLE IF EXISTS order_items;

DROP TABLE IF EXISTS order_items;

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(20),
    product_id VARCHAR(30),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2),
    returned VARCHAR(10),

    CONSTRAINT fk_orderitems_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT fk_orderitems_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);
INSERT INTO order_items (
    order_id,
    product_id,
    sales,
    quantity,
    discount,
    profit,
    returned
)
SELECT
    `Order ID`,
    `Product ID`,
    Sales,
    Quantity,
    Discount,
    Profit,
    Returned
FROM retail_orders;
