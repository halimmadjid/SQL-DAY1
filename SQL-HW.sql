-- How many actors are there with the last name "Wahlberg?"
--Answer: 2
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- How many payments were made between $3.99 and $5.99
--Answer: 5607

SELECT COUNT(amount)
FROM payment 
WHERE amount BETWEEN 3.99 AND 5.99;

-- What film does the store have the most of? Search in Inventory
-- Answer: 193

SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(*)DESC;

-- How many customers have the last name 'William'?
-- Answer: 0

SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'William';

-- What store employee (get the id) sold the most rentals? 
-- Answer: Employee "1" with 8040 rentals

SELECT COUNT (staff_id)
FROM rental
GROUP BY staff_id
ORDER BY staff_id;


-- How many different district names are there? 
-- Answer: 378
SELECT COUNT(district)
FROM address
GROUP BY district
ORDER BY COUNT(*) DESC;


-- What film has the most actors in it? (use film_actor table and get film_id)
-- Answer: 508

SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(*) DESC;


-- From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- Answer: 21

SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es';


-- How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 
-- for customers  with ids between 380 and 430? (use group by and having > 250) 
-- Answer: ????????

SELECT COUNT(payment)
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY payment
HAVING COUNT(payment) > 250;


-- Within the film table, how many rating categories are there? And what rating has the most  movies total?
-- Answer: 5 Rating Categories / PG-13 has the most movies total

SELECT COUNT(rating)
FROM film
GROUP BY rating 
ORDER BY COUNT(*) DESC;

SELECT rating, COUNT(description)
FROM film
GROUP BY rating
ORDER BY COUNT(*)DESC; 
