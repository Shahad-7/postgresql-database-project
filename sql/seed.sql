--
-- PostgreSQL database dump
--

-- Dumped from database version 16.10
-- Dumped by pg_dump version 17.2

-- Started on 2025-09-29 21:50:52

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

--
-- TOC entry 4942 (class 0 OID 16414)
-- Dependencies: 217
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer (customer_id, customer_name, customer_email, customer_since, customer_card_number, birthdate, gender) VALUES (0, 'Walk-in', 'walkin@example.com', NULL, NULL, NULL, NULL);


--
-- TOC entry 4943 (class 0 OID 16419)
-- Dependencies: 218
-- Data for Name: product_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_type (product_type_id, product_category, product_type) VALUES (3, 'Food', 'Pastry');
INSERT INTO public.product_type (product_type_id, product_category, product_type) VALUES (4, 'Food', 'Sandwich');
INSERT INTO public.product_type (product_type_id, product_category, product_type) VALUES (5, 'Dessert', 'Cake');
INSERT INTO public.product_type (product_type_id, product_category, product_type) VALUES (1, 'Drink', 'Coffee');
INSERT INTO public.product_type (product_type_id, product_category, product_type) VALUES (2, 'Drink', 'Tea');


--
-- TOC entry 4944 (class 0 OID 16424)
-- Dependencies: 219
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (product_id, product_type_id, product_name, description, price) VALUES (38, 1, 'Brazilian - Organic', 'Clean and smooth.', 18.00);
INSERT INTO public.product (product_id, product_type_id, product_name, description, price) VALUES (27, 2, 'Primo Espresso Roast', 'Single source hand roasted beans.', 20.45);
INSERT INTO public.product (product_id, product_type_id, product_name, description, price) VALUES (1, 1, 'Brazilian - Organic', 'It''s like Carnival in a cup. Clean and smooth.', 18.00);
INSERT INTO public.product (product_id, product_type_id, product_name, description, price) VALUES (2, 2, 'Our Old Time Diner Blend', 'Our packed blend of beans that is reminiscent of the cup of coffee you used to get at a diner.', 18.00);
INSERT INTO public.product (product_id, product_type_id, product_name, description, price) VALUES (3, 3, 'Espresso Roast', 'Our house blend for a good espresso shot.', 14.75);
INSERT INTO public.product (product_id, product_type_id, product_name, description, price) VALUES (4, 3, 'Primo Espresso Roast', 'Our premium single source of hand roasted beans.', 20.45);
INSERT INTO public.product (product_id, product_type_id, product_name, description, price) VALUES (5, 4, 'Columbian Medium Roast', 'A smooth cup of coffee any time of day.', 15.00);
INSERT INTO public.product (product_id, product_type_id, product_name, description, price) VALUES (6, 4, 'Ethiopia', 'From the home of coffee.', 21.00);


--
-- TOC entry 4940 (class 0 OID 16399)
-- Dependencies: 215
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.staff (staff_id, first_name, last_name, "position", start_date, location) VALUES (42, 'Ian', 'Tindale', 'CEO', '2001-03-08', 'HQ');


--
-- TOC entry 4941 (class 0 OID 16404)
-- Dependencies: 216
-- Data for Name: sales_outlet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sales_outlet (sales_outlet_id, sales_outlet_type, address, city, telephone, postal_code, manager) VALUES (8, 'retail', '100 Church Street', 'New York', '343-212-5151', '10007', 42);


--
-- TOC entry 4945 (class 0 OID 16437)
-- Dependencies: 220
-- Data for Name: sales_transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sales_transaction (transaction_id, transaction_date, transaction_time, sales_outlet_id, staff_id, customer_id) VALUES (1, '2019-04-27', '09:53:55+03', 8, 42, 0);


--
-- TOC entry 4946 (class 0 OID 16457)
-- Dependencies: 221
-- Data for Name: sales_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sales_detail (transaction_id, product_id, quantity, unit_price) VALUES (1, 38, 2, 3.75);
INSERT INTO public.sales_detail (transaction_id, product_id, quantity, unit_price) VALUES (1, 27, 1, 3.50);


--
-- TOC entry 4948 (class 0 OID 16486)
-- Dependencies: 224
-- Data for Name: staff_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.staff_location (staff_id, location) VALUES (1, 'Riyadh');
INSERT INTO public.staff_location (staff_id, location) VALUES (2, 'Jeddah');
INSERT INTO public.staff_location (staff_id, location) VALUES (3, 'Dammam');


-- Completed on 2025-09-29 21:50:52

--
-- PostgreSQL database dump complete
--

