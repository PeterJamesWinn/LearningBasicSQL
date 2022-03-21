

-- Create a view definition that can be used by the following query to generate the given 
--  results:


use sakila;


drop view film_ctgry_actor;
create view film_ctgry_actor
(category_name, title, first_name, last_name
) AS
select
  category.name, film.title, actor.first_name, actor.last_name
from category
   inner join film_category
      on category.category_id = film_category.category_id
   inner join film 
      on film_category.film_id = film.film_id
   inner join film_actor 
      on film.film_id = film_actor.film_id
   inner join  actor
      on film_actor.actor_id = actor.actor_id;



select category_name, title, first_name, last_name
from film_ctgry_actor
where last_name = 'FAWCETT';

-- The film rental company manager would like to have a report that includes the name of 
-- every country, along with the total payments for all customers who live in each country. 
-- Generate a view definition that queries the country table and uses a scalar subquery to 
-- calculate a value for a column named tot_payments

--  country total_payments_all_customers

drop view country_payments;
create view country_payments
(country, total_payments_all_customers
) AS
select
  country, sum(amount) 
from country
   inner join city
      on country.country_id = city.country_id
   inner join address 
      on address.city_id = city.city_id
   inner join customer 
      on customer.address_id = address.address_id
   inner join  payment
      on payment.customer_id = customer.customer_id
   group by country.country_id order by country.country_id asc;  
  
  select * from country_payments;
   
   
   -- partition command can also do it, but not as neat since it retains every row instead of grouping identical country entries into one row:
drop view country_payments;

create view country_payments
(country, total_payments_all_customers
) AS
select
  country, sum(amount) over (partition by country.country_id)
from country
   inner join city
      on country.country_id = city.country_id
   inner join address 
      on address.city_id = city.city_id
   inner join customer 
      on customer.address_id = address.address_id
   inner join  payment
      on payment.customer_id = customer.customer_id;  
      
select * from country_payments;
   
   -- below is just to help test the above code is correct by allowing cross comparison with the raw data.
     select
  country, amount
from country
   inner join city
      on country.country_id = city.country_id
   inner join address 
      on address.city_id = city.city_id
   inner join customer 
      on customer.address_id = address.address_id
   inner join  payment
      on payment.customer_id = customer.customer_id;  





