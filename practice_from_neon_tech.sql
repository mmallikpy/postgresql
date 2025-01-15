-- *********************PostgreSQL SELECT statement syntax*********************
-- 1) Using PostgreSQL SELECT statement to query data from one column example
SELECT 
	first_name 
FROM
	customer;

-- 2) Using PostgreSQL SELECT statement to query data from multiple columns example
SELECT
	first_name,
	last_name,
	email
FROM
	customer;

-- 3) Using PostgreSQL SELECT statement to query data from all columns of a table example
select * from customer;


-- 4) Using PostgreSQL SELECT statement with expressions example
-- concatenation operator ||
SELECT
   first_name || ' ' || last_name,
   email
FROM
   customer;

-- 
SELECT 
	first_name || ' ' || last_name AS Full_Name
FROM
	customer;

-- 
SELECT 
	first_name || ' ' || last_name AS full_name, email 
FROM
	customer;


-- 5) Using PostgreSQL SELECT statement without a FROM clause
SELECT NOW();


-- *********************PostgreSQL Column Alias*********************

-- 1) Assigning a column alias to a column example
SELECT
	first_name,
	last_name
FROM
	customer;


SELECT
	first_name,
	last_name AS surname
FROM
	customer;

-- 1) Or you can make it shorter by removing the AS keyword as follows:

SELECT
	first_name,
	last_name surname
FROM
	customer;


-- 2) Assigning a column alias to an expression example
SELECT 
	first_name || ' ' || last_name AS full_name
FROM
	customer;



-- *********************PostgreSQL ORDER BY*********************
-- The ORDER BY clause allows you to sort rows

select * from customer
ORDER BY customer.first_name;


-- 1) Using PostgreSQL ORDER BY clause to sort rows by one column
SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name ASC;
-- 2) Using PostgreSQL ORDER BY clause to sort rows by one column in descending orde
SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name DESC;

-- 3) Using PostgreSQL ORDER BY clause to sort rows by multiple columns
SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name ASC,
	last_name DESC;

-- 4) Using PostgreSQL ORDER BY clause to sort rows by expressions
-- 
SELECT
	first_name,
	LENGTH(last_name) len
FROM
	customer
ORDER BY 
	len DESC;
-- 
SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	last_name DESC;
-- 
SELECT
	*
FROM
	actor
WHERE
	first_name = null;


-- *********************PostgreSQL SELECT DISTINCT*********************
-- removes duplicate rows from a result set
-- 
SELECT
	DISTINCT actor.first_name, actor.last_name
FROM
	actor
ORDER BY actor.first_name;

-- 
SELECT
	DISTINCT actor.first_name || ' ' || actor.last_name as full_name
FROM
	actor

ORDER BY 
	full_name;

-- 
SELECT
	DISTINCT *
FROM
	actor;

-- 
SELECT
	DISTINCT actor.first_name || ' ' || actor.last_name AS fullName, COUNT(actor.actor_id) as countid
FROM
	actor
GROUP BY
	fullName
ORDER BY countid desc;

-- 
SELECT
	DISTINCT actor.first_name || ' ' || actor.last_name AS fullName
FROM
	actor;

-- 
SELECT
  id,
  bcolor,
  fcolor
FROM
  colors;

-- 
SELECT
  DISTINCT bcolor
FROM
  colors
ORDER BY
  bcolor;

-- 
SELECT
  DISTINCT bcolor, fcolor
FROM
  colors
ORDER BY
  bcolor,
  fcolor;

-- 
SELECT DISTINCT
  rental_rate
FROM
  film
ORDER BY
  rental_rate;


-- *********************PostgreSQL WHERE*********************

-- 1)  Using WHERE clause with the equal (=) operator example
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name = 'Jamie';


-- 2) Using the WHERE clause with the AND operator example

SELECT
	first_name,
	last_name
FROM 
	customer
WHERE
	first_name = 'Jamie'
	AND last_name = 'Rice';


-- 3) Using the WHERE clause with the OR operator example
SELECT * from customer;

SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name = 'Jamie'
	OR first_name = 'Maria'

-- 4) Using the WHERE clause with the IN operator example
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name IN ('Ann', 'Anne', 'Annie')

-- 5) Using the WHERE clause with the LIKE operator example
-- To find a string that matches a specified pattern
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name LIKE 'Ann%'

-- 6) Using the WHERE clause with the BETWEEN operator example
SELECT
	first_name,
	LENGTH(first_name) name_len
FROM
	customer
WHERE
	first_name LIKE 'B%'
	AND LENGTH(first_name) BETWEEN 3 
	AND 4
ORDER BY
	first_name

-- 7) Using the WHERE clause with the not equal operator (<>) example
SELECT
	first_name, last_name, COUNT(actor.actor_id) as ci
FROM
	actor
WHERE
	first_name LIKE 'M%'
	AND last_name != 'Mallik'
GROUP BY
	first_name,
	last_name
ORDER BY
	first_name


-- *********************PostgreSQL AND Operator*********************

-- 1) Basic PostgreSQL AND operator examples
SELECT false AND false AS result;

SELECT true AND false AS result;

SELECT true AND null AS result;

SELECT false AND false AS result;

SELECT false AND null AS result;

SELECT null AND null AS result;


-- 2) Using the AND operator in the WHERE clause

select * from film


SELECT
	title,
	length,
	rental_rate
FROM
	film
WHERE
	length>180
	AND rental_rate<1



-- *********************PostgreSQL OR Operator*********************
-- 1) Basic PostgreSQL OR operator examples

SELECT true OR true AS result;

SELECT true OR false AS result;

SELECT true OR null AS result;

SELECT false OR false AS result;

SELECT false OR null AS result;

SELECT null OR null AS result;

-- 2) Using the OR operator in the WHERE clause

SELECT
	title,
	rental_rate
FROM
	film
WHERE
	rental_rate = 0.99 OR
	rental_rate = 2.99 OR
	rental_rate = 4.99;


-- *********************PostgreSQL LIMIT*********************
-- Introduction to PostgreSQL LIMIT clause

SELECT
	rental_rate,
	count(film_id) as fc
FROM
	film
GROUP BY
	rental_rate
ORDER BY
	rental_rate;
	
-- 
SELECT
    release_year,
    ARRAY_AGG(title) AS titles,
    AVG(length) AS avg_length
FROM
    film
GROUP BY
    release_year
ORDER BY
    release_year;


-- 
SELECT
    title,
    release_year,
	length
FROM
    film
GROUP BY
   title, release_year, length
ORDER BY
    length;


-- 
SELECT
    length,
    COUNT(*) AS film_count
FROM
    film
GROUP BY
    length
ORDER BY
    length;

-- 
SELECT
	language_id,
    release_year,
    length,
    COUNT(length) AS film_count
FROM
    film
WHERE
	length < 50
GROUP BY
    language_id, release_year, length

ORDER BY
    language_id, release_year, length;

-- 
SELECT
	first_name,
	last_name,
	count(*) as fn
FROM
	actor
WHERE
	LENGTH(first_name) <= 6
GROUP BY
	first_name, last_name

ORDER BY
	fn DESC
LIMIT
	10;

-- 

-- 2) Using the LIMIT clause with the OFFSET clause example
SELECT
	*
FROM
	actor
LIMIT
	10
OFFSET
	5;

--
-- 3) Using LIMIT OFFSET to get top/bottom N rows

SELECT
	*
FROM
	actor
ORDER BY
	actor_id DESC
LIMIT
	10
OFFSET
	5;



-- 
-- *********************Introduction to PostgreSQL IN operator*********************
-- 
SELECT
	film_id,
	title
FROM
	film
WHERE
	film_id IN (10, 5, 3);


-- 
SELECT
	film_id,
	title
FROM
	film
WHERE
	film_id IN (10, 5, 3)
ORDER BY
	film_id DESC;

-- 
SELECT
	first_name,
	last_name
FROM
	actor
WHERE
	last_name IN ('Allen', 'Chase', 'Davos')
ORDER BY
	first_name;


-- 
SELECT
	payment_id,
	amount,
	payment_date
FROM
	payment
WHERE
	payment_date::date NOT IN ('2007-02-15', '2007-02-16');
	
-- 
SELECT
	payment_id,
	amount,
	payment_date
FROM
	payment
