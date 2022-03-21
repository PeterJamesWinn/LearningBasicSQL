-- 1. Fill in the blanks (denoted by <#>) for the following query to obtain the results that 
-- follow:
-- 2. Write a query that returns the title of 
-- every film in which an actor with the 
-- first name JOHN appeared. 
-- 3. Construct a query that finds returns 
-- all addresses which are in the same city. 
-- You will need to join the address table 
-- to itself, and each row should include 2 
-- different addresses. 

use sakila;

-- 1. Fill in the blanks (denoted by <#>) for the following query to obtain the results that 
-- follow:

select c.first_name, c.last_name, a.address, ct.city
from customer c
   inner join address a
   on c.address_id = a.address_id
   inner join city ct
   on a.city_id = ct.city_id
   where a.district = 'California';
   
-- 2. Write a query that returns the title of 
-- every film in which an actor with the 
-- first name JOHN appeared. 

select f.title, a.first_name, a.last_name
    from film f
       inner join film_actor as fa
       on f.film_id = fa.film_id
       inner join actor as a 
       on fa.actor_id = a.actor_id
       where a.first_name = 'John';

-- confirm the list of all actors in the database with first name John.
-- select distinct a.first_name, a.last_name
--    from actor a
--       where a.first_name = 'John';
       
-- 3. Construct a query that finds returns 
-- all addresses which are in the same city. 
-- You will need to join the address table 
-- to itself, and each row should include 2 
-- different addresses.   
   
   
 -- basic query  
-- select *
-- from address a
--   inner join address b
--   on a.city_id = b.city_id;
 
 -- more complex query
-- select distinct *
-- from address a
--   inner join address b
--   on a.city_id = b.city_id
--   where b.address <> a.address
--   order by a.city_id;
 
 -- actual query
select a.address, a.address2, a.district, a.postal_code, ct.city, b.address, b.address2, b.district, b.postal_code
from address a
   inner join address b
   on a.city_id = b.city_id
   inner join city ct
   on a.city_id = ct.city_id
   where b.address <> a.address
   order by ct.city;
 
 




