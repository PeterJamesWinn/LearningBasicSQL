
-- WK5 Day 3 processing strings etc. in sql

-- 1. Write a query that returns the 17 through 25 characters of the 
-- string 'Please find the substring in this string’. 
select substring('This is a piece of extemely long varchar data', 17,25);

-- 2. Write a query that returns the absolute value and sign (−1, 0, or 
-- 1) of the number −25.76823. Also return the number rounded 
-- to the nearest hundredth.
select
   abs(-25.76823),
   sign(-25.76823),
   round(-25.76823,2);

   
-- 3. Write a query to return just the month portion of the current 
-- date
select month(current_date());








   
   
   
   