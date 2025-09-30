BEGIN;


TRUNCATE TABLE
  sales_detail,
  sales_transaction,
  sales_outlet,
  product,
  product_type,
  staff_location,
  customer,
  staff
RESTART IDENTITY CASCADE;


INSERT INTO staff (staff_id, first_name, last_name, position, start_date, location) VALUES
  (42,'Ian','Tindale','CEO','2001-03-08','HQ');


INSERT INTO customer (customer_id, customer_name, customer_email) VALUES
  (0,'Walk-in','walkin@example.com');


INSERT INTO product_type (product_type_id, product_category, product_type) VALUES
  (1,'Drink','Coffee'),
  (2,'Drink','Tea'),
  (3,'Food','Pastry'),
  (4,'Food','Sandwich'),
  (5,'Dessert','Cake');


INSERT INTO product (product_id, product_type_id, product_name, description, price) VALUES
  (1, 1,'Brazilian - Organic','It''s like Carnival in a cup. Clean and smooth.',18.00),
  (2, 1,'Our Old Time Diner Blend','Our packed blend of beans that is reminiscent of the cup of coffee you used to get at a diner.',18.00),
  (3, 3,'Espresso Roast','Our house blend for a good espresso shot.',14.75),
  (4, 3,'Primo Espresso Roast','Our premium single source of hand roasted beans.',20.45),
  (5, 4,'Columbian Medium Roast','A smooth cup of coffee any time of day.',15.00),
  (6, 4,'Ethiopia','From the home of coffee.',21.00),
  (27,2,'Primo Espresso Roast','Single source hand roasted beans.',20.45),
  (38,1,'Brazilian - Organic','Clean and smooth.',18.00);


INSERT INTO sales_outlet
(sales_outlet_id, sales_outlet_type, address, city, telephone, postal_code, manager)
VALUES
(8,'retail','100 Church Street','New York','343-212-5151','10007',42);


INSERT INTO sales_transaction
(transaction_id, transaction_date, transaction_time, sales_outlet_id, staff_id, customer_id)
VALUES
(1,'2019-04-27','09:53:55',8,42,0);


INSERT INTO sales_detail (transaction_id, product_id, quantity, unit_price) VALUES
  (1,38,2,3.75),
  (1,27,1,3.50);


INSERT INTO staff_location (staff_id, location) VALUES
  (1,'Riyadh'),
  (2,'Jeddah'),
  (3,'Dammam');

COMMIT;
