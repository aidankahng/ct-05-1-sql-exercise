--1. How many actors with last name Wahlberg?
SELECT count(*) AS count_wahlbergs
FROM actor
WHERE last_name = 'Wahlberg';
-- count_wahlbergs = 2

--2. How many payments were made between $3.99 and $5.99?
SELECT count(*) AS num_payments
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
--num_payments = 5607

--3. What films have exactly 7 copies? (search in inventory)
SELECT count(*) AS num_films_with_7_copies  --using a subquery to count the rows
	FROM (SELECT film_id, count(*) AS num_copies
	FROM inventory 
	GROUP BY film_id
	HAVING count(*) = 7
	ORDER BY num_copies) AS second_table;

SELECT film_id, count(*) AS num_copies
FROM inventory 
GROUP BY film_id
HAVING count(*) = 7
ORDER BY num_copies;

-- Answer: There are 116 films with exactly 7 copies in inventory


--4. How many customers have the first name ‘Willie’?
SELECT count(*)
FROM customer
WHERE first_name = 'Willie';
-- Answer: 2


--5. What store employee (get the id) sold the most rentals 
-- (use the rental table)?
SELECT staff_id, count(*) AS num_rentals
FROM rental
GROUP BY staff_id
ORDER BY num_rentals DESC 
LIMIT 1;
-- Answer: Staff id 1


--6. How many unique district names are there?
SELECT COUNT(DISTINCT district)
FROM address;
-- Answer: 378 distinct districts


--7. What film has the most actors in it? 
--(use film_actor table and get film_id)
SELECT film_id , count(DISTINCT actor_id) AS num_actors
FROM film_actor
GROUP BY film_id
ORDER BY num_actors DESC;
-- Answer: film_id = 508 had the most actors with 15


--8. From store_id 1, how many customers have a last name ending 
-- with ‘es’? (use customer table)
SELECT count(*)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';
-- Answer: 13


--9. How many payment amounts (4.99, 5.99, etc.) 
-- had a number of rentals above 250 for 
-- customers with ids between 380 and 430? 
-- (use group by and having > 250)
SELECT amount, count(*)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING count(*) > 250;
-- Answer: 3


--10. Within the film table, how many rating categories are there? 
-- And what rating has the most movies total?
SELECT rating, count(*)
FROM film
GROUP BY rating
ORDER BY rating;
-- Answer: 5 categories, PG-13 has the most movies with 223.




