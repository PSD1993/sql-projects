create database `Online Book Store`;
use `Online Book Store`;
create table Books(
`Book ID` int  primary key auto_increment,
Title varchar (100),
Author varchar(100),
Genre varchar(100),
Published_Year int,
Price numeric(10,2),
Stock int
);
ALTER TABLE Books
RENAME COLUMN Published_Year TO `Published Year`;

create table Customers(
`Customer ID` int primary key auto_increment,
Name varchar(100),
Email varchar(100) unique,
Phone varchar(100),
City varchar(100),
Country varchar(100)
);
CREATE TABLE Orders (
  `Order ID` INT PRIMARY KEY AUTO_INCREMENT,
  `Customer ID` INT,
  `Book ID` INT,
  `Order Date` DATE,
  Quantity INT,
  `Total Amount` NUMERIC(10,2),
  FOREIGN KEY (`Customer ID`) REFERENCES Customers(`Customer ID`),
  FOREIGN KEY (`Book ID`) REFERENCES Books(`Book ID`)
);
select*from	 books;
select* from customers;
select*from orders;

-- 1) Retrieve all books in the "Fiction" genre
select*from books 
where genre="Fiction";

-- 2) Find books published after the year 1950
select*from books where `Published Year`>1950;

--  3) List all customers from the Canada
select *from customers where Country="Canada";

--  4) Show orders placed in November 2023
select*from orders where `Order Date` between '2023-11-01' and '2023-11-30' order by `Order Date`;

-- 5) Retrieve the total stock of books available
select sum(Stock)  as `Total Stock` from books;

-- 6) Find the details of the most expensive book
select * from books order by price desc limit 1;

-- 7) Show all customers who ordered more than 1 quantity of a book
select *from orders where Quantity>1;

--  8) Retrieve all orders where the total amount exceeds $20
select *from orders where `Total Amount`>20 order by`Total Amount`;

--  9) List all genres available in the Books table
select distinct Genre from Books;

--  10) Find the book with the lowest stock
select *from books order by Stock asc limit 1;

-- 11) Calculate the total revenue generated from all orders
select sum(`Total Amount`) as `Total Revenue` from orders;

-- Advance Queries

-- 1) Retrieve the total number of books sold for each genre
select books.Genre,sum(Quantity) as `Total book sold` from books  join orders  on  orders.`Book ID`=books.`Book ID` group by Genre;

-- 2) Find the average price of books in the "Fantasy" genre
select Genre,avg(Price) as `Avg Price  of Books` from books where Genre="Fantasy";

-- 3) List customers who have placed at least 2 orders
select 
c.`Customer ID`,
c.Name, 
count(o.`Order ID`) as `Count Orders`
from customers c 
join orders o on c.`Customer ID`=o.`Customer ID`
group by c.`Customer ID`,c.Name
having count(o.`Order ID`)>=2;

-- 4) Find the most frequently ordered book
select b.Title,count(o.`Book ID`) as `Most Ordered Book`
from orders o
join books b on o.`Book ID`=b.`Book ID`
group by b.Title
order by `Most Ordered Book` desc limit 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre
select *from books  where genre='Fantasy' order by Price desc limit 3;

-- 6) Retrieve the total quantity of books sold by each author
select distinct b. Author,sum(o.Quantity) as `Total sold` 
from orders o
join Books b on b.`Book ID`=o.`Order ID`
group by b.Author;

-- 7) List the cities where customers who spent over $30 are located
select  distinct c.City,o.`Total Amount` 
from customers c
join orders o on c.`Customer ID`=o.`Customer ID`
where  o.`Total Amount`>30
order by o.`Total Amount`;

--  Find the customer who spent the most on orders
select c.`Customer ID`,c.Name,sum(`Total Amount`) as `Total Spent`
from customers c 
join orders o on c.`Customer ID`=o.`Customer ID`
group by c.`Customer ID`,c.Name
order by `Total Spent` desc limit 1;

--  9) Calculate the stock remaining after fulfilling all orders
SELECT b.`Book ID`,b.Title,b.Stock, coalesce (SUM(o.Quantity), 0) as `Order Quantity`,
    b.Stock - coalesce(sum(o.Quantity),0) as ` Remaining Stock`
FROM books b
LEFT JOIN orders o ON b.`Book ID` = o.`Book ID`
GROUP BY b.`Book ID`, b.Title, b.Stock;
