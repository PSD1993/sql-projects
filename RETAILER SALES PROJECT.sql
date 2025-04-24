CREATE DATABASE `project 1`;
USE `project 1`;
create table retailer(
`TRANSACTIONS ID` int,
`SALE DATE` date,
`SALE TIME` time,
`CUSTOMER ID` int,
GENDER enum("Male","Female"),
AGE int,
CATEGORY varchar(100),
QUANTIY int,
`PRICE PER UNIT` float,
COGS float,
`TOTAL SALE` float
);
-- My Analysis & Findings 
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05 
select *from retailer where `SALE DATE`='2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022 
select *FROM retailer where CATEGORY = 'Clothing' 
and QUANTITY >=4
and `SALE DATE` between'2022-11-01' and '2022-11-30';
alter table retailer rename  COLUMN QUANTIY TO QUANTITY;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category. 
select CATEGORY,sum(`QUANTITY`* `PRICE PER UNIT`) as `TOTAL SALE BY CATEGORY` from retailer  group by CATEGORY;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category. 
select ROUND(avg(AGE),2) as `AVERAGE AGE` from retailer where CATEGORY='Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000. 
select *from retailer where `TOTAL SALE`>1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category. 
select GENDER, CATEGORY,count(`TRANSACTIONS ID`) as ` TRANSACTION BY GENDER AND CATEGORY` from retailer group by GENDER,CATEGORY order by 1;


-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT
    EXTRACT(YEAR FROM `SALE DATE`) AS year,
    EXTRACT(MONTH FROM `SALE DATE`) AS month,
    ROUND(AVG(`TOTAL SALE`),2) AS`AVG MONTHLY SALE`
FROM retailer
GROUP BY EXTRACT(YEAR FROM `SALE DATE`), EXTRACT(MONTH FROM `SALE DATE`)
ORDER BY year, month;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
select 
`CUSTOMER ID`,
round(sum(`TOTAL SALE`),2) AS `TOP 5 SALES`
 from retailer group by `CUSTOMER ID` 
 order by `TOP 5 SALES` DESC
 LIMIT 5;
 
 -- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category. 
 select CATEGORY, COUNT(DISTINCT`CUSTOMER ID`) AS `UNIQUE CUSTOMERS` FROM retailer group by CATEGORY;
 
 -- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
 SELECT
    CASE
        WHEN HOUR(`SALE TIME`) < 12 THEN 'Morning'
        WHEN HOUR(`SALE TIME`) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS SHIFT,
    COUNT(*) AS `NUMBER OF ORDERS`
FROM retailer
GROUP BY SHIFT;


