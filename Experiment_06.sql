EXPERIMENT 06: SQL Aggregate Functions, GROUP BY and HAVING

MySQL SQL queries

1. Create and Select Database

CREATE DATABASE IF NOT EXISTS RetailSalesDB;
USE RetailSalesDB;

2. Create Sales Table

CREATE TABLE Sales (
Sale_ID INT PRIMARY KEY,
Product_Name VARCHAR(40) NOT NULL,
Category VARCHAR(25) NOT NULL,
Region VARCHAR(20) NOT NULL,
Quantity INT NOT NULL CHECK (Quantity > 0),
Unit_Price DECIMAL(10,2) NOT NULL CHECK (Unit_Price >= 0)
);

3. Insert Sales Records

INSERT INTO Sales VALUES
(1, 'Laptop', 'Electronics', 'South', 2, 45000),
(2, 'Mouse', 'Electronics', 'North', 10, 600),
(3, 'Chair', 'Furniture', 'South', 4, 3500),
(4, 'Desk', 'Furniture', 'East', 3, 8000),
(5, 'Notebook', 'Stationery', 'West', 20, 80),
(6, 'Pen', 'Stationery', 'North', 50, 20),
(7, 'Monitor', 'Electronics', 'East', 5, 12000),
(8, 'Chair', 'Furniture', 'North', 6, 3200),
(9, 'Notebook', 'Stationery', 'South', 30, 75),
(10, 'Keyboard', 'Electronics', 'West', 8, 1200),
(11, 'Desk', 'Furniture', 'West', 2, 8500),
(12, 'Pen', 'Stationery', 'East', 40, 25);

4. COUNT – Total Sales Records

SELECT COUNT(*) AS Total_Records FROM Sales;

5. SUM – Total Units Sold

SELECT SUM(Quantity) AS Total_Units FROM Sales;

6. SUM – Total Sales Revenue

SELECT SUM(Quantity * Unit_Price) AS Total_Revenue FROM Sales;

7. AVG – Average Unit Price

SELECT ROUND(AVG(Unit_Price), 2) AS Avg_Price FROM Sales;

8. MIN and MAX – Price Range

SELECT MIN(Unit_Price) AS Lowest_Price, MAX(Unit_Price) AS Highest_Price
FROM Sales;

9. COUNT DISTINCT – Product Categories

SELECT COUNT(DISTINCT Category) AS Categories FROM Sales;

10. GROUP BY – Sales Records per Category

SELECT Category, COUNT(*) AS Sale_Records
FROM Sales
GROUP BY Category
ORDER BY Category;

11. GROUP BY – Units Sold per Category

SELECT Category, SUM(Quantity) AS Units_Sold
FROM Sales
GROUP BY Category
ORDER BY Category;

12. GROUP BY – Revenue per Category

SELECT Category, SUM(Quantity * Unit_Price) AS Revenue
FROM Sales
GROUP BY Category
ORDER BY Category;

13. GROUP BY – Region-Wise Revenue

SELECT Region, SUM(Quantity * Unit_Price) AS Revenue
FROM Sales
GROUP BY Region
ORDER BY Revenue DESC, Region;

14. HAVING – Categories with More Than 20 Units

SELECT Category, SUM(Quantity) AS Units_Sold
FROM Sales
GROUP BY Category
HAVING SUM(Quantity) > 20
ORDER BY Category;

15. HAVING – Regions with Revenue Above 30000

SELECT Region, SUM(Quantity * Unit_Price) AS Revenue
FROM Sales
GROUP BY Region
HAVING SUM(Quantity * Unit_Price) > 30000
ORDER BY Revenue DESC;

16. WHERE and HAVING – Filtered Aggregates

SELECT Category, SUM(Quantity) AS Units_Sold
FROM Sales
WHERE Region IN ('North', 'South')
GROUP BY Category
HAVING SUM(Quantity) >= 10
ORDER BY Category;

17. Multiple GROUP BY Columns

SELECT Category, Region, SUM(Quantity) AS Units_Sold
FROM Sales
GROUP BY Category, Region
ORDER BY Category, Region;

18. Find Top Category by Revenue

SELECT Category, SUM(Quantity * Unit_Price) AS Revenue
FROM Sales
GROUP BY Category
ORDER BY Revenue DESC, Category
LIMIT 1;

19. Average Quantity by Category

SELECT Category, ROUND(AVG(Quantity), 2) AS Avg_Quantity
FROM Sales
GROUP BY Category
ORDER BY Category;

20. Verify Sales Data

SELECT COUNT(*) AS Transactions, SUM(Quantity) AS Units, SUM(Quantity * Unit_Price) AS Revenue
FROM Sales;




Oracle SQL Queries

1. Create Sales Table

