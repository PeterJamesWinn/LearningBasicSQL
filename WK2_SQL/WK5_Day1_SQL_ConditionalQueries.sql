 -- WK5 Day 1 SQL queries
-- 1. Which of the payment IDs would be returned by the following filter conditions? 
-- customer_id <> 5 AND (amount > 8 OR date(payment_date) = '2005-08-23’) 
-- 2. Which of the payment IDs would be returned by the following filter conditions? 
-- customer_id = 5 AND NOT (amount > 6 OR date(payment_date) = '2005-06-19’) 
-- 3. Construct a query that retrieves all rows from the Payment table where the amount is 
-- either 1.98, 7.98, or 9.98. 
-- 4. Construct a query that finds all customers whose last name contains an A in the second 
-- position and a W anywhere after the A

 -- -- 1. Which of the payment IDs would be returned by the following filter conditions? 
-- customer_id <> 5 AND (amount > 8 OR date(payment_date) = '2005-08-23’) 

use sakila;

-- check basic selects work

select payment_id
from payment
where customer_id <>  5 AND date(payment_date) = '2005-08-23';

select payment_id
from payment
where customer_id <>  5 AND amount > 8;

-- actual answer
select payment_id
from payment
where customer_id <> 5
    AND ( amount > 8 OR date(payment_date) = "2005-08-23" ) ; -- This command didn't work for me when using single quotes around the date, which is strange since it does work with single quotes when the '(amount > 8 OR )' is not there. 


-- 2. Which of the payment IDs would be returned by the following filter conditions? 
-- customer_id = 5 AND NOT (amount > 6 OR date(payment_date) = '2005-06-19’) 
select payment_id
from payment
where customer_id = 5 AND NOT (amount > 6 OR date(payment_date) = "2005-06-19");

-- 3. Construct a query that retrieves all rows from the Payment table where the amount is 
-- either 1.98, 7.98, or 9.98. 
select *
from payment
where amount = 1.98 
  OR amount = 7.98 
  OR amount = 9.98 ;


-- 4. Construct a query that finds all customers whose last name contains an A in the second 
-- position and a W anywhere after the A

select *
from customer 
where last_name like "_A%W%";

