USE sakila; 

-- retorna a lista de filmes e suas categorias correspondentes. 

SELECT film.title AS Film, 
       category.name AS Category
FROM film
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
ORDER BY film.title ASC;

-- retorna a lista de todos os atores com o número filmes que cada ator participou. 
-- ordenada pelo numero de filmes, iniciando pelos atores que mais atuaram. 

SELECT actor.first_name AS First_Name, 
       actor.last_name AS Last_Name, 
       COUNT(film_actor.film_id) AS Number_Of_Films
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
GROUP BY actor.actor_id
ORDER BY Number_Of_Films DESC;

-- retorna  a lista de atores que atuaram em filmes com mais de duas horas de duração.
-- ordenada pelo numero de filmes que cada ator participou. 

SELECT actor.first_name AS First_Name, 
       actor.last_name AS Last_Name, 
       COUNT(film_actor.film_id) AS Number_Of_Films
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE film.length > 120
GROUP BY actor.actor_id
ORDER BY Number_Of_Films DESC;