CREATE MATERIALIZED VIEW product_info_mview AS
SELECT 
    p.product_id,
    p.product_name,
    p.description,
    p.price,
    pt.product_category,
    pt.product_type
FROM product p
JOIN product_type pt
    ON p.product_type_id = pt.product_type_id;
