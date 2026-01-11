
-- ----------------------------------- Assignment no 5 : SQL Aggregation & Window Functions Assignment -------------------------------------------------------
-- Instructions: Use the provided table and data below. Write SQL queries to answer the questions. Do not modify the data.

use ass1 ;

CREATE TABLE orders (
			order_id INT,
			customer VARCHAR(20),
			region VARCHAR(10),
			amount INT
);

insert into orders () 
values (1,"C1","North",500),
	   (2,"C2","North",700),
       (3,"C3","North",700),
       (4,"C4","South",300),
       (5,"C5","South",600),
       (6,"C6","South",900),
       (7,"C7","East",400),
       (8,"C8","East",400),
       (9,"C9","West",800),
       (10,"C10","West",1000);
       
-- -------------------------------------------------------------- Questions: ---------------------------------------------------------------------------------

-- 1. Find the total order amount.

select sum(amount) as total_order_amount from orders;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2. Find the average order amount.

select avg(amount) as avg_order_amount from orders;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3. Find the minimum and maximum order amount.

select min(amount) as min_order_amount, max(amount) as max_order_amount from orders;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 4. Find the total number of orders.

select count(*) as total_number_of_orders from orders;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 5. Find the total order amount per region.

select region,sum(amount) as total_order_amount from orders
group by region;  

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 6. Find the average order amount per region.

select region,avg(amount) as avg_order_amount from orders
group by region;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 7. Find the number of orders per region.

select region,count(*) as number_of_orders from orders
group by region;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 8. Find the minimum order amount per region.

select region,min(amount) as minimum_order_amount  from orders
group by region;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 9. Find the maximum order amount per region

select region,max(amount) as maximum_order_amount  from orders
group by region;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 10. Assign ROW_NUMBER to orders based on amount (ascending).

select *, row_number() over( order by amount asc) as rn from orders;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 11. Assign RANK to orders based on amount (descending).

select * , 
		rank() over(order by amount desc) 
from orders;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 12. Assign DENSE_RANK to orders based on amount (descending)

select * , 
		dense_rank() over(order by amount desc) 
from orders;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 13. Assign ROW_NUMBER per region ordered by amount (ascending).

select * , 
		row_number() over(partition by region order by amount desc) 
from orders;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 14. Assign RANK per region ordered by amount (descending).

select * , 
		rank() over(partition by region order by amount desc) as rk
from orders;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 15. Assign DENSE_RANK per region ordered by amount (descending)

select * , 
		dense_rank() over(partition by region order by amount desc) as drk 
from orders;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
       
       