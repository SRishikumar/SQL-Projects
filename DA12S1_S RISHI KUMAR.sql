use sakila ;

-- TASK 1--  
select concat(first_name,"",last_name) as 'actors_full_name' from actor ;

-- TASK 2.1 -- 
select first_name, count(first_name) as 'Count_of_first_names' from actor group by first_name ;
-- TASK 2.2 --  
select first_name, count(first_name) as 'Count_of_first_name' from actor group by first_name 
having count(first_name)=1 ;

-- TASK 3.1-- 
select last_name, count(last_name) as 'Count_of_last_name' from actor group by last_name 
order by Count_of_last_name desc ;
-- TASK 3.2-- 
select last_name, count(last_name) as 'count_of_last_name' from actor group by last_name 
having count_of_last_name = 1 ;

-- TASK 4.1-- 
select * from film ; 
select title, rating from film where rating='R' ;
-- TASK 4.2-- 
select title, rating from film where rating !='R' ;
-- TASK 4.3-- 
select title, name from film join film_category join category 
on film.film_id=film_category.film_id and film_category.category_id = category.category_id
where name= 'Children' ;

-- TASK 5.1-- 
select title , replacement_cost from film where replacement_cost<= 11;
-- TASK 5.2-- 
select title , replacement_cost from film where replacement_cost between 11 and 20 ;
-- TASK 5.3-- 
select title, replacement_cost from film order by replacement_cost desc ;

-- TASK 6--
select title , count(actor.actor_id) as 'count_of_actors' from film join film_actor join actor
 on film.film_id = film_actor.film_id and film_actor.actor_id = actor.actor_id 
 group by title order by count_of_actors desc limit 3;
 
 -- TASK 7-- 
 select title from film where title like 'k%' or title like 'q%' ;
 
 -- TASK 8-- 
 select first_name, last_name, title from film join film_actor join actor
 on film.film_id = film_actor.film_id and film_actor.actor_id = actor.actor_id 
 where title='Agent Truman';
 
 -- TASK 9-- 
 select title, name from film join film_category join category 
on film.film_id=film_category.film_id and film_category.category_id = category.category_id
where name= 'Family' ;

-- TASK 10.1--
select  rating , max(rental_rate) as 'Maximum_rental_rate', min(rental_rate) as 'Minimum_rental_rate',
 avg(rental_rate) as 'Average_rental_rate' from film group by rating order by Average_rental_rate desc;
 -- TASK 10.2-- 
 select title , count(rental_id) as 'Count_of_rentals' from 
 film join inventory join rental
 on film.film_id = inventory.film_id and inventory.inventory_id = rental.inventory_id
 group by title order by Count_of_rentals desc ;
 
 -- TASK 11--
 select name, count(name) as 'count_of_category',avg(replacement_cost) as 'Average_replacement_cost',
 avg(rental_rate) as 'Average_rental_rate',avg(replacement_cost)-avg(rental_rate) as 'average_difference'
 from category join film_category join film 
 on category.category_id = film_category.category_id and film_category.film_id = film.film_id
 group by name having avg(replacement_cost)-avg(rental_rate) > 15;
 
 -- TASK 12-- 
 select name, count(title) as 'Number_of_movies' 
 from category join film_category join film
 on category.category_id = film_category.category_id and film_category.film_id =film.film_id
 group by name having  Number_of_movies > 70 ;
 
 -- EXTRA--
 
 -- TASK 13--
 -- getting the details of incative customers-- 
 select * from customer where active=0;
 
 -- TASK 14--
 -- Store having the highest no of inactive customers-- 
select store_id,count(active) from customer where active=0 group by store_id;

-- TASK 15--
-- The movies under animation category--  
select title, name from film join film_category join category 
on film.film_id=film_category.film_id and film_category.category_id = category.category_id
where name= 'animation' ;

-- TASK 16--
-- Genre wise count of movies--
select count(title) as 'no_of_movies', name as 'genre',sum(rental_rate) from
 film join film_category join category
 on film.film_id = film_category.film_id and film_category.category_id = category.category_id
 group by name order by no_of_movies desc;
 
-- TASK 17--
-- Total sales made by each movie--  
 select sum(amount) as 'total_sales_amount', title as 'movies' from
film join inventory join rental join payment
on film.film_id = inventory.film_id and inventory.inventory_id = rental.inventory_id 
and rental.rental_id = payment.rental_id
group by movies order by total_sales_amount desc;

