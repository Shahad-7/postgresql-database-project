--
-- PostgreSQL database dump
--

-- Dumped from database version 16.10
-- Dumped by pg_dump version 17.2

-- Started on 2025-09-29 21:49:33

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16414)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    customer_name character varying(100) NOT NULL,
    customer_email character varying(120),
    customer_since date,
    customer_card_number character varying(30),
    birthdate date,
    gender character(1)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16424)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    product_type_id integer NOT NULL,
    product_name character varying(120) NOT NULL,
    description text,
    price numeric(10,2),
    CONSTRAINT product_price_check CHECK ((price >= (0)::numeric))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16419)
-- Name: product_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_type (
    product_type_id integer NOT NULL,
    product_category character varying(60),
    product_type character varying(60)
);


ALTER TABLE public.product_type OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16480)
-- Name: product_info_mview; Type: MATERIALIZED VIEW; Schema: public; Owner: postgres
--

CREATE MATERIALIZED VIEW public.product_info_mview AS
 SELECT p.product_id,
    p.product_name,
    p.description,
    p.price,
    pt.product_category,
    pt.product_type
   FROM (public.product p
     JOIN public.product_type pt ON ((p.product_type_id = pt.product_type_id)))
  WITH NO DATA;


ALTER MATERIALIZED VIEW public.product_info_mview OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16457)
-- Name: sales_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_detail (
    transaction_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    CONSTRAINT sales_detail_quantity_check CHECK ((quantity > 0)),
    CONSTRAINT sales_detail_unit_price_check CHECK ((unit_price >= (0)::numeric))
);


ALTER TABLE public.sales_detail OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16404)
-- Name: sales_outlet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_outlet (
    sales_outlet_id integer NOT NULL,
    sales_outlet_type character varying(40),
    address character varying(120),
    city character varying(80),
    telephone character varying(30),
    postal_code character varying(15),
    manager integer
);


ALTER TABLE public.sales_outlet OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16437)
-- Name: sales_transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_transaction (
    transaction_id integer NOT NULL,
    transaction_date date NOT NULL,
    transaction_time time with time zone NOT NULL,
    sales_outlet_id integer,
    staff_id integer,
    customer_id integer
);


ALTER TABLE public.sales_transaction OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    staff_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    "position" character varying(60),
    start_date date,
    location character varying(30)
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16486)
-- Name: staff_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff_location (
    staff_id integer NOT NULL,
    location character varying(50)
);


ALTER TABLE public.staff_location OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16476)
-- Name: staff_locations_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.staff_locations_view AS
 SELECT staff_id,
    first_name,
    last_name,
    "position",
    location
   FROM public.staff;


ALTER VIEW public.staff_locations_view OWNER TO postgres;

--
-- TOC entry 4778 (class 2606 OID 16418)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4788 (class 2606 OID 16463)
-- Name: sales_detail pk_sales_detail; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_detail
    ADD CONSTRAINT pk_sales_detail PRIMARY KEY (transaction_id, product_id);


--
-- TOC entry 4782 (class 2606 OID 16431)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4780 (class 2606 OID 16423)
-- Name: product_type product_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type
    ADD CONSTRAINT product_type_pkey PRIMARY KEY (product_type_id);


--
-- TOC entry 4776 (class 2606 OID 16408)
-- Name: sales_outlet sales_outlet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_outlet
    ADD CONSTRAINT sales_outlet_pkey PRIMARY KEY (sales_outlet_id);


--
-- TOC entry 4785 (class 2606 OID 16441)
-- Name: sales_transaction sales_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_transaction
    ADD CONSTRAINT sales_transaction_pkey PRIMARY KEY (transaction_id);


--
-- TOC entry 4790 (class 2606 OID 16490)
-- Name: staff_location staff_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_location
    ADD CONSTRAINT staff_location_pkey PRIMARY KEY (staff_id);


--
-- TOC entry 4774 (class 2606 OID 16403)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_id);


--
-- TOC entry 4786 (class 1259 OID 16475)
-- Name: idx_sd_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sd_product ON public.sales_detail USING btree (product_id);


--
-- TOC entry 4783 (class 1259 OID 16474)
-- Name: idx_th_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_th_date ON public.sales_transaction USING btree (transaction_date);


--
-- TOC entry 4792 (class 2606 OID 16432)
-- Name: product fk_product_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_product_type FOREIGN KEY (product_type_id) REFERENCES public.product_type(product_type_id);


--
-- TOC entry 4791 (class 2606 OID 16409)
-- Name: sales_outlet fk_salesoutlet_manager; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_outlet
    ADD CONSTRAINT fk_salesoutlet_manager FOREIGN KEY (manager) REFERENCES public.staff(staff_id);


--
-- TOC entry 4796 (class 2606 OID 16469)
-- Name: sales_detail fk_sd_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_detail
    ADD CONSTRAINT fk_sd_product FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- TOC entry 4797 (class 2606 OID 16464)
-- Name: sales_detail fk_sd_transaction; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_detail
    ADD CONSTRAINT fk_sd_transaction FOREIGN KEY (transaction_id) REFERENCES public.sales_transaction(transaction_id) ON DELETE CASCADE;


--
-- TOC entry 4793 (class 2606 OID 16452)
-- Name: sales_transaction fk_th_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_transaction
    ADD CONSTRAINT fk_th_customer FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- TOC entry 4794 (class 2606 OID 16442)
-- Name: sales_transaction fk_th_outlet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_transaction
    ADD CONSTRAINT fk_th_outlet FOREIGN KEY (sales_outlet_id) REFERENCES public.sales_outlet(sales_outlet_id);


--
-- TOC entry 4795 (class 2606 OID 16447)
-- Name: sales_transaction fk_th_staff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_transaction
    ADD CONSTRAINT fk_th_staff FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id);


-- Completed on 2025-09-29 21:49:33

--
-- PostgreSQL database dump complete
--

