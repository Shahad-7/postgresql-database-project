INSERT INTO staff (staff_id, first_name, last_name, position, start_date, location) VALUES
  (42,'Ian','Tindale','CEO','2001-03-08','HQ')
ON CONFLICT (staff_id) DO NOTHING;

INSERT INTO sales_outlet
(sales_outlet_id, sales_outlet_type, address, city, telephone, postal_code, manager)
VALUES
(8,'retail','100 Church Street','New York','343-212-5151','10007',42)
ON CONFLICT (sales_outlet_id) DO NOTHING;

INSERT INTO customer (customer_id, customer_name, customer_email)
VALUES (0,'Walk-in','walkin@example.com')
ON CONFLICT (customer_id) DO NOTHING;

INSERT INTO product_type (product_type_id, product_category, product_type) VALUES
  (1,'Coffee beans','Organic Beans'),
  (2,'Coffee beans','Espresso Beans')
ON CONFLICT (product_type_id) DO NOTHING;

INSERT INTO product (product_id, product_type_id, product_name, description, price) VALUES
  (38,1,'Brazilian - Organic','Clean and smooth.',18.00),
  (27,2,'Primo Espresso Roast','Single source hand roasted beans.',20.45)
ON CONFLICT (product_id) DO NOTHING;

INSERT INTO sales_transaction
(transaction_id, transaction_date, transaction_time, sales_outlet_id, staff_id, customer_id)
VALUES
(1,'2019-04-27','09:53:55',8,42,0)
ON CONFLICT (transaction_id) DO NOTHING;

INSERT INTO sales_detail (transaction_id, product_id, quantity, unit_price) VALUES
  (1,38,2,3.75),
  (1,27,1,3.50);