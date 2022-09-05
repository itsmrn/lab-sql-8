use sakila;
--- Rank films by length (filter out the rows with nulls or zeros in length column). Select only columns title, length and rank in your output.
select * from film;
select title, length, rank() over(order by length) from film;

-- Rank films by length within the rating category (filter out the rows with nulls or zeros in length column). In your output, only select the columns title, length, rating and rank.
select * from film;
select title, length, rating, rank() over(order by length) from film;

-- How many films are there for each of the categories in the category table? Hint: Use appropriate join between the tables "category" and "film_category".
select * from category;
select * from film;
select * from film_category;
select count(*),name from category inner join film_category on category.category_id=film_category.category_id group by name;

-- Which actor has appeared in the most films? Hint: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.
select * from actor;
select * from film_actor;
select count(*), last_name from actor inner join film_actor on actor.actor_id=film_actor.actor_id group by last_name order by count(*) desc; 

-- Which is the most active customer (the customer that has rented the most number of films)? Hint: Use appropriate join between the tables "customer" and "rental" and count the rental_id for each customer.
select * from customer;
select * from rental;
select count(*), last_name from customer inner join rental on customer.customer_id=rental.customer_id group by last_name order by count(*) desc; 
