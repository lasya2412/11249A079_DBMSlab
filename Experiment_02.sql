Experiment 2: Insertion, Deletion, Modification, Alteration, Updating and Conditional Record Viewing

MySQL Queries

1. Create Database
CREATE DATABASE PayrollLabDB;
USE PayrollLabDB;
2. Create Employee Table
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50) NOT NULL,
    Department VARCHAR(25) NOT NULL,
    Designation VARCHAR(30) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    City VARCHAR(30),
    Join_Date DATE NOT NULL
);
3. Insert Eight Initial Records
INSERT INTO Employee (Emp_ID, Emp_Name, Department, Designation, Salary, City, Join_Date)
VALUES
(201, 'Asha', 'HR', 'Executive', 38000, 'Chennai', '2023-06-12'),
(202, 'Bharat', 'IT', 'Developer', 52000, 'Hyderabad', '2022-08-01'),
(203, 'Charan', 'Sales', 'Associate', 32000, 'Vijayawada', '2024-01-15'),
(204, 'Deepa', 'IT', 'Analyst', 48000, 'Bengaluru', '2023-03-20'),
(205, 'Eshan', 'Finance', 'Accountant', 45000, 'Chennai', '2021-11-05'),
(206, 'Farah', 'HR', 'Recruiter', 41000, 'Hyderabad', '2024-02-10'),
(207, 'Gopal', 'Sales', 'Executive', 35000, 'Nellore', '2022-07-18'),
(208, 'Hema', 'IT', 'Developer', 56000, 'Tirupati', '2021-09-30');
4. View Initial Records
SELECT * FROM Employee
ORDER BY Emp_ID;
5. Insert One New Employee
INSERT INTO Employee
VALUES (209, 'Ishita', 'Marketing', 'Coordinator', 39000, 'Guntur', '2025-01-06');
6. Update One Employee's Salary
UPDATE Employee
SET Salary = 55000
WHERE Emp_ID = 202;

SELECT Emp_ID, Emp_Name, Salary
FROM Employee
WHERE Emp_ID = 202;
7. Increase Sales Salaries by 10%
UPDATE Employee
SET Salary = ROUND(Salary * 1.10, 2)
WHERE Department = 'Sales';

SELECT Emp_ID, Emp_Name, Salary
FROM Employee
WHERE Department = 'Sales'
ORDER BY Emp_ID;
8. Modify Employee Department
UPDATE Employee
SET Department = 'Operations'
WHERE Emp_ID = 206;

SELECT Emp_ID, Emp_Name, Department
FROM Employee
WHERE Emp_ID = 206;
9. Add a New Column
ALTER TABLE Employee
ADD COLUMN Email VARCHAR(80) NULL;

SHOW COLUMNS FROM Employee LIKE 'Email';
10. Populate the Email Column
UPDATE Employee
SET Email = 'asha@company.test'
WHERE Emp_ID = 201;

UPDATE Employee
SET Email = 'bharat@company.test'
WHERE Emp_ID = 202;

SELECT Emp_ID, Emp_Name, Email
FROM Employee
WHERE Email IS NOT NULL
ORDER BY Emp_ID;
11. Modify a Column Data Type
ALTER TABLE Employee
MODIFY COLUMN Designation VARCHAR(50) NOT NULL;

SHOW COLUMNS FROM Employee LIKE 'Designation';
12. View Conditional Records
SELECT Emp_ID, Emp_Name, Department, Salary
FROM Employee
WHERE Salary >= 45000
ORDER BY Salary DESC, Emp_ID;
13. Delete a Selected Employee
DELETE FROM Employee
WHERE Emp_ID = 209;

SELECT COUNT(*) AS Total_Employees
FROM Employee;
14. Delete an Employee Using a Condition
DELETE FROM Employee
WHERE Department = 'Operations' AND Emp_ID = 206;

SELECT Emp_ID, Emp_Name, Department
FROM Employee
ORDER BY Emp_ID;
15. View Final Payroll
SELECT Emp_ID, Emp_Name, Department, Salary, Email
FROM Employee
ORDER BY Emp_ID;
16. Verify Final Employee Count
SELECT COUNT(*) AS Final_Count
FROM Employee;
17. View Sales Employees
SELECT Emp_Name, Salary
FROM Employee
WHERE Department = 'Sales'
ORDER BY Emp_ID;
18. Display Employee Table Structure
SHOW COLUMNS FROM Employee;



Oracle SQL Queries

