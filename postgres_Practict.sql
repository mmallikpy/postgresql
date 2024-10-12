-- Table create
CREATE TABLE cars (
  brand VARCHAR(255),
  model VARCHAR(255),
  year INT
);

-- Data insert in single Columns
INSERT INTO cars (brand, model, year) VALUES ('Ford', 'Mustang', 1964);

-- Insert multiple row
INSERT INTO cars (brand, model, year)
VALUES
  ('Volvo', 'p1800', 1968),
  ('BMW', 'M1', 1978),
  ('Toyota', 'Celica', 1975);

-- Display cars table
SELECT * FROM cars;

-- Dislplay [ brand and year ] from cars table
SELECT brand, year FROM cars;

-- Add a Columns with blank value
ALTER TABLE cars ADD color VARCHAR(255);

-- Delete a Coloumns
ALTER TABLE cars DROP color;

-- Update a single Columns
UPDATE cars SET color = 'Red' WHERE brand = 'Volvo'

-- Update all Columns
UPDATE cars set color = 'Blue'

-- Update Multiple Columns
UPDATE cars SET color = 'White', year = 1970 where brand = 'Toyota'

-- Display a table data types "Run this command in terminal"
-- \d cars

-- Alter column 'Update int to var'
ALTER TABLE cars ALTER COLUMN year TYPE VARCHAR(4);

-- Alter column 'Change the color column from VARCHAR(255) to VARCHAR(30)'
ALTER TABLE cars ALTER COLUMN color TYPE VARCHAR(30);

-- Drop column name color
ALTER TABLE cars DROP COLUMN color;

-- ***** Delete statement is used to delete esisting records in a table [If you omit the WHERE clause, all records in the table will be deleted!].
-- Delete record from a table where brand is "Toyota"
DELETE FROM cars WHERE brand='Toyota';
DELETE FROM cars WHERE brand='Ford';


-- Delete All Records
DELETE FROM cars;
TRUNCATE TABLE cars;

-- Drop a table
DROP table cars;

-- #################################################################
-- Operators in the WHERE clause

-- =	Equal to
-- <	Less than
-- >	Greater than
-- <=	Less than or equal to
-- >=	Greater than or equal to
-- <>	Not equal to
-- !=	Not equal to
-- LIKE	Check if a value matches a pattern (case sensitive)
-- ILIKE	Check if a value matches a pattern (case insensitive)
-- AND	Logical AND
-- OR	Logical OR
-- IN	Check if a value is between a range of values
-- BETWEEN	Check if a value is between a range of values
-- IS NULL	Check if a value is NULL
-- NOT	Makes a negative result e.g. NOT LIKE, NOT IN, NOT BETWEEN

-- -----------Examples-----------
-- Equal To
SELECT * from cars WHERE brand = 'Volvo'

-- Less Than
Select * from cars Where year < 1970;

-- Getter than
SELECT * FROM cars WHERE year > 1970

-- <=	Less than or equal to
select postal_code from customers where postal_code <= '1010'

-- >=	Greater than or equal to
select postal_code from customers where postal_code >= '1010';

-- <>	Not equal to | !=	Not equal to
select * from customers where country = 'UK'  and city != 'London';
select * from customers where country = 'UK'  and city <> 'London';

-- LIKE & ILIKE Check if a value matches a pattern (case sensitive)
select * from customers where country Like 'A%'
SELECT * FROM customers WHERE customer_name LIKE 'A%' and customer_id = 4;
select * from customers where city ilike '%rid%' and postal_code > '28010' and customer_id <= 22;

-- IN Operator
-- Check if a value is between a range of values
-- The IN operator allows you to specify a list of possible values in the WHERE clause.
-- The IN operator is a shorthand for multiple OR conditions.

select * from customers where country IN('UK', 'USA');
SELECT * FROM customers WHERE country NOT IN ('UK', 'France');
SELECT * FROM customers WHERE customer_id IN (1, 5, 9, 15);
SELECT * FROM customers WHERE customer_id IN (SELECT customer_id FROM orders);

-- BETWEEN Operator
-- Check if a value is between a range of values
-- The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.
-- The BETWEEN operator is inclusive: begin and end values are included.

select * from customers where customer_id between 40 and 50 ;
select * from cars where year BETWEEN 1970 and 1975;
SELECT * FROM customers WHERE city BETWEEN 'A' AND 'C';
SELECT * FROM Products WHERE product_name BETWEEN 'Pavlova' AND 'Tofu' ORDER BY product_name;

