 -- 1. Retrieve the actor ID, first name, and last name for all 
-- actors. Sort by last name and then by first name. 
-- 2. Retrieve the actor ID, first name, and last name for all actors 
-- whose last name equals 'WILLIAMS' or 'DAVIS’ 
-- 3. Write a query against the rental table that returns the IDs of 
-- the customers who rented a film on July 5th 2005 (use the 
-- rental.rental_date column, and you can use the date() 
-- function to ignore the time component). Include a single 
-- row for each distinct customer ID. 
-- Home learning tasks
-- 4. Fill in the blanks (denoted by 
-- <#>) for this multi-table query to 
-- achieve the results shown below.



-- 1 : sort by last name
select actor_id, first_name, last_name
from actor
order by last_name;

-- 1 : sort by first name
select actor_id, first_name, last_name
from actor
order by first_name;

-- 2. Retrieve the actor ID, first name, and last name for all actors 
-- whose last name equals 'WILLIAMS' or 'DAVIS’ 
select actor_id, first_name, last_name
from actor
where last_name = 'WILLIAMS' or last_name = 'DAVIS'
order by last_name;

-- 3. Write a query against the rental table that returns the IDs of 
-- the customers who rented a film on July 5th 2005 (use the 
-- rental.rental_date column, and you can use the date() 
-- function to ignore the time component). Include a single 
-- row for each distinct customer ID. 



-- select * from customer;
-- select * from rental;

select distinct customer_ID
from rental
where date(rental_date) = '2005-07-5'
order by customer_ID desc;

-- 4. Fill in the blanks (denoted by 
-- <#>) for this multi-table query to 
-- achieve the results shown below.

select email, return_date
from customer c
    inner join rental as r
    on c.customer_id = r.customer_id
where date(r.rental_date) = '2005-06-14'
order by date(r.return_date)  desc ;
