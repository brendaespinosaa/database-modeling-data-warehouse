import mysql.connector
from datetime import datetime

# =========================
# Configuration
# =========================
DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "",
    "database": "ecommerce_dw"
}

# =========================
# Logging function
# =========================
def log(message):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f"[{timestamp}] {message}")

# =========================
# Database connection
# =========================
def get_connection():
    return mysql.connector.connect(**DB_CONFIG)

# =========================
# Load Dimensions
# =========================
def load_dim_customer(cursor):
    log("Loading dim_customer")
    cursor.execute("""
        TRUNCATE TABLE dim_customer;
    """)
    cursor.execute("""
        INSERT INTO dim_customer (customer_id, customer_name, email)
        SELECT customer_id, name, email
        FROM ecommerce_db.customers;
    """)

def load_dim_product(cursor):
    log("Loading dim_product")
    cursor.execute("""
        TRUNCATE TABLE dim_product;
    """)
    cursor.execute("""
        INSERT INTO dim_product (product_id, product_name, category, price)
        SELECT product_id, product_name, category, price
        FROM ecommerce_db.products;
    """)

def load_dim_payment_method(cursor):
    log("Loading dim_payment_method")
    cursor.execute("""
        TRUNCATE TABLE dim_payment_method;
    """)
    cursor.execute("""
        INSERT INTO dim_payment_method (payment_method)
        SELECT DISTINCT payment_method
        FROM ecommerce_db.payments;
    """)

def load_dim_date(cursor):
    log("Loading dim_date")
    cursor.execute("""
        INSERT IGNORE INTO dim_date (date_key, full_date, day, month, year)
        SELECT DISTINCT
            DATE_FORMAT(order_date, '%Y%m%d'),
            order_date,
            DAY(order_date),
            MONTH(order_date),
            YEAR(order_date)
        FROM ecommerce_db.orders;
    """)

# =========================
# Load Fact Table
# =========================
def load_fact_sales(cursor):
    log("Loading fact_sales")
    cursor.execute("""
        TRUNCATE TABLE fact_sales;
    """)
    cursor.execute("""
        INSERT INTO fact_sales (
            customer_key,
            product_key,
            date_key,
            payment_method_key,
            quantity,
            total_amount
        )
        SELECT
            dc.customer_key,
            dp.product_key,
            dd.date_key,
            dpm.payment_method_key,
            oi.quantity,
            oi.quantity * oi.unit_price
        FROM ecommerce_db.order_items oi
        JOIN ecommerce_db.orders o ON oi.order_id = o.order_id
        JOIN ecommerce_db.customers c ON o.customer_id = c.customer_id
        JOIN ecommerce_db.products p ON oi.product_id = p.product_id
        JOIN ecommerce_db.payments pay ON o.order_id = pay.order_id
        JOIN dim_customer dc ON dc.customer_id = c.customer_id
        JOIN dim_product dp ON dp.product_id = p.product_id
        JOIN dim_date dd ON dd.full_date = o.order_date
        JOIN dim_payment_method dpm ON dpm.payment_method = pay.payment_method;
    """)

# =========================
# Main ETL process
# =========================
def run_etl():
    log("ETL process started")

    conn = get_connection()
    cursor = conn.cursor()

    try:
        load_dim_customer(cursor)
        load_dim_product(cursor)
        load_dim_payment_method(cursor)
        load_dim_date(cursor)
        load_fact_sales(cursor)

        conn.commit()
        log("ETL process completed successfully")

    except Exception as e:
        conn.rollback()
        log(f"ETL failed: {e}")

    finally:
        cursor.close()
        conn.close()
        log("Database connection closed")

# =========================
# Run ETL
# =========================
if __name__ == "__main__":
    run_etl()


*Created by Brenda Espinosa*
