SELECT * FROM sakila.actor;
SELECT * FROM sakila.address;
SELECT * FROM sakila.category;
SELECT * FROM sakila.city;
SELECT * FROM sakila.country;
SELECT * FROM sakila.customer;
SELECT * FROM sakila.film;
SELECT * FROM sakila.film_actor;
SELECT * FROM sakila.film_category;
SELECT * FROM sakila.film_text;
SELECT * FROM sakila.inventory;
SELECT * FROM sakila.language;
SELECT * FROM sakila.payment;
SELECT * FROM sakila.rental;
SELECT * FROM sakila.staff;
SELECT * FROM sakila.store;

SELECT 
	act.actor_id,
    CONCAT(act.first_name, ' ', act.last_name) AS full_name,
    cust.email,
    film.title
FROM sakila.actor AS act
	JOIN sakila.customer AS cust
    ON act.first_name = cust.first_name
    JOIN sakila.film_actor AS fact
    ON act.actor_id = fact.actor_id
    JOIN sakila.film AS film
    ON fact.film_id = film.film_id
ORDER BY actor_id;

SELECT 
	title,
    rating,
    length
FROM sakila.film AS film
ORDER BY length DESC;

SELECT CONCAT(first_name, ' ', last_name) AS actor_full_name
FROM sakila.actor
WHERE first_name LIKE 'a%';

SELECT 
	CONCAT(first_name, ' ', last_name) AS active_customer,
    active
FROM sakila.customer
WHERE active = 1;
    
SELECT 
	title,
    rental_rate
FROM sakila.film AS film
WHERE rental_rate > 4;

SELECT 
	title,
    replacement_cost
FROM sakila.film AS film
ORDER BY replacement_cost DESC, title
LIMIT 10;

SELECT 
	CONCAT(cust.first_name, ' ', cust.last_name) AS  customer,
    city.city,
    country.country
FROM sakila.customer AS cust
	JOIN sakila.address AS addr
    ON cust.address_id = addr.address_id
    JOIN sakila.city AS city
    ON addr.city_id = city.city_id
    JOIN sakila.country AS country
    ON city.country_id = country.country_id;
    
SELECT 
	film.title,
    CONCAT(act.first_name, ' ', act.last_name) AS actor_name
FROM sakila.actor AS act
	JOIN sakila.film_actor AS fact
    ON act.actor_id = fact.actor_id
    JOIN sakila.film AS film
    ON fact.film_id = film.film_id
ORDER BY title;

SELECT 
	CONCAT(stf.first_name, ' ', stf.last_name) AS  staff,
    addr.address AS store_address,
    city.city,
    country.country
FROM sakila.staff AS stf
	JOIN sakila.store AS str
    ON stf.store_id = str.store_id
	JOIN sakila.address AS addr
    ON str.address_id = addr.address_id
    JOIN sakila.city AS city
    ON addr.city_id = city.city_id
    JOIN sakila.country AS country
    ON city.country_id = country.country_id;
    
SELECT 
	film.title,
    cat.name
FROM sakila.film AS film
	JOIN sakila.film_category AS fcat
    ON film.film_id = fcat.film_id
    JOIN sakila.category AS cat
    ON fcat.category_id = cat.category_id
WHERE cat.name = 'Action'
ORDER BY title;

SELECT 
	rent.rental_id,
    CONCAT(cust.first_name, ' ', cust.last_name) AS customer_name,
    film.title
FROM sakila.rental AS rent
	JOIN sakila.inventory AS inv
    ON rent.inventory_id = inv.inventory_id
    JOIN sakila.customer AS cust
    ON rent.customer_id = cust.customer_id
    JOIN sakila.film AS film
    ON inv.film_id = film.film_id
ORDER BY rental_id;

SELECT
	cat.name, COUNT(title) AS film_quantity
FROM sakila.film AS film
	JOIN sakila.film_category AS fcat
    ON film.film_id = fcat.film_id
    JOIN sakila.category AS cat
    ON fcat.category_id = cat.category_id
GROUP BY cat.name
ORDER BY COUNT(title) DESC;
    