use amazon;
-- Q> retrive the all amazone sale data,and find out count size wise sale and total amount ,group by state name and category wise sale data
SELECT am.`State Name`, am.Category, am.Size, COUNT(*) AS `Total Size Count`, round(sum(am.Amount),0) as `Total Amount`
FROM `amazone sales data` am
GROUP BY am.`State Name`, am.Category, am.Size;

-- Q>1. How many orders are there in total?
select count(*) as `Total order` from `amazone sales data`;

-- Q>2. What is the total sales amount?
select round(sum(Amount),0) as `Total Sale` from `amazone sales data`;

-- Q>3. How many orders were cancelled?
select count(*) as `Cancelled Orders`
from `amazone sales data`
where Status="Cancelled";

-- Q>4. What is the average order amount?
select round(avg(Amount),0) as `Average amount order`
from `amazone sales data`;

-- Q>5. List all distinct product categories.
select distinct Category from `amazone sales data`;

-- Q>6. How many orders were successfully shipped to buyers?
select count(*) from `amazone sales data`where `Status`='Shipped - Delivered to Buyer';

-- Q>7 7. What is the total quantity of items sold?
select sum(Qty) as `Total Quantity Sale` from `amazone sales data`;

-- Q> 8. Which city had the highest number of shipments?
select `City Name`,count(*) as `count shipment`
from `amazone sales data`
group by `City Name`
order by `count shipment` desc limit 1;


-- Q>9. What are the top 5 states by total sales amount?
select `State Name`,round(sum(amount),0) as `hieghest total amount sale`
from `amazone sales data`
group by `State Name`
order by `hieghest total amount sale` desc limit 5;

-- Q>10. List orders where the quantity is 0 but the amount is greater than 0.
select *
from `amazone sales data`
where Qty=0 and Amount>0;

-- Q>11. Which product category has the highest total sales?
select Category,count(*) as `Category Hieghest total sales`
from `amazone sales data`
group by Category
order by `Category Hieghest total sales` desc limit 1;

-- Q>12 Which size has the most orders?
select Size,count(*) as `most ordered size`
from `amazone sales data`
group by Size
order by `most ordered size` desc limit 1;

-- Q>13  How many distinct cities are in the dataset?
select count(distinct`City Name`) as `City Count`from `amazone sales data`;

-- Q>14  Find the average order amount by category.
select Category, round(avg(Amount),0) as `Average Amount sale` 
from `amazone sales data`
group by Category;

-- Q>15  Get the total sales per date.
select `Date`,round(sum(Amount),0) as `Daily Sale`
from `amazone sales data`
group by `Date`
order by `Date`;

-- Q>16 Which courier status appears most frequently?
select `Courier Status`,count(*) as `Status Count`
from `amazone sales data`
group by `Courier Status`
order by `Status Count` desc limit 1;

-- Q>17 List all unique order statuses.
select distinct `Status` from `amazone sales data`;

-- Q>18 Which date had the highest sales?
select `Date`,round(sum(Amount),0) as `Hieghest sale by date`
from `amazone sales data`
group by `Date` 
order by `Date` desc limit 1;

-- Q>19 What is the most common postal code in the data?
select `Postal Code`,count(*) as `common postal code`
from `amazone sales data`
group by `Postal Code`
order by `common postal code` desc limit 1;

-- Q>20 What is the total quantity sold by product category?
select Category, sum(Qty) as `Total Quantity`
from `amazone sales data`
group by Category;

-- Q>21 List all orders with amount greater than ₹1000.
select *from `amazone sales data` where Amount>1000;

-- Q>22 Which state had the most orders cancelled?
select `State Name`,count(*) as `cancelled by state`
from `amazone sales data`
where `Status`='Cancelled'
group by `State Name`
order by `cancelled by state` desc limit 1;

-- Q>23 What is the average quantity ordered per transaction?
select avg(Qty) as `Average QTY` from `amazone sales data`;

-- Q> 24 How many orders were shipped?
select count(*) as `Shipped orders`
from `amazone sales data`
where `Status`='Shipped';

