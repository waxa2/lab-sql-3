use sakila;
-- 1. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT(last_name)) as diff_surname_amount
FROM actor;

-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(DISTINCT(language_id))
FROM film;

-- 3. How many movies were released with "PG-13" rating?
SELECT COUNT(DISTINCT(film_id))
FROM film
WHERE rating='PG-13';

-- 4. Get 10 the longest movies from 2006.
SELECT title
FROM film
WHERE release_year=2006
ORDER BY length DESC
LIMIT 10;

-- 5. How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(max(rental_date),min(rental_date)) as operating_days
FROM rental;

-- 6. Show rental info with additional columns month and weekday. Get 20.
SELECT *, MONTH(rental_date) month , WEEKDAY(rental_date) as weekday
FROM rental
ORDER BY month asc
LIMIT 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT weekday(rental_date),
CASE
WHEN weekday(rental_date) <5 THEN 'workday'
ELSE 'weekend'
END AS 'day_type'
FROM rental
ORDER BY weekday(rental_date) DESC;

-- 8. How many rentals were in the last month of activity?
SELECT COUNT(rental_date)
FROM rental
WHERE rental_date regexp '2006-02'
ORDER BY rental_date desc;