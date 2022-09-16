use sakila;

#List the number of films per category
select * from category,film_category;
select * from film_category;

select count(film_category.category_id), category.name 
from film_category
inner join category on category.category_id = film_category.category_id
group by category.name;

#Display the first and the last names, as well as the address, of each staff member.
select * from staff;
select * from address;

select staff.first_name,staff.last_name,staff.address_id
from staff
join address
on staff.address_id =address.address_id
group by staff.first_name,staff.last_name;

#Display the total amount rung up by each staff member in August 2005.
select * from payment;
select * from staff;

select staff.first_name,staff.last_name, sum(payment.amount)
from staff
inner join payment
on staff.staff_id = payment.staff_id
where month(payment.payment_date)
group by staff.first_name,staff.last_name;

#List all films and the number of actors who are listed for each film.
select * from film;
select * from film_actor;

select film.film_id,film.title,count(film_actor.actor_id)
from film
inner join film_actor
on film.film_id = film_actor.film_id
group by film.title;

#Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select * from payment;
select * from customer;

select customer.first_name,customer.last_name,sum(payment.amount)
from customer
inner join payment
on customer.customer_id = payment.customer_id
group by customer.first_name,customer.last_name
order by customer.last_name;