-- Q>25 How many orders have the size 'M'?
select count(*) as `Count "M" Size`
from `amazone sales data`
where Size='M';

-- Q>26 Which product size had the highest sales revenue?
select Size, round(sum(Amount),0) as `Hieghest revenue`
from `amazone sales data`
group by Size
order by `Hieghest revenue` desc limit 1;

-- Q>27 What is the total number of distinct order IDs?
select distinct `Order ID` as `distinct order IDs` from `amazone sales data`;

-- Q>28 Which state has the lowest total sales?
select `State Name`,round(sum(Amount),0) as `Lowest sale  by state`
from `amazone sales data`
group by `State Name`
order by `Lowest sale  by state` asc limit  1;

-- Q>29 What is the total number of shipped orders per category?
select Category, count(*) as `Total Shipped`
from `amazone sales data`
where `Courier Status`='Shipped'
group by Category;

-- Q>29  What is the total quantity per size?
select Size,sum(Qty) as `Total Qty by Size`
from `amazone sales data`
group by Size;

-- Q>30 List all orders from the city "Mumbai".
select *from `amazone sales data`
where `City Name`="MUMBAI";


-- Q>31  What is the average amount for cancelled orders?
select Status,round(avg(Amount),0) as `AVG Amount of Cancelled ordere`
from `amazone sales data`
where Status="Cancelled"
group by Status;

-- Q>32 Which size generated the least revenue?
select Size, round(sum(Amount),0) as `Least Revenue`
from `amazone sales data`
group by Size
order by `Least Revenue` asc limit 1;


-- Q>33 Find all orders with missing postal code.
select*from `amazone sales data`
where `Postal Code` IS NULL;

-- Q>34 Count orders by courier status.
select `Courier Status`,count(*) as `Count Status`
from `amazone sales data`
group by `Courier Status`;


-- Q>35 What is the maximum amount for a single order?
select max(Amount) as `maximum order` from `amazone sales data`;

-- Q>36 What is the minimum amount recorded?
select min(Amount) as `minimum order` from `amazone sales data`;


-- Q>37  Which product category has the highest average order value?
select Category,round(avg(Amount)) as `hieghest order value`
from `amazone sales data`
group by Category
order by `hieghest order value` desc limit 1;

-- Q>38 . Which date had the lowest number of orders?
select `Date`,count(*) as `lowest orders by month`
from `amazone sales data`
group by `Date`
order by `lowest orders by month` asc limit 1;

-- Q>39 Count the number of orders with Qty > 1.
select count(*) as ` COUNT QTY>1`
from `amazone sales data`
where Qty>1;


-- Q>40 How many orders were shipped to each postal code?
select `Postal Code`,count(*) as `Ordes count`
from `amazone sales data`
group by `Postal Code`;

-- Q>41 Which states had zero sales?
select `State Name`
from `amazone sales data`
group by `State Name`
having sum(Amount)=0;

-- Q>42 What is the total revenue from the "Shirt" category?
select Category,count(*) as `Total revenue`
from `amazone sales data`
where Category="Shirt";

-- Q>43 What is the average quantity for the "Watch" category?
select avg(Qty)
from `amazone sales data`
where Category="Watch";

-- Q>44  How many orders were placed per month (assuming MM-DD-YY format)?
SELECT SUBSTRING(Date, 1, 2) AS Month, COUNT(*) AS order_count 
FROM `amazone sales data` 
GROUP BY Month;


-- Q>45 Which size has the fewest unique orders?
select Size,count(distinct `Order ID`) as `Unique order`
from `amazone sales data`
group by Size
order by `Unique order` asc limit 1;

-- Q>46  What is the revenue per city?
select `City Name`,round(sum(Amount)) as `Total Revenue`
from `amazone sales data`
group by `City Name`
order by `Total Revenue` desc;


-- Q>47 What is the most common size ordered?
select Size, count(*) as `common size`
from `amazone sales data`
group by Size
order by `common size` desc limit 1;

-- Q>48 How many unique sizes are available?
select count(distinct Size) as `Unique Size` from `amazone sales data`;