CREATE TABLE Sales (
Sale_ID NUMBER PRIMARY KEY,
Product_Name VARCHAR2(40) NOT NULL,
Category VARCHAR2(25) NOT NULL,
Region VARCHAR2(20) NOT NULL,
Quantity NUMBER NOT NULL CHECK (Quantity > 0),
Unit_Price NUMBER(10,2) NOT NULL CHECK (Unit_Price >= 0)
);

2. Insert Sales Records

INSERT ALL
INTO Sales VALUES (1, 'Laptop', 'Electronics', 'South', 2, 45000)
INTO Sales VALUES (2, 'Mouse', 'Electronics', 'North', 10, 600)
INTO Sales VALUES (3, 'Chair', 'Furniture', 'South', 4, 3500)
INTO Sales VALUES (4, 'Desk', 'Furniture', 'East', 3, 8000)
INTO Sales VALUES (5, 'Notebook', 'Stationery', 'West', 20, 80)
INTO Sales VALUES (6, 'Pen', 'Stationery', 'North', 50, 20)
INTO Sales VALUES (7, 'Monitor', 'Electronics', 'East', 5, 12000)
INTO Sales VALUES (8, 'Chair', 'Furniture', 'North', 6, 3200)
INTO Sales VALUES (9, 'Notebook', 'Stationery', 'South', 30, 75)
INTO Sales VALUES (10, 'Keyboard', 'Electronics', 'West', 8, 1200)
INTO Sales VALUES (11, 'Desk', 'Furniture', 'West', 2, 8500)
INTO Sales VALUES (12, 'Pen', 'Stationery', 'East', 40, 25)
SELECT 1 FROM DUAL;
COMMIT;

3. COUNT – Total Sales Records

SELECT COUNT(*) AS Total_Records FROM Sales;

4. SUM – Total Units Sold

SELECT SUM(Quantity) AS Total_Units FROM Sales;

5. SUM – Total Sales Revenue

SELECT SUM(Quantity * Unit_Price) AS Total_Revenue FROM Sales;

6. AVG – Average Unit Price

SELECT ROUND(AVG(Unit_Price), 2) AS Avg_Price FROM Sales;

7. MIN and MAX – Price Range

SELECT MIN(Unit_Price) AS Lowest_Price, MAX(Unit_Price) AS Highest_Price
FROM Sales;

8. COUNT DISTINCT – Product Categories

SELECT COUNT(DISTINCT Category) AS Categories FROM Sales;

9. GROUP BY – Sales Records per Category

SELECT Category, COUNT(*) AS Sale_Records
FROM Sales
GROUP BY Category
ORDER BY Category;

10. GROUP BY – Units Sold per Category

SELECT Category, SUM(Quantity) AS Units_Sold
FROM Sales
GROUP BY Category
ORDER BY Category;

11. GROUP BY – Revenue per Category

SELECT Category, SUM(Quantity * Unit_Price) AS Revenue
FROM Sales
GROUP BY Category
ORDER BY Category;

12. GROUP BY – Region-Wise Revenue

SELECT Region, SUM(Quantity * Unit_Price) AS Revenue
FROM Sales
GROUP BY Region
ORDER BY Revenue DESC, Region;

13. HAVING – Categories with More Than 20 Units

SELECT Category, SUM(Quantity) AS Units_Sold
FROM Sales
GROUP BY Category
HAVING SUM(Quantity) > 20
ORDER BY Category;

14. HAVING – Regions with Revenue Above 30000

SELECT Region, SUM(Quantity * Unit_Price) AS Revenue
FROM Sales
GROUP BY Region
HAVING SUM(Quantity * Unit_Price) > 30000
ORDER BY Revenue DESC;

15. WHERE and HAVING – Filtered Aggregates

SELECT Category, SUM(Quantity) AS Units_Sold
FROM Sales
WHERE Region IN ('North', 'South')
GROUP BY Category
HAVING SUM(Quantity) >= 10
ORDER BY Category;

16. Multiple GROUP BY Columns

SELECT Category, Region, SUM(Quantity) AS Units_Sold
FROM Sales
GROUP BY Category, Region
ORDER BY Category, Region;

17. Find Top Category by Revenue

SELECT Category, Revenue
FROM (
SELECT Category, SUM(Quantity * Unit_Price) AS Revenue
FROM Sales
GROUP BY Category
ORDER BY Revenue DESC, Category
)
WHERE ROWNUM = 1;

18. Average Quantity by Category

SELECT Category, ROUND(AVG(Quantity), 2) AS Avg_Quantity
FROM Sales
GROUP BY Category
ORDER BY Category;

19. Verify Sales Data

SELECT COUNT(*) AS Transactions, SUM(Quantity) AS Units, SUM(Quantity * Unit_Price) AS Revenue
FROM Sales;
