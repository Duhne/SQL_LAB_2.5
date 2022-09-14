-- dataV3_lesson_2.5_lab
-- 1. Select all the actors with the first name ‘Scarlett’.
SELECT actor_id, last_name FROM sakila.actor
WHERE first_name = 'Scarlett';

-- 2. How many films (movies) are available for rent and how many films have been rented? ---------
SELECT COUNT(DISTINCT inventory.film_id) FROM sakila.inventory;
SELECT COUNT(rental_id) FROM sakila.rental;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT film_id, title, MIN(length) AS 'min_duration' FROM sakila.film;
SELECT film_id, title, MAX(length) AS 'max_duration' FROM sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT concat(floor((AVG(length))/60), ':', round((AVG(length))%60,0)) AS 'average_length' FROM sakila.film;   -- floor gives the int, like rounding down

-- 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM sakila.actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(rental_date) , MIN(rental_date)) FROM sakila.rental;   -- Didn´t work so copied the dates

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, monthname(rental_date) as 'month', dayname(rental_date) as 'weekday' FROM sakila.rental
LIMIT 20;

SELECT GETDATE() rental_date, FORMAT(GETDATE(),'dddd') AS 'Day Name' FROM sakila.rental;


-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, 
CASE
WHEN weekday(rental_date) then 'weekday'
ELSE 'weekend'
END AS 'day_type'
FROM sakila.rental;

-- 9. Get release years.
SELECT title, release_year FROM sakila.film;

-- 10. Get all films with ARMAGEDDON in the title.
SELECT * FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.
SELECT * FROM sakila.film
WHERE title LIKE '%APOLLO';

-- 12. Get 10 the longest films.
SELECT film_id, title, length AS 'Longest 10 Films' FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- 13. How many films include Behind the Scenes content?
SELECT COUNT(special_features) FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%';