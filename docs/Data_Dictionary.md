# Data Dictionary

## customers

| Column        | Type        | Description                |
| ------------- | ----------- | -------------------------- |
| customer_id   | VARCHAR(20) | Unique customer identifier |
| customer_name | VARCHAR     | Customer full name         |
| segment       | VARCHAR     | Customer segment           |

---

## products

| Column       | Type        | Description               |
| ------------ | ----------- | ------------------------- |
| product_id   | VARCHAR(30) | Unique product identifier |
| product_name | VARCHAR     | Product name              |
| category     | VARCHAR     | Product category          |
| sub_category | VARCHAR     | Product sub-category      |

---

## orders

| Column      | Type        | Description             |
| ----------- | ----------- | ----------------------- |
| order_id    | VARCHAR(20) | Unique order identifier |
| order_date  | DATE        | Order date              |
| ship_date   | DATE        | Shipping date           |
| ship_mode   | VARCHAR     | Shipping method         |
| customer_id | VARCHAR     | Customer identifier     |

---

## order_items

| Column        | Type    | Description       |
| ------------- | ------- | ----------------- |
| order_item_id | INT     | Unique order item |
| order_id      | VARCHAR | Related order     |
| product_id    | VARCHAR | Related product   |
| sales         | DECIMAL | Sales amount      |
| quantity      | INT     | Quantity ordered  |
| discount      | DECIMAL | Discount applied  |
| profit        | DECIMAL | Profit earned     |
| returned      | VARCHAR | Return status     |

---

## locations

| Column      | Type    | Description                |
| ----------- | ------- | -------------------------- |
| location_id | INT     | Unique location identifier |
| postal_code | INT     | Postal code                |
| city        | VARCHAR | City                       |
| state       | VARCHAR | State                      |
| country     | VARCHAR | Country                    |
| region      | VARCHAR | Region                     |