1. Create Employee Table
CREATE TABLE Employee (
    Emp_ID NUMBER PRIMARY KEY,
    Emp_Name VARCHAR2(50) NOT NULL,
    Department VARCHAR2(25) NOT NULL,
    Designation VARCHAR2(30) NOT NULL,
    Salary NUMBER(10,2) NOT NULL,
    City VARCHAR2(30),
    Join_Date DATE NOT NULL
);
2. Insert Eight Initial Records
INSERT ALL
    INTO Employee VALUES (201, 'Asha', 'HR', 'Executive', 38000, 'Chennai', DATE '2023-06-12')
    INTO Employee VALUES (202, 'Bharat', 'IT', 'Developer', 52000, 'Hyderabad', DATE '2022-08-01')
    INTO Employee VALUES (203, 'Charan', 'Sales', 'Associate', 32000, 'Vijayawada', DATE '2024-01-15')
    INTO Employee VALUES (204, 'Deepa', 'IT', 'Analyst', 48000, 'Bengaluru', DATE '2023-03-20')
    INTO Employee VALUES (205, 'Eshan', 'Finance', 'Accountant', 45000, 'Chennai', DATE '2021-11-05')
    INTO Employee VALUES (206, 'Farah', 'HR', 'Recruiter', 41000, 'Hyderabad', DATE '2024-02-10')
    INTO Employee VALUES (207, 'Gopal', 'Sales', 'Executive', 35000, 'Nellore', DATE '2022-07-18')
    INTO Employee VALUES (208, 'Hema', 'IT', 'Developer', 56000, 'Tirupati', DATE '2021-09-30')
SELECT 1 FROM DUAL;
COMMIT;
3. View Initial Records
SELECT * FROM Employee
ORDER BY Emp_ID;
4. Insert One New Employee
INSERT INTO Employee
VALUES (209, 'Ishita', 'Marketing', 'Coordinator', 39000, 'Guntur', DATE '2025-01-06');
5. Update One Employee's Salary
UPDATE Employee
SET Salary = 55000
WHERE Emp_ID = 202;

SELECT Emp_ID, Emp_Name, Salary
FROM Employee
WHERE Emp_ID = 202;
6. Increase Sales Salaries by 10%
UPDATE Employee
SET Salary = ROUND(Salary * 1.10, 2)
WHERE Department = 'Sales';

SELECT Emp_ID, Emp_Name, Salary
FROM Employee
WHERE Department = 'Sales'
ORDER BY Emp_ID;
7. Modify Employee Department
UPDATE Employee
SET Department = 'Operations'
WHERE Emp_ID = 206;

SELECT Emp_ID, Emp_Name, Department
FROM Employee
WHERE Emp_ID = 206;
8. Add a New Column
ALTER TABLE Employee
ADD (Email VARCHAR2(80));

DESC Employee;
9. Populate the Email Column
UPDATE Employee
SET Email = 'asha@company.test'
WHERE Emp_ID = 201;

UPDATE Employee
SET Email = 'bharat@company.test'
WHERE Emp_ID = 202;

SELECT Emp_ID, Emp_Name, Email
FROM Employee
WHERE Email IS NOT NULL
ORDER BY Emp_ID;
10. Modify a Column Data Type
ALTER TABLE Employee
MODIFY (Designation VARCHAR2(50) NOT NULL);

DESC Employee;
11. View Conditional Records
SELECT Emp_ID, Emp_Name, Department, Salary
FROM Employee
WHERE Salary >= 45000
ORDER BY Salary DESC, Emp_ID;
12. Delete a Selected Employee
DELETE FROM Employee
WHERE Emp_ID = 209;

SELECT COUNT(*) AS Total_Employees
FROM Employee;
13. Delete an Employee Using a Condition
DELETE FROM Employee
WHERE Department = 'Operations' AND Emp_ID = 206;

SELECT Emp_ID, Emp_Name, Department
FROM Employee
ORDER BY Emp_ID;
14. View Final Payroll
SELECT Emp_ID, Emp_Name, Department, Salary, Email
FROM Employee
ORDER BY Emp_ID;
15. Verify Final Employee Count
SELECT COUNT(*) AS Final_Count
FROM Employee;
16. View Sales Employees
SELECT Emp_Name, Salary
FROM Employee
WHERE Department = 'Sales'
ORDER BY Emp_ID;
17. Display Employee Table Structure
DESC Employee;
COMMIT;
