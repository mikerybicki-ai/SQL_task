-- 2
SELECT u.id, name FROM users u LEFT JOIN
orders o ON u.id = o.user_id 
where o.user_id is null;


SELECT count(*) FROM users u LEFT JOIN
orders o ON u.id = o.user_id 
where o.user_id is null;


select * from products p
LEFT JOIN reviews r
ON p.id = r.product_id
where product_id is null;


CREATE TABLE categories(
	id SERIAL PRIMARY KEY,
	category varchar(40) NOT NULL
);


INSERT INTO categories(category)
SELECT DISTINCT(category)
FROM products;

-- 3 
CREATE VIEW average_ratings AS
SELECT p.id as prod_id, ROUND(AVG(r.rating),2) as average_rating from products p
LEFT JOIN reviews r
ON p.id = r.product_id
GROUP BY p.id
ORDER BY AVG(r.rating);

-- 4
CREATE MATERIALIZED VIEW average_ratings_materialized AS
SELECT p.id as prod_id, ROUND(AVG(r.rating),2) as average_rating_reviews, ROUND(CAST(AVG(p.rating) as numeric), 2) as average_rating_products from products p
LEFT JOIN reviews r
ON p.id = r.product_id
GROUP BY p.id
ORDER BY AVG(r.rating)

-- 5


explain SELECT u.id, name FROM users u LEFT JOIN
orders o ON u.id = o.user_id 
where o.user_id is null;


EXPLAIN select * from products p
LEFT JOIN reviews r
ON p.id = r.product_id
where product_id is null;

explain SELECT p.id as prod_id, ROUND(AVG(r.rating),2) as average_rating from products p
LEFT JOIN reviews r
ON p.id = r.product_id
GROUP BY p.id
ORDER BY AVG(r.rating);

-- ADDING INDEXES ON columns orders.user_id ,reviews.product_id ,reviews.rating, products.rating, SO COLUMNS WHICH PARTICIPATE
-- IN JOINS, GROUPING, FILTERING, WILL IMPROVE EXECUTION.. 