-- Q49> List all orders with both Qty and Amount as zero.
select*from `amazone sales data`
where Qty=0 and Amount=0;


-- 50> List all orders where the category is not specified.
select* from `amazone sales data` 
where Category is null or Category='';

-- Q51>What is the average sales amount per city?
select `City Name`,round(avg(Amount)) as `Averae Amount`
from `amazone sales data`
group by `City Name`;


-- Q 52> Which state has the most distinct cities?
select `State Name`,count(distinct`City Name`) as `Unique City`
from `amazone sales data`
group by `State Name`
order by `Unique City` desc limit 1;

-- Q 53> Count how many times each order status appears.
select Status,count(*) as `Count Status`
from `amazone sales data`
group by Status;

-- Q 54> What is the revenue from the 'Wallet' category in Delhi?
select round(sum(Amount)) as ` Delhi Wallet  Revenue`
from `amazone sales data`
where Category="Wallet" and `State Name`="Delhi";

-- Q 55> Find the average number of items sold per state.
select `State Name`,avg(Qty) as `Average item sold by State`
from `amazone sales data`
group by `State Name`;

-- Q> 56 List all orders shipped by 'Blue Dart'.
select* from `amazone sales data`
where `Courier Status` like '%Blue Dart%';

-- Q> 57 How many unique postal codes are there?
select count(distinct `Postal Code`) as `Unique Postal Code` from `amazone sales data`;

-- Q> 58  Which state had the highest number of cancelled orders?
select `State Name`,count(*) as `Cancelled orders`
from `amazone sales data`
where `Status`="Cancelled"
group by`State Name`
order by `Cancelled Orders` desc limit 1;


-- Q>59  What is the total revenue from orders of quantity more than 5?
select sum(Amount) as `revenue`
from `amazone sales data`
where Qty >5;

-- Q>60 How many orders had quantity exactly 1?
select count(*) as `orders`
from `amazone sales data`
where Qty=1;

-- Q>61 What is the percentage of cancelled orders out of total?
SELECT 
  (SELECT COUNT(*) FROM `amazone sales data` WHERE Status = 'Cancelled') * 100.0 / 
  (SELECT COUNT(*) FROM `amazone sales data`) AS cancelled_percentage;
  
  
  -- Q>62  List all orders from Maharashtra with quantity greater than 3.
  select * from	 `amazone sales data`
  where `State Name`='MAHARASHTRA' and Qty>3;
  
  -- Q>63 What percentage of total sales came from 'Shoes'?
  SELECT 
  (SELECT SUM(Amount) FROM `amazone sales data` WHERE Category = 'Shoes') * 100.0 / 
  (SELECT SUM(Amount) FROM `amazone sales data`) AS shoes_percentage;
  
  
-- Q>64 What are the top 3 most ordered categories by quantity?
SELECT Category, SUM(Qty) AS total_qty 
FROM `amazone sales data` 
GROUP BY Category 
ORDER BY total_qty DESC 
LIMIT 3;


-- Q>66  Which state has the highest number of distinct order IDs?
SELECT `State Name`, COUNT(DISTINCT `Order ID`) AS order_count 
FROM `amazone sales data` 
GROUP BY `State Name` 
ORDER BY order_count DESC 
LIMIT 1;



-- Q>67 What is the most common courier status for the 'Watch' category?
SELECT `Courier Status`, COUNT(*) AS status_count 
FROM `amazone sales data` 
WHERE Category = 'Watch' 
GROUP BY `Courier Status` 
ORDER BY status_count DESC 
LIMIT 1;

-- Q>68 Find all orders placed in a city starting with 'B'.
SELECT * 
FROM `amazone sales data` 
WHERE `City Name` LIKE 'B%';


-- Q>69 What is the total sales from cities with 'Nagar' in the name?
SELECT round(SUM(Amount),0) AS total_sales 
FROM `amazone sales data` 
WHERE `City Name` LIKE '%Nagar%';

-- Q>70 What is the total quantity of items ordered in cities starting with 'P'?
SELECT SUM(Qty) 
FROM `amazone sales data` 
WHERE `City Name` LIKE 'P%';






