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
---

## 📈 Analytical Queries

Analytical SQL queries were created using the Data Warehouse (Star Schema) to answer common business questions, such as:

- Revenue evolution per month
- Top-selling products by revenue
- Revenue by payment method
- Average ticket value

These queries demonstrate how fact and dimension tables can be used together to generate meaningful business insights.

📄 SQL file:
sql/analytics_queries.sql

---

## 🛠️ Technologies Used

- MySQL
- MySQL Workbench
- Python
- SQL
- Git & GitHub

---

## 🎯 Key Skills Demonstrated

- Relational Database Modeling (ER Diagram)
- Data Warehouse Design (Star Schema)
- ETL Automation with Python
- Analytical SQL Queries
- Business-Oriented Data Analysis

---

## 📸 Query Execution Examples

Below are examples of analytical queries executed in MySQL Workbench using the Data Warehouse schema.

### Revenue per Month
![Revenue per Month](images/queries/revenue_per_month.png)

### Top Products by Revenue
![Top Products](images/queries/top_products.png)

### Revenue by Payment Method
![Revenue by Payment Method](images/queries/revenue_by_payment_method.png)

### Average Ticket
![Average Ticket](images/queries/average_ticket.png)

---

## 📊 Business KPIs Explained

### 1️⃣ Revenue per Month
Measures total revenue aggregated by year and month.

**Business Value:**
- Identifies seasonality patterns
- Tracks growth trends
- Supports revenue forecasting

---

### 2️⃣ Top Products by Revenue
Ranks products according to total revenue generated.

**Business Value:**
- Identifies high-performing products
- Supports inventory and supply planning
- Assists marketing strategy decisions

---

### 3️⃣ Revenue by Payment Method
Analyzes revenue distribution across different payment types.

**Business Value:**
- Understands customer payment preferences
- Supports financial and operational decisions
- Helps evaluate payment provider performance

---

### 4️⃣ Average Ticket
Calculates the average value per sale.

**Business Value:**
- Measures customer purchasing behavior
- Tracks pricing strategy effectiveness
- Evaluates promotional impact

---

## 🌍 Real-World Business Scenario

This project simulates a real e-commerce company that needs to transform raw transactional data into structured and reliable business insights.

The Data Warehouse was designed to support:

- Executive revenue analysis
- Product performance monitoring
- Payment behavior analysis
- KPI tracking for strategic decision-making

The architecture follows best practices commonly used in real Business Intelligence and Data Engineering environments.

---

## 🏗️ Data Engineering Concepts Applied

- Star Schema modeling
- Fact and Dimension table separation
- Surrogate key implementation (`*_key`)
- Defined fact table grain
- Full Load ETL strategy (truncate and load)
- Transaction control (commit / rollback)
- Modular and maintainable ETL structure
- Aggregation and KPI extraction from fact tables

---

## 🔎 Fact Table Grain Definition

The grain of the `fact_sales` table is defined as:

> One record per product sold per order.

This grain ensures correct aggregation for revenue calculations, product performance analysis, and average ticket computation.

Clearly defining the grain guarantees data consistency and prevents incorrect KPI calculations.

---

## 🚀 Future Improvements

- Implement incremental load strategy
- Add data validation and quality checks
- Create BI dashboards (Power BI or Tableau)
- Orchestrate ETL with Apache Airflow
- Deploy to a cloud data warehouse (Snowflake, BigQuery or Redshift)
- Containerize the ETL process using Docker


*Created by Brenda Espinosa*
