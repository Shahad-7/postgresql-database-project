-- Project: Coffee Shop RDBMS
-- File: sql/schema.sql
-- Run order: 1/3 (DDL)


CREATE TABLE IF NOT EXISTS public.staff (
  staff_id    INTEGER PRIMARY KEY,
  first_name  VARCHAR(50) NOT NULL,
  last_name   VARCHAR(50) NOT NULL,
  position    VARCHAR(60),
  start_date  DATE,
  location    VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS public.product_type (
  product_type_id  INTEGER PRIMARY KEY,
  product_category VARCHAR(60),
  product_type     VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS public.customer (
  customer_id          INTEGER PRIMARY KEY,
  customer_name        VARCHAR(100) NOT NULL,
  customer_email       VARCHAR(120),
  customer_since       DATE,
  customer_card_number VARCHAR(30),
  birthdate            DATE,
  gender               CHAR(1)
);


CREATE TABLE IF NOT EXISTS public.sales_outlet (
  sales_outlet_id   INTEGER PRIMARY KEY,
  sales_outlet_type VARCHAR(40),
  address           VARCHAR(120),
  city              VARCHAR(80),
  telephone         VARCHAR(30),
  postal_code       VARCHAR(15),
  manager           INTEGER,
  CONSTRAINT fk_salesoutlet_manager
    FOREIGN KEY (manager) REFERENCES public.staff(staff_id)
);

CREATE TABLE IF NOT EXISTS public.product (
  product_id       INTEGER PRIMARY KEY,
  product_type_id  INTEGER NOT NULL,
  product_name     VARCHAR(120) NOT NULL,
  description      TEXT,
  price            NUMERIC(10,2) CHECK (price >= 0),
  CONSTRAINT fk_product_type
    FOREIGN KEY (product_type_id) REFERENCES public.product_type(product_type_id)
);

CREATE TABLE IF NOT EXISTS public.sales_transaction (
  transaction_id    INTEGER PRIMARY KEY,
  transaction_date  DATE NOT NULL,
  transaction_time  TIME WITH TIME ZONE NOT NULL,
  sales_outlet_id   INTEGER,
  staff_id          INTEGER,
  customer_id       INTEGER,
  CONSTRAINT fk_th_outlet   FOREIGN KEY (sales_outlet_id) REFERENCES public.sales_outlet(sales_outlet_id),
  CONSTRAINT fk_th_staff    FOREIGN KEY (staff_id)        REFERENCES public.staff(staff_id),
  CONSTRAINT fk_th_customer FOREIGN KEY (customer_id)     REFERENCES public.customer(customer_id)
);

CREATE TABLE IF NOT EXISTS public.sales_detail (
  transaction_id INTEGER NOT NULL,
  product_id     INTEGER NOT NULL,
  quantity       INTEGER NOT NULL CHECK (quantity > 0),
  unit_price     NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0),
  CONSTRAINT pk_sales_detail PRIMARY KEY (transaction_id, product_id),
  CONSTRAINT fk_sd_transaction FOREIGN KEY (transaction_id)
    REFERENCES public.sales_transaction(transaction_id) ON DELETE CASCADE,
  CONSTRAINT fk_sd_product FOREIGN KEY (product_id)
    REFERENCES public.product(product_id)
);


CREATE TABLE IF NOT EXISTS public.staff_location (
  staff_id INTEGER PRIMARY KEY,
  location VARCHAR(50)
);


CREATE INDEX IF NOT EXISTS idx_th_date   ON public.sales_transaction(transaction_date);
CREATE INDEX IF NOT EXISTS idx_sd_product ON public.sales_detail(product_id);
