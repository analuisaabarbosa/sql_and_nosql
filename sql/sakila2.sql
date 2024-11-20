USE sakila;

-- Consultas para contar os registros de cada query.

SELECT COUNT(*) 
FROM (
    SELECT film.title AS Film, 
           category.name AS Category
    FROM film
    INNER JOIN film_category ON film.film_id = film_category.film_id
    INNER JOIN category ON film_category.category_id = category.category_id
    ORDER BY film.title ASC
) AS temp;

SELECT COUNT(*)
FROM (
    SELECT actor.first_name AS First_Name, 
       actor.last_name AS Last_Name, 
       COUNT(film_actor.film_id) AS Number_Of_Films
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
GROUP BY actor.actor_id
ORDER BY Number_Of_Films DESC
) AS temp;

SELECT COUNT(*)
FROM (
    SELECT actor.first_name AS First_Name, 
           actor.last_name AS Last_Name, 
           COUNT(film_actor.film_id) AS Number_Of_Films
    FROM actor
    JOIN film_actor ON actor.actor_id = film_actor.actor_id
    JOIN film ON film_actor.film_id = film.film_id
    WHERE film.length > 120
    GROUP BY actor.actor_id
    ORDER BY Number_Of_Films DESC
) AS temp;