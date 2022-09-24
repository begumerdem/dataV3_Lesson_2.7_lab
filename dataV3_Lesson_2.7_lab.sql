-- dataV3_Lesson_2.7_lab
-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT * FROM sakila.category;
SELECT * FROM sakila.film_category;

SELECT count(f.film_id) as 'film_per_category', c.name
FROM sakila.category c
JOIN sakila.film_category f
ON c.category_id = f.category_id
GROUP BY c.name;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT sum(p.amount) as 'Total_amount', s.staff_id
FROM sakila.staff s
JOIN sakila.payment p
ON s.staff_id = p.staff_id
where year(payment_date) = 2005 and month(payment_date) = 8
GROUP BY s.staff_id;

-- 3. Which actor has appeared in the most films?
SELECT count(f.film_id) as 'Total_films', a.first_name, a.last_name
FROM sakila.film_actor f
JOIN sakila.actor a
ON f.actor_id = a.actor_id
GROUP BY a.first_name, a.last_name -- all non num in group by 
order by count(f.film_id) desc;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT first_name, last_name, count(rental_id) as 'Total_rents'
FROM sakila.customer c
JOIN sakila.rental r using (customer_id)
GROUP BY first_name, last_name 
order by count(rental_id) desc;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address
FROM sakila.staff
JOIN sakila.address using (address_id)
GROUP BY first_name, last_name, address;

-- 6. List each film and the number of actors who are listed for that film.
SELECT title, count(actor_id) as num_of_actors
FROM sakila.film_actor
JOIN sakila.film using (film_id)
GROUP BY title;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT first_name, last_name, sum(amount) as total_payment
FROM sakila.customer
JOIN sakila.payment using (customer_id)
GROUP BY first_name, last_name
order by last_name asc;

-- 8. List number of films per category.
SELECT name as category_name, count(film_id) as num_of_films
FROM sakila.film_category
JOIN sakila.category using (category_id)
GROUP BY name
order by count(film_id) desc;
