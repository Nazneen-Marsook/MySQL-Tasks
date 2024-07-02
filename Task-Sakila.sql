USE sakila;

-- 1. Display the first and last name of each actor in a single column in upper case letters in alphabetic order. 
--    Name the column Actor Name.

SELECT UPPER(CONCAT(first_name, ' ', last_name))
AS Actor_name
FROM actor
ORDER BY Actor_name;

-- 2.  Find all actors whose last name contain the letters GEN:

SELECT CONCAT(first_name, ' ', last_name) Actor_Name
FROM actor
WHERE last_name LIKE '%GEN%';

-- 3. Using IN, display the country_id and country columns of the following countries:
--    Afghanistan, Bangladesh, and China:

SELECT country_id, country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

-- 4.  List the last names of actors, as well as how many actors have that last name.

SELECT last_name, COUNT(*) No_of_Actors
FROM Actor
GROUP BY last_name
ORDER BY last_name;

-- 5. List last names of actors and the number of actors who have that last name, 
--          but only for names that are shared by at least two actors

SELECT last_name, COUNT(*) No_of_Actors
FROM Actor
GROUP BY last_name
HAVING No_of_Actors >= 2
ORDER BY last_name;

-- 6. The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS. 
--    Write a query to fix the record.

SELECT * FROM Actor
WHERE first_name = 'GROUCHO' AND last_name = 'WILLIAMS';

UPDATE Actor
SET first_name = 'HARPO'
WHERE actor_id = 172;

SELECT * FROM Actor
WHERE actor_id = 172;

-- 7.  Use JOIN to display the first and last names, as well as the address, of each staff member.
--     Use the tables staff and address:

SELECT s.first_name, s.last_name, a.address
FROM staff s
LEFT JOIN address a
USING (address_id);

-- 8. List each film and the number of actors who are listed for that film. 
--    Use tables film_actor and film. Use inner join.

SELECT f.title Film, COUNT(fa.actor_id) No_of_Actors
FROM film f
INNER JOIN film_actor fa
USING (film_id)
GROUP BY f.film_id;

-- 9.  How many copies of the film Hunchback Impossible exist in the inventory system?

SELECT COUNT(inventory_id) No_of_Copies
FROM inventory
WHERE film_id = (SELECT film_id FROM FILM 
WHERE TITLE = 'Hunchback Impossible');

-- 10. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
--     List the customers alphabetically by last name

SELECT CONCAT(c.first_name, ' ', c.last_name) Name,
SUM(p.amount) Amount_Paid
FROM customer c
INNER JOIN payment p USING (customer_id)
GROUP BY customer_id
ORDER BY c.last_name;

-- 11. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. 
--     As an unintended consequence, films starting with the letters K and Q have also soared in popularity. 
--     Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.

SELECT title FROM film
WHERE title LIKE 'K%' OR title LIKE 'Q%'
AND language_id = (SELECT language_id
FROM language
WHERE name='English');

-- 12. Use subqueries to display all actors who appear in the film Alone Trip.

SELECT CONCAT(first_name, ' ', last_name) Actors
FROM actor
WHERE actor_id IN (SELECT actor_id FROM film_actor
WHERE film_id=(SELECT film_id
FROM film
WHERE title = 'Alone Trip')) ;

-- 13. You want to run an email marketing campaign in Canada, 
--            for which you will need the names and email addresses of all Canadian customers. 
--     Use joins to retrieve this information.

SELECT 
CONCAT(c.first_name, ' ', c.last_name) Customer_Name,
c.email Email
FROM customer c
INNER JOIN address a 
ON (c.address_id = a.address_id)
INNER JOIN city ct 
ON (a.city_id = ct.city_id)
INNER JOIN country cy 
ON (ct.country_id = cy.country_id)
WHERE country = 'Canada';

-- 14. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
--     Identify all movies categorized as family films.

SELECT title Family_Movies FROM film
WHERE film_id IN (select film_id from film_category
where category_id = (SELECT category_id
FROM category
WHERE name = 'Family'));

-- 15. Create a Stored procedure to get the count of films in the input category (IN category_name, OUT count)

DELIMITER $$
CREATE PROCEDURE No_of_Films(
IN category_name VARCHAR(50),
OUT Film_Count INT
)
BEGIN 
SELECT COUNT(film_id)
INTO Film_Count
FROM film_category
WHERE category_id = (SELECT category_id
FROM category
WHERE name = category_name);
END $$
DELIMITER ;

CALL No_of_Films('Family', @Film_Count);

SELECT @Film_Count;

-- 16. Display the most frequently rented movies in descending order.

SELECT f.title Movie, COUNT(i.inventory_id) Rental_Count
FROM rental r 
JOIN inventory i USING (inventory_id) 
JOIN film f USING (film_id)
GROUP BY film_id
ORDER BY Rental_Count DESC;

-- 17. Write a query to display for each store its store ID, city, and country.

SELECT s.Store_id,
ct.City,
cy.Country
FROM store s
JOIN address a USING (address_id)
JOIN city ct USING (city_id)
JOIN country cy USING (country_id);

-- 18.  List the genres and its gross revenue. 

SELECT c.name Genre,
SUM(p.amount) Gross_Revenue
FROM category c
JOIN film_category fc USING (category_id)
JOIN inventory i USING (film_id)
JOIN rental r USING(inventory_id)
JOIN payment p USING (rental_id)
GROUP BY c.name
ORDER BY Gross_Revenue DESC;

-- 19. Create a View for the above query(18)

CREATE VIEW Genre_Revenue_Calc AS
SELECT c.name Genre,
SUM(p.amount) Gross_Revenue
FROM category c
JOIN film_category fc USING (category_id)
JOIN inventory i USING (film_id)
JOIN rental r USING(inventory_id)
JOIN payment p USING (rental_id)
GROUP BY c.name
ORDER BY Gross_Revenue DESC;

SHOW FULL TABLES;

-- 20. Select top 5  genres in gross revenue view.

SELECT * FROM Genre_Revenue_Calc
LIMIT 5;