-- IS NULL	Check if a value is NULL
SELECT * FROM customers WHERE city IS NULL;
SELECT * FROM customers WHERE city IS NULL OR TRIM(city) = '';

-- DISTINCT
-- The SELECT DISTINCT statement is used to return only distinct (different) values. Inside a table,
-- a column often contains many duplicate values and sometimes you only want to list the different (distinct) values.
SELECT DISTINCT country FROM customers;
SELECT COUNT(DISTINCT country) from customers;


-- WHERE - Filter Data
SELECT * FROM customers WHERE city = 'London';
SELECT * FROM customers WHERE customer_id > 80;

-- ORDER BY			***[Place of order by in a query]
-- The ORDER BY keyword is used to sort the result in ascending or descending order.
SELECT * FROM products ORDER BY price;
SELECT * FROM products WHERE price >= 5  ORDER BY price;
SELECT * FROM products WHERE price >= 5  ORDER BY price DESC;

-- LIMIT
-- The LIMIT clause is used to limit the maximum number of records to return.
SELECT * FROM customers;
SELECT * FROM customers LIMIT 10;
SELECT * FROM customers ORDER BY customer_name LIMIT 10;
SELECT * FROM customers LIMIT 10 OFFSET 45;

-- MIN, MAX Functions
-- The MIN() function returns the smallest value of the selected column.
SELECT MIN(order_id) FROM order_details; 
SELECT MIN(price) AS lowest_price FROM products;

SELECT MAX(order_id) FROM order_details;
SELECT MAX(price) AS maximum_price FROM products;

-- COUNT Function
-- COUNT() function returns the number of columns with that name.
SELECT COUNT(customer_id) FROM customers;
SELECT COUNT(customer_id) FROM customers WHERE city = 'London';

-- SUM Function 
-- The SUM() function returns the total sum of a numeric column
SELECT SUM(quantity) FROM order_details;

-- AVG Function
-- The AVG() function returns the average value of a numeric column.
SELECT AVG(quantity) FROM order_details;
SELECT AVG(price)::NUMERIC(10,2) FROM products;
SELECT AVG(price)::NUMERIC(10,3) FROM products;
SELECT AVG(price)::NUMERIC(10,4) FROM products;

-- LIKE, ILIKE Operator
-- ILIKE = case sensitive
-- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
SELECT * FROM customers WHERE customer_name LIKE '%n';
SELECT * FROM customers WHERE customer_name LIKE '%A%';

-- AS
-- Aliases
-- SQL aliases are used to give a table, or a column in a table, a temporary name.
-- Aliases are often used to make column names more readable.
-- An alias only exists for the duration of that query.
-- An alias is created with the AS keyword.

SELECT customer_id AS id FROM customers;
SELECT customer_id id FROM customers;
SELECT product_name, unit FROM products;
SELECT product_name || unit AS product FROM products;				-- [Concatenate || ]
SELECT product_name || ' ' || unit AS product FROM products;


-- JOIN
-- A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

-- INNER JOIN
-- The INNER JOIN keyword selects records that have matching values in both tables.

SELECT *
FROM products
INNER JOIN categories ON products.category_id = categories.category_id;

-- LEFT JOIN
-- The LEFT JOIN keyword selects ALL records from the "left" table, and the matching records from the "right" table.
-- The result is 0 records from the right side if there is no match.

SELECT testproduct_id, product_name, category_name
FROM testproducts
LEFT JOIN categories ON testproducts.category_id = categories.category_id;

-- RIGHT JOIN
-- The RIGHT JOIN keyword selects ALL records from the "right" table, and the matching records from the "left" table. 
-- The result is 0 records from the left side if there is no match.

SELECT testproduct_id, product_name, category_name
FROM testproducts
RIGHT JOIN categories ON testproducts.category_id = categories.category_id;

-- FULL JOIN
-- The FULL JOIN keyword selects ALL records from both tables, even if there is not a match. For rows with a match the values 
-- from both tables are available, if there is not a match the empty fields will get the value NULL.
SELECT testproduct_id, product_name, category_name
FROM testproducts
FULL JOIN categories ON testproducts.category_id = categories.category_id;

-- GROUP BY
-- The GROUP BY clause groups rows that have the same values into summary rows, like "find the number of customers in each country".
SELECT customers.customer_name, COUNT(orders.order_id)
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customer_name;



SELECT COUNT(customer_id), country
FROM customers
GROUP BY country
HAVING COUNT(customer_id) > 5;

SELECT order_details.order_id, SUM(products.price)
FROM order_details
LEFT JOIN products ON order_details.product_id = products.product_id
GROUP BY order_id
HAVING SUM(products.price) > 400.00;
