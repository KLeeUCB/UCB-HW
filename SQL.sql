Use Sakila

Set sql_safe_updates = 0;

Select *
From actor;

-- 1a.
Select first_name, last_name
from actor;

-- 1b.
select concat(first_name, ' ', last_name) as "Actor Name" from actor;

-- 2a.
Select * From actor
Where first_name Like 'Joe%';

-- 2b.
Select * From actor
Where last_name Like '%GEN%';

-- 2c. (HELP)
Select * From actor
Where last_name Like '%LI%';
Group by 1
Order by 2 desc;

-- 2d. 
Select country_id, country
from country
Where country In ('Afghanistan', 'Bangladesh', 'China');

-- 3a. 
Select * From actor
Where first_name Like 'Joe%';

-- 3b.

-- 4a. 
Select last_name, count(*)
From actor
Group by last_name;

-- 4b. 
Select last_name, count(*)
From actor
Group by last_name
Having count(last_name) > 2;

-- 4c.
select concat(first_name, ' ', last_name) as "Actor Name" from actor;
UPDATE actor
SET Actor Name = 'GROUCHO WILLIAMS', Actor Name = 'HARPO WILLIAMS'
WHERE Actor Name = 1;

-- 4d.

-- 5a. 
Show create table address;

-- 6a. 
SELECT staff.first_name, staff.last_name, address.address
From address
INNER JOIN staff 
ON address.address_id=staff.address_id;

-- 6b.
SELECT staff.first_name, staff.last_name, payment.payment_date, Sum(payment.amount)
From payment
JOIN staff 
ON staff.staff_id=payment.staff_id
Where payment.payment_date between '2005-8-01 00:00:00' AND '2005-8-31 23:59:59'
Group by staff.first_name;

-- 6c.
SELECT film.title, film_actor.actor_id
FROM film
INNER JOIN film_actor ON film.film_id=film_actor.film_id;
Group by film.title;

-- 6d. 
SELECT film.title, count(inventory.inventory_id)
FROM film
INNER JOIN inventory ON film.film_id=inventory.film_id
Where title = 'Hunchback Impossible'
Group by title;

-- 6e. 
SELECT customer.first_name, customer.last_name, sum(payment.amount)
From payment
JOIN customer 
ON customer.customer_id=payment.customer_id
Group by last_name;

-- 7a.
SELECT film.title, film.language_id
From language
JOIN film 
ON film.language_id=language.language_id
Where title like 'K%' or title like 'Q%';

-- 7b.
SELECT actor.actor_id, actor.first_name, actor.last_name
FROM actor
INNER JOIN film_actor ON film_actor.actor_id=actor.actor_id
INNER JOIN film ON film.film_id=film_actor.film_id
Where title = 'Alone Trip'
Group by first_name, last_name;

-- 7c. 
SELECT customer.first_name, customer.last_name, customer.email
FROM customer
INNER JOIN address ON customer.address_id=address.address_id
INNER JOIN city ON address.city_id=city.city_id
INNER JOIN country ON city.country_id=country.country_id
Where country = 'Canada'
Group by first_name, last_name;

-- 7d. 
SELECT film.title
FROM film
INNER JOIN category ON film.film_id=film_category.film_id
INNER JOIN film_category ON category.category_id=film_category.category_id
Where category.name = 'family';

-- 7e. 
SELECT rental.inventory_id, count(film.film_id)
FROM rental
INNER JOIN inventory ON rental.inventory_id=inventory.inventory_id
INNER JOIN film ON film.film_id=inventory.film_id
Group by 1
Order by 2 desc;

-- 7f. 
SELECT store.store_id, sum(payment.amount)
FROM payment
INNER JOIN customer ON payment.customer_id=customer.customer_id
INNER JOIN store ON customer.store_id=store.store_id
Group by store_id;

-- 7g. 
SELECT store.store_id, city.city_id, city.country_id
FROM city
INNER JOIN store ON customer.store_id=address.store_id
INNER JOIN address ON city.city_id=address.city_id
INNER JOIN customer ON payment.customer_id=customer.customer_id
Group by store_id;

-- 7h.




