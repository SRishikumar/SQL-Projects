use sakila;

-- TASK 1
select * from actor;
-- OR
select first_name, last_name, actor_id, last_update from actor;

-- TASK 2
-- A
select concat(first_name,' ',last_name) as 'actors_full_name' from actor;

-- B
select first_name, count(first_name) as 'count_of_first_name' from actor group by first_name;

-- C
select last_name, count(last_name) as 'count_of_last_name' from actor group by last_name;

-- TASK 3
select rating, count(title) as 'count_of_movies' from film group by rating;

-- TASK 4
select rating, avg(rental_rate) as 'average_rental_rate' from film group by rating;

-- TASK 5
select * from film;
-- A
select title, replacement_cost from film where replacement_cost<9;

-- B
select title, replacement_cost from film where replacement_cost between 15 and 20;

-- c
select title, replacement_cost, rental_rate  from film
 where replacement_cost=(select max(replacement_cost) from film)
and rental_rate=(select min(rental_rate) from film);

--  TASK 6
select title as 'movies', count(film_actor.actor_id) as 'no_of_actors' from 
film join film_actor 
on film.film_id = film_actor.film_id 
group by title;

-- TASK 7
select title from film where title like 'k%' or  title like 'q%';
 
--  TASK 8
select first_name, last_name, title from
film join film_actor join actor
on film.film_id = film_actor.film_id and film_actor.actor_id = actor.actor_id
where title= 'agent truman';

-- TASK 9
select title as 'movie', name as 'category_name' from
film join film_category join category
on film.film_id = film_category.film_id and film_category.category_id = category.category_id
where name ='family';

-- TASK 10
select title , count(rental_id) as 'count_of_rental' from
film join inventory join rental
on film.film_id = inventory.film_id and inventory.inventory_id = rental.inventory_id
group by title order by count_of_rental desc;

-- TASK 11
select name, count(name) as 'count_of_category',
 avg(replacement_cost)-avg(rental_rate) as 'average_difference_(RC_and_RR)' 
from category join film_category join film
on category.category_id = film_category.category_id and film_category.film_id = film.film_id
 group by name having avg(replacement_cost)-avg(rental_rate)>15;
 
--  TASK 12
select name as 'category_name', count(title) as 'no_of_movies' from
category join film_category join film
on category.category_id = film_category.category_id and film_category.film_id = film.film_id
group by category_name having no_of_movies between 60 and 70 order by no_of_movies;
