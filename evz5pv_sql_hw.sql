Part 1:

1.
SELECT name FROM country WHERE region = 'South America';

2.
SELECT population FROM country WHERE name = 'Germany';

3.
SELECT name FROM city WHERE countrycode = (SELECT code FROM country WHERE name = 'Japan');

4.
SELECT name, population FROM country WHERE region IN ('Central Africa', 'Eastern Africa', 'Western Africa', 'Southern Africa', 'Northern Africa') ORDER BY population DESC LIMIT 3;

5.
SELECT name, lifeexpectancy FROM country WHERE population BETWEEN 1000000 AND 5000000;

6.
SELECT DISTINCT country.name FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE countrylanguage.language = 'French' AND countrylanguage.isofficial = 'T';

7.
SELECT Album.Title FROM Album JOIN Artist ON Album.ArtistId = Artist.ArtistId WHERE Artist.Name = 'AC/DC';

8.
SELECT Customer.FirstName, Customer.LastName, Customer.Email FROM Customer WHERE Customer.Country = 'Brazil';

9.
SELECT Playlist.Name FROM Playlist;

10.
SELECT COUNT(*) AS Total_Tracks FROM Track JOIN Genre ON Track.GenreId = Genre.GenreId WHERE Genre.Name = 'Rock';

11.
SELECT Employee.FirstName, Employee.LastName FROM Employee WHERE Employee.ReportsTo = (SELECT EmployeeId FROM Employee WHERE FirstName = 'Nancy' AND LastName = 'Edwards');

12.
SELECT Customer.CustomerId, SUM(Invoice.Total) AS Total_Sales FROM Invoice JOIN Customer ON Invoice.CustomerId = Customer.CustomerId GROUP BY Customer.CustomerId;


Part 2:

-- Create the tables:

-- Table for Cube Products
CREATE TABLE CubeProducts (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
);

-- Table for Customers
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

-- Table for Orders
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table for Order Details (linking Orders and Products)
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES CubeProducts(ProductID)
);

-- Insert data into the CubeProducts table:
INSERT INTO CubeProducts (ProductName, Price, StockQuantity)
VALUES
('Siamese Mirror', 35, 15),
('3x3x5 Mirror', 35, 20),
('3x3 Force Cube', 20, 25),
('Transparent Force Cube', 20, 10),
('Glow in the Dark 3x3', 25, 30),
('Polarity Cube', 30, 18),
('Globe Cube', 30, 12),
('Super Cube', 30, 8),
('Checkered Plastic 3x3', 15, 35),
('Clock Cube', 30, 7),
('Arrow Cube', 30, 22),
('Maze Cube', 30, 11),
('Birch Wood Cube', 30, 5),
('Fisher Wall v1', 28, 13),
('Fisher Wall v2', 28, 10),
('Watermelon Cube', 30, 16),
('Windmill Cutter Cube', 28, 14),
('Checkered Stickers 2x2', 13, 40),
('Brain Cube', 30, 17),
('2x2 Globe Cube', 25, 25),
('2x2 Force Cube', 15, 30),
('Digital Clock Cube', 30, 9),
('Joshua Kaye Foundation Cube', 30, 12),
('Metallic Dodo Cube', 35, 8),
('Mondrian Cube', 32, 10),
('Horror Mirror Cube', 32, 7),
('Force Megaminx', 40, 6),
('Calendar Cube', 30, 13),
('Siamese Cube', 25, 20),
('2x2 Chaos Cube', 20, 25),
('Chaos Cube', 25, 15),
('Gay Pride Flag Cube', 30, 20),
('Devil\'s Bandage Cube', 20, 10),
('Sudoku Cube', 30, 30),
('Scrabble Cube', 30, 12),
('Turtle Cube', 30, 18),
('Moon Cube', 30, 16),
('Camo Cube', 30, 25),
('Stripe Cube', 30, 22),
('Ombre Cube', 30, 28),
('2 Solution Cube', 30, 10),
('Dice Cube', 30, 35),
('Tic Tac Toe Cube', 30, 15),
('Fish Cube', 30, 14),
('Color Block Cube', 30, 12),
('Written Color Cube', 30, 15),
('Rainbow Globe Cube', 30, 20),
('Soccer Ball Cube', 30, 25),
('Relativity Cube', 30, 8),
('Tangle Cube', 30, 10),
('American Flag Cube', 30, 18),
('Lizard Cube', 30, 12),
('Force Pyraminx', 27, 10),
('2x2 Horror Mirror Cube', 28, 15),
('4x4 Calendar Cube', 35, 8),
('4x4 Super Cube', 35, 6);

-- Insert data into the Customers table
INSERT INTO Customers (CustomerName, Email, Address, PhoneNumber)
VALUES
('John Doe', 'johndoe@example.com', '1234 Elm St', '555-1234'),
('Jane Smith', 'janesmith@example.com', '5678 Oak St', '555-5678'),
('Emily Johnson', 'emilyj@example.com', '910 Maple Ave', '555-9101'),
('Michael Brown', 'michaelb@example.com', '321 Pine Rd', '555-4321'),
('Sophia Davis', 'sophiad@example.com', '654 Cedar Ln', '555-6543');

-- Insert data into the Orders table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
(1, '2024-09-01', 74.98),
(2, '2024-09-03', 44.99),
(3, '2024-09-04', 29.99),
(4, '2024-09-06', 129.97),
(5, '2024-09-07', 54.99);

-- Insert data into the OrderDetails table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES
(1, 1, 1, 39.99),
(1, 2, 1, 34.99),
(2, 3, 1, 29.99),
(3, 5, 1, 24.99),
(4, 4, 3, 129.97),
(5, 6, 1, 54.99);

-- Write queries to extract information:

-- Query 1: List all products in stock
SELECT * FROM CubeProducts;

-- Query 2: Retrieve all orders and their total amounts
SELECT * FROM Orders;

-- Query 3: Calculate the total sales per customer
SELECT Customers.CustomerName, SUM(Orders.TotalAmount) AS TotalSales
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerName;