WHERE
	payment_date::date BETWEEN '2007-02-15' AND '2007-02-16';



-- *********************PostgreSQL BETWEEN*********************

-- 1) Using the PostgreSQL BETWEEN operator with numbers
SELECT
	payment_id,
	amount
FROM
	payment
WHERE
	payment_id BETWEEN 17503 AND 17513;

-- 2) Using the PostgreSQL NOT BETWEEN example

SELECT
	payment_id,
	amount
FROM
	payment
WHERE
	payment_id NOT BETWEEN 17503 AND 17505
ORDER BY
	payment_id;

-- 3) Using the PostgreSQL BETWEEN with a date range
SELECT
	payment_id,
	amount,
	payment_date
FROM
	payment
WHERE
	payment_date BETWEEN '2007-02-15' AND '2007-02-20' AND amount > 10.50
ORDER BY
	payment_date;


-- *********************PostgreSQL LIKE*********************
-- Introduction to PostgreSQL LIKE operator

-- Introduction to PostgreSQL LIKE operator

SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name LIKE '_en%';
	
-- 
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name LIKE 'Jen%';

-- PostgreSQL NOT LIKE examples

SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name like '_her%'
ORDER BY
	first_name;

-- *********************PostgreSQL IS NULL*********************

SELECT
  address,
  address2
FROM
  address
WHERE
  address2 IS NULL;

-- 
SELECT
  address,
  address2
FROM
  address
WHERE
  address2 IS NOT NULL;


-- *********************PostgreSQL Joins*********************
-- PostgreSQL inner join

 SELECT *
 FROM
 	basket_b;

SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM
	basket_a
INNER JOIN
	basket_b ON fruit_a = fruit_b



-- PostgreSQL left join
SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM
	basket_a
LEFT JOIN
	basket_b
ON
fruit_a = fruit_b;

SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM
	basket_a
LEFT JOIN
	basket_b
ON
	fruit_a = fruit_b
WHERE
	b IS null;



-- PostgreSQL right join
-- 
SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM
	basket_a
RIGHT JOIN
	basket_b
ON
	fruit_a = fruit_b;

-- 
SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM
	basket_a
RIGHT JOIN
	basket_b
ON
	fruit_a = fruit_b
WHERE
	fruit_a IS NULL;


-- PostgreSQL full outer join
SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM
	basket_a
FULL OUTER JOIN
	basket_b
ON
	fruit_a = fruit_b
WHERE
	fruit_a IS NOT NULL AND fruit_b IS NOT NULL
ORDER BY
	fruit_a DESC;


-- FULL - JOIN
SELECT
	a,
	fruit_a,
	b,
	fruit_b
FROM
	basket_a
FULL JOIN
	basket_b
ON
	fruit_a = fruit_b

-- *********************PostgreSQL Table Aliases*********************
-- 1) Basic PostgreSQL table alias example
SELECT 
	f.title
FROM
	film as f
ORDER BY
	f.title
LIMIT 5;


-- 2) Using table aliases in join clauses

SELECT
	c.customer_id,
	c.first_name,
	p.amount,
	p.payment_date
FROM
	customer AS c
INNER JOIN
	payment AS p
ON
	c.customer_id = p.customer_id
ORDER BY
	p.payment_date DESC;

-- 3) Using table aliases in self-join
SELECT
	f1.title as f1t,
	f2.title as f2t,
	f1.length
FROM
	film f1
INNER JOIN 
	film f2
ON
	f1.film_id != f2.film_id
	AND f1.length = f2.length




-- *********************PostgreSQL INNER JOIN*********************
-- 
-- 
SELECT
	customer.customer_id,
	customer.first_name,
	customer.last_name,
	payment.payment_date
FROM
	customer
INNER JOIN 
	payment
ON
	payment.customer_id = customer.customer_id
ORDER BY
	customer.first_name
LIMIT 1000;



-- 
SELECT
	customer.first_name,
	COUNT(customer.first_name) as cc
FROM
	customer
INNER JOIN
	payment
ON
	payment.customer_id = customer.customer_id
GROUP BY
	customer.first_name
HAVING COUNT(customer.first_name) > 20
ORDER BY
	cc DESC
