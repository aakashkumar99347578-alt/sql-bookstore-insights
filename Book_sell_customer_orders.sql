-- DROP DATABSE IF ITS ALREADY EXIST ---
DROP DATABASE IF EXISTS OnlineBookstore;

-- Create Table 

DROP TABLE IF EXISTS Book;
CREATE TABLE Book(
	Book_ID SERIAL PRIMARY KEY,
	Title VARCHAR(50),
	Author VARCHAR(50),
	Genre VARCHAR(100),
	Published_Year INT,
	Price NUMERIC(10,2),
	Stock INT
);

DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer(
	Customer_ID SERIAL PRIMARY KEY,
	Name VARCHAR(50),
	Email VARCHAR(100),
	Phone VARCHAR(15),
	City VARCHAR(50),
	Country VARCHAR(150)
);

DROP TABLE IF EXISTS Orders ;
CREATE TABLE Orders(
	Order_ID SERIAL PRIMARY KEY,
	Customer_ID INT REFERENCES Customer(Customer_ID),
	Book_ID INT REFERENCES Book(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_Amount NUMERIC(10,2)
);

SELECT * FROM Book;
SELECT * FROM Customer;
SELECT *FROM Orders;

ALTER TABLE Book
ALTER COLUMN Title TYPE VARCHAR(200);

ALTER TABLE Book
ALTER COLUMN Author TYPE VARCHAR(100);

-- 1) Retrieve all books in the "Fiction" genre :

SELECT * FROM Book
WHERE Genre = 'Fiction';

-- 2) Find book published after the year 1950:

SELECT * FROM Book
WHERE Published_Year>1950
ORDER BY Published_Year;

-- 3) List all customer from the canada:

SELECT * FROM Customer 
WHERE Country = 'Canada';

-- 4) Show orders placed in November 2023:

SELECT * FROM Orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available 

SELECT SUM(Stock) AS Total_Stock
FROM Book;


-- 6) Find the details of the most expensive book:

SELECT * FROM Book
ORDER BY Price DESC LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:



-- 8) Retrieve all orders where the total amount exceeds $20:

SELECT * FROM Orders
WHERE Total_Amount>20;

-- 9) List all genres available in the books table:

SELECT DISTINCT Genre FROM Book

-- 10) Find the book with the lowest stock:

SELECT * FROM Book
ORDER BY Stock ASC LIMIT 1

-- 11) Calculate the total revenue generated from all orders:

SELECT SUM(Total_Amount) AS Revenue FROM Orders;

-- ADVANCE QUESTIONS :

-- 1) Retrieve the total number of book sold for each genre:

SELECT b.Genre, SUM(o.Quantity)
FROM Orders o
JOIN Book b ON o.Book_ID = b.Book_ID
GROUP BY b.Genre;

-- 2) Find the average price of book in the "Fantasy" genre:

SELECT AVG(Price) AS Average_price FROM Book
WHERE Genre = 'Fantasy';

-- 3) List customers who have placed at least 2 orders:

SELECT * FROM Orders
SELECT * FROM Customer

SELECT Customer_ID , COUNT(Order_ID) AS ORDER_COUNT
FROM Orders
GROUP BY Customer_ID
HAVING COUNT(Order_ID)>=2;

-- 4) Find the most frequently ordered book:







