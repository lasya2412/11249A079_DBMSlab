Experiment 4: Creating a Database to Set Various Constraints

MySQL SQL queries
  
1. Create and Select Database

CREATE DATABASE RetailConstraintDB;

USE RetailConstraintDB;

2. Create Customers Table

CREATE TABLE Customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
city VARCHAR(50) DEFAULT 'Chennai'
);

3. Create Products Table

CREATE TABLE Products (
product_id INT PRIMARY KEY,
sku VARCHAR(20) NOT NULL UNIQUE,
product_name VARCHAR(100) NOT NULL,
price DECIMAL(10,2) CHECK (price > 0),
stock INT DEFAULT 0 CHECK (stock >= 0)
);

4. Create Orders Table

CREATE TABLE Orders (
order_id INT PRIMARY KEY,
customer_id INT,
product_id INT,
quantity INT CHECK (quantity > 0),
order_status VARCHAR(20) DEFAULT 'Pending'
CHECK (order_status IN ('Pending', 'Confirmed', 'Cancelled')),
order_date DATE DEFAULT (CURRENT_DATE),
CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
CONSTRAINT fk_product
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

5. Insert Customer Records

INSERT INTO Customers VALUES
(201, 'Asha', '[asha@example.com](mailto:asha@example.com)', 'Chennai'),
(202, 'Bala', '[bala@example.com](mailto:bala@example.com)', 'Hyderabad'),
(203, 'Charu', '[charu@example.com](mailto:charu@example.com)', 'Bengaluru');

6. Insert Product Records

INSERT INTO Products VALUES
(301, 'KB-01', 'Keyboard', 850, 25),
(302, 'MS-02', 'Mouse', 450, 40),
(303, 'HD-03', 'Hard Drive', 4200, 10);

7. Insert Order Records

INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_status)
VALUES
(401, 201, 301, 2, 'Pending'),
(402, 202, 302, 3, 'Confirmed'),
(403, 203, 303, 1, 'Pending');

8. Display Customer Records

SELECT * FROM Customers
ORDER BY customer_id;

9. Display Product Records

SELECT * FROM Products
ORDER BY product_id;

10. Display Order Records

SELECT * FROM Orders
ORDER BY order_id;

11. Test DEFAULT Constraint

INSERT INTO Customers (customer_id, customer_name, email)
VALUES (204, 'Deepa', '[deepa@example.com](mailto:deepa@example.com)');

12. Verify DEFAULT City

SELECT customer_id, customer_name, city
FROM Customers
WHERE customer_id = 204;

13. Test PRIMARY KEY Constraint

INSERT INTO Customers
VALUES (201, 'Kiran', '[kiran@example.com](mailto:kiran@example.com)', 'Delhi');

14. Test UNIQUE Constraint

INSERT INTO Customers
VALUES (205, 'Ravi', '[asha@example.com](mailto:asha@example.com)', 'Mumbai');

15. Test NOT NULL Constraint

INSERT INTO Customers
VALUES (206, NULL, '[new@example.com](mailto:new@example.com)', 'Chennai');

16. Test CHECK Constraint on Product Price

INSERT INTO Products
VALUES (304, 'KB-04', 'Gaming Keyboard', -500, 10);

17. Test FOREIGN KEY Constraint

INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_status)
VALUES (404, 999, 301, 1, 'Pending');

18. Test CHECK Constraint on Quantity

INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_status)
VALUES (405, 201, 301, 0, 'Pending');

19. Test CHECK Constraint on Order Status

INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_status)
VALUES (406, 201, 301, 1, 'Shipped');

20. Display Orders Table Definition

SHOW CREATE TABLE Orders;




Oracle SQL Queries

1. Create Customers Table

CREATE TABLE Customers (
customer_id NUMBER(5) PRIMARY KEY,
customer_name VARCHAR2(50) NOT NULL,
email VARCHAR2(100) NOT NULL UNIQUE,
city VARCHAR2(50) DEFAULT 'Chennai'
);

2. Create Products Table

CREATE TABLE Products (
product_id NUMBER(5) PRIMARY KEY,
sku VARCHAR2(20) NOT NULL UNIQUE,
product_name VARCHAR2(100) NOT NULL,
price NUMBER(10,2) CHECK (price > 0),
stock NUMBER(5) DEFAULT 0 CHECK (stock >= 0)
);

3. Create Orders Table

CREATE TABLE Orders (
order_id NUMBER(5) PRIMARY KEY,
customer_id NUMBER(5),
product_id NUMBER(5),
quantity NUMBER(5) CHECK (quantity > 0),
order_status VARCHAR2(20) DEFAULT 'Pending'
CHECK (order_status IN ('Pending', 'Confirmed', 'Cancelled')),
order_date DATE DEFAULT CURRENT_DATE,
CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
CONSTRAINT fk_product
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

4. Insert Customer Records

INSERT ALL
INTO Customers VALUES (201, 'Asha', '[asha@example.com](mailto:asha@example.com)', 'Chennai')
INTO Customers VALUES (202, 'Bala', '[bala@example.com](mailto:bala@example.com)', 'Hyderabad')
INTO Customers VALUES (203, 'Charu', '[charu@example.com](mailto:charu@example.com)', 'Bengaluru')
SELECT 1 FROM DUAL;

5. Insert Product Records

INSERT ALL
INTO Products VALUES (301, 'KB-01', 'Keyboard', 850, 25)
INTO Products VALUES (302, 'MS-02', 'Mouse', 450, 40)
INTO Products VALUES (303, 'HD-03', 'Hard Drive', 4200, 10)
SELECT 1 FROM DUAL;

6. Insert Order Records

INSERT ALL
INTO Orders (order_id, customer_id, product_id, quantity, order_status)
VALUES (401, 201, 301, 2, 'Pending')
INTO Orders (order_id, customer_id, product_id, quantity, order_status)
VALUES (402, 202, 302, 3, 'Confirmed')
INTO Orders (order_id, customer_id, product_id, quantity, order_status)
VALUES (403, 203, 303, 1, 'Pending')
SELECT 1 FROM DUAL;

7. Display Customer Records

SELECT * FROM Customers
ORDER BY customer_id;

8. Display Product Records

SELECT * FROM Products
ORDER BY product_id;

9. Display Order Records

SELECT * FROM Orders
ORDER BY order_id;

10. Test DEFAULT Constraint

INSERT INTO Customers (customer_id, customer_name, email)
VALUES (204, 'Deepa', '[deepa@example.com](mailto:deepa@example.com)');

11. Verify DEFAULT City

SELECT customer_id, customer_name, city
FROM Customers
WHERE customer_id = 204;

12. Test PRIMARY KEY Constraint

INSERT INTO Customers
VALUES (201, 'Kiran', '[kiran@example.com](mailto:kiran@example.com)', 'Delhi');

13. Test UNIQUE Constraint

INSERT INTO Customers
VALUES (205, 'Ravi', '[asha@example.com](mailto:asha@example.com)', 'Mumbai');

14. Test NOT NULL Constraint

INSERT INTO Customers
VALUES (206, NULL, '[new@example.com](mailto:new@example.com)', 'Chennai');

15. Test CHECK Constraint on Product Price

INSERT INTO Products
VALUES (304, 'KB-04', 'Gaming Keyboard', -500, 10);

16. Display Order Records

SELECT order_id, customer_id, product_id, quantity, order_status
FROM Orders
ORDER BY order_id;

17. Display Orders Table Constraints

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'ORDERS';
