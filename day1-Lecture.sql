-- Hello World SQL Query, SELECT ALL records from the actor table

SELECT *
FROM actor; 

-- Query for first_name and last_name in the actor table
SELECT first_name, last_name
FROM actor; 

-- Query for a first_name that equals Nick using the WHERE clause
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Query for a first_name that is equal to Nick using the LIKE and WHERE clauses 
SELECT first_name, last_name 
FROM actor
WHERE first_name LIKE 'Nick';

-- Query for all first_names that start with a N using the LIKE and WHERE clauses 
-- Using a WILDCARD character
SELECT first_name, last_name
FROM actor 
WHERE first_name LIKE 'N%';

-- Query for all first_name values that start with K and have 2 letters directly following 
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__';

-- Query for all first_name values that start with K with 2 characters directly following, but 
-- Including other character if available -- COMBINE: WILDCARD and the underscore characters
SELECT first_name, last_name 
FROM actor 
WHERE first_name LIKE 'K___%';

-- add the 'n' after the wild card means it ends w/ an 'n'
SELECT first_name, last_name
FROM actor 
WHERE first_name LIKE 'K__%n';

-- Comparing operators in SQL: 
-- Greater Than (>) -- Less than (<)
-- Greater OR Equal to (>=) -- Less OR Equal to (<=)
-- Not Equal (<>)

-- Explore the data with SELECT All Query
SELECT *
FROM payment;
-- Query for data that shows customers who paid 
-- an amount that was GREATER than $2
SELECT customer_id, amount
FROM payment
WHERE amount > 2.00;

-- Query for data that shows customers who paid 
-- an amount that was LESS than $7.99
SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

-- Query for data that shows customers who paid 
-- an amount LESS than or EQUAL to $7.99
SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99; 

-- Query for data that shows customers who paid
-- an amount GREATER than or EQUAL to $2.00
-- Doing so in ascending order 

SELECT customer_id, amount 
FROM payment 
WHERE amount >= 2.00
ORDER BY amount ASC;

-- Query for data that shows customers who paid
-- An amount between $2.00 and and 7.99
-- Using the BETWEEN with the AND clause

SELECT customer_id, amount
FROM payment 
WHERE amount BETWEEN 2.00 AND 7.99;

-- Query for data that shows customers who paid 
-- an amount NOT EQUAL to $0.00
-- Order the results in DESCENDING order 

SELECT customer_id, amount
FROM payment
WHERE amount<> 0.00
ORDER BY amount DESC;

-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()

-- Query to display sum of amounts paid that are greater than $5.99

SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the average of amounts paid that are greater than %.599
SELECT AVG(amount)
FROM payment 
WHERE amount > 5.99;

-- Query to display the count of amounts paid that are greater than $5.99
-- this is counting the occurences of "5.99". It will also count the doubles.
SELECT COUNT(amount)
FROM payment 
WHERE amount > 5.99;

-- Query to display the DISTINCT count of amounts paid that are greater than 
-- $5.99

SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99; 

-- Query to display the lowest amount that is greater than 7.99
SELECT MIN(amount) AS Min_Num_Payments
FROM payment
WHERE amount > 7.99; 

-- Query to display the highest amount that is greater than 7.99
SELECT MAX(amount) AS Max_Num_Payments
FROM payment
WHERE amount > 7.99; 

-- Using The Group By Clause 
-- Query to display all amounts above 7.99 (To display what the Group By will do)
SELECT amount
FROM payment
WHERE amount = 7.99;

-- Query to display customer_ids with the summed amounts for each customer 
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id;

-- Query to display the count of amounts 7.99
-- WHILE ALSO displaying the actual amount as well
-- Using the Group By Clause to produce the count

SELECT amount, COUNT(amount)
FROM payment
WHERE amount = 7.99
GROUP BY amount
ORDER BY amount DESC;
-- Query to display customer_ids
SELECT customer_id, SUM(amount)
FROM payment
WHERE amount = 7.99
GROUP BY customer_id
ORDER BY customer_id DESC;

-- Query to display summed amounts for each customer_id
-- This is a separate example..which is very similar in 
-- The result given from the previous example 

SELECT customer_id, amount
FROM payment
GROUP BY amount, customer_id
ORDER BY customer_id DESC;

-- SQL  HAVING CLAUSE

-- Query to display customer-ids that show up more than 5 times (if available)
-- Group By the customer's email
SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE 'j__.w%'
GROUP BY email 
HAVING COUNT (customer_id) > 0; 

-- You can't do the following. the aggregate functions are not allowed in the WHERE clause
-- SELECT COUNT(customer_id), email
-- FROM customer
-- WHERE COUNT(customer_id) > 0 AND email LIKE 'j__.w%'
-- GROUP BY email; 
