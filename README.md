# Database Modeling and Data Warehouse Project

## 📌 Project Overview
This project demonstrates an end-to-end data solution, starting from a transactional database (OLTP) to a fully modeled Data Warehouse using a Star Schema.

The project includes database modeling, ETL automation using Python, and analytical SQL queries to support business decision-making.

---

## 🏗️ Architecture
- OLTP Database (MySQL)
- Data Warehouse (Star Schema)
- ETL Pipeline (Python)
- Analytical Queries (SQL)

---

## 🗂️ Database Modeling (OLTP)
The transactional database was modeled to support an e-commerce scenario, including customers, products, orders, order items, and payments.

![ER Diagram](diagrams/er_diagram.png)

---

## 📊 Data Warehouse Model
The Data Warehouse follows a Star Schema design with the following tables:
- fact_sales
- dim_customer
- dim_product
- dim_date
- dim_payment_method

![Star Schema](diagrams/star_schema_diagram.png)

---

## ⚙️ ETL Process
The ETL pipeline was developed in Python and includes:
- Full load strategy (truncate and load)
- Logging for monitoring
- Transaction control (commit / rollback)
- Modular functions for maintainability

To run the ETL:
```bash
python3 etl/etl_dw.py
```


*Created by Brenda Espinosa*
