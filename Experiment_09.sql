Experiment 09: Creating Relationships Between Tables and Performing JOINs and Subqueries

MySQL SQL Queries

1. Creating and Selecting a Database

CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;

2. Creating Related Tables

CREATE TABLE Departments (
Dept_ID INT PRIMARY KEY,
Dept_Name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE Employees (
Emp_ID INT PRIMARY KEY,
Emp_Name VARCHAR(40) NOT NULL,
Dept_ID INT NOT NULL,
Salary DECIMAL(10,2) NOT NULL,
FOREIGN KEY (Dept_ID) REFERENCES Departments(Dept_ID)
);

CREATE TABLE Projects (
Project_ID INT PRIMARY KEY,
Project_Name VARCHAR(60) NOT NULL,
Dept_ID INT NOT NULL,
Budget DECIMAL(12,2) NOT NULL,
FOREIGN KEY (Dept_ID) REFERENCES Departments(Dept_ID)
);

CREATE TABLE Assignments (
Emp_ID INT NOT NULL,
Project_ID INT NOT NULL,
Hours INT NOT NULL,
PRIMARY KEY (Emp_ID, Project_ID),
FOREIGN KEY (Emp_ID) REFERENCES Employees(Emp_ID),
FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID)
);

3. Inserting Records into Tables

INSERT INTO Departments VALUES
(10,'Development'),
(20,'Testing'),
(30,'HR'),
(40,'Research');

INSERT INTO Employees VALUES
(101,'Arun',10,60000),
(102,'Priya',10,75000),
(103,'Ravi',20,50000),
(104,'Sneha',20,55000),
(105,'Kiran',30,45000),
(106,'Divya',40,90000),
(107,'Rahul',10,65000);

INSERT INTO Projects VALUES
(201,'Web Portal',10,300000),
(202,'Mobile App',10,450000),
(203,'QA Automation',20,200000),
(204,'AI Prototype',40,600000),
(205,'Recruitment Portal',30,120000);

INSERT INTO Assignments VALUES
(101,201,30),
(102,201,25),
(102,202,35),
(103,203,40),
(104,203,20),
(106,204,45),
(107,202,30);

4. INNER JOIN: Employees and Departments

SELECT e.Emp_Name, d.Dept_Name
FROM Employees e
INNER JOIN Departments d
ON e.Dept_ID = d.Dept_ID
ORDER BY e.Emp_ID;

5. JOIN Three Tables: Project Assignments

SELECT e.Emp_Name, p.Project_Name, a.Hours
FROM Assignments a
JOIN Employees e ON a.Emp_ID = e.Emp_ID
JOIN Projects p ON a.Project_ID = p.Project_ID
ORDER BY a.Emp_ID, a.Project_ID;

6. LEFT JOIN: All Employees Including Unassigned Employees

SELECT e.Emp_Name, p.Project_Name
FROM Employees e
LEFT JOIN Assignments a ON e.Emp_ID = a.Emp_ID
LEFT JOIN Projects p ON a.Project_ID = p.Project_ID
ORDER BY e.Emp_ID, p.Project_ID;

7. RIGHT JOIN: All Projects Including Unassigned Projects

SELECT p.Project_Name, e.Emp_Name
FROM Assignments a
RIGHT JOIN Projects p ON a.Project_ID = p.Project_ID
LEFT JOIN Employees e ON a.Emp_ID = e.Emp_ID
ORDER BY p.Project_ID, e.Emp_ID;

8. CROSS JOIN: Department and Project Combinations

SELECT d.Dept_Name, p.Project_Name
FROM Departments d
CROSS JOIN Projects p
WHERE d.Dept_ID = 30
ORDER BY p.Project_ID;

9. SELF JOIN: Employees Working in the Same Department

SELECT a.Emp_Name AS Employee1,
b.Emp_Name AS Employee2
FROM Employees a
JOIN Employees b
ON a.Dept_ID = b.Dept_ID
AND a.Emp_ID < b.Emp_ID
ORDER BY a.Emp_ID, b.Emp_ID;

10. Scalar Subquery: Employees Earning Above Average Salary

SELECT Emp_Name, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees)
ORDER BY Salary DESC;

11. IN Subquery: Employees in Departments with Projects Having a Budget of at Least 400000

SELECT Emp_Name, Dept_ID
FROM Employees
WHERE Dept_ID IN
(SELECT Dept_ID FROM Projects WHERE Budget >= 400000)
ORDER BY Emp_ID;

12. EXISTS: Employees Assigned to a Project

SELECT e.Emp_Name
FROM Employees e
WHERE EXISTS (
SELECT 1
FROM Assignments a
WHERE a.Emp_ID = e.Emp_ID
)
ORDER BY e.Emp_ID;

13. NOT EXISTS: Employees Without Project Assignments

SELECT e.Emp_Name
FROM Employees e
WHERE NOT EXISTS (
SELECT 1
FROM Assignments a
WHERE a.Emp_ID = e.Emp_ID
);

14. Correlated Subquery: Employees Earning Above Their Department Average

SELECT e.Emp_Name, e.Dept_ID, e.Salary
FROM Employees e
WHERE e.Salary > (
SELECT AVG(x.Salary)
FROM Employees x
WHERE x.Dept_ID = e.Dept_ID
)
ORDER BY e.Emp_ID;

15. MAX Subquery: Highest-Paid Employee

SELECT Emp_Name, Salary
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);

16. JOIN with GROUP BY: Number of Employees Assigned to Each Project

SELECT p.Project_Name, COUNT(a.Emp_ID) AS Staff
FROM Projects p
LEFT JOIN Assignments a
ON p.Project_ID = a.Project_ID
GROUP BY p.Project_ID, p.Project_Name
ORDER BY p.Project_ID;

17. NOT EXISTS: Projects Without Employees

SELECT p.Project_Name
FROM Projects p
WHERE NOT EXISTS (
SELECT 1
FROM Assignments a
WHERE a.Project_ID = p.Project_ID
);

18. Verifying the Number of Records

SELECT
(SELECT COUNT(*) FROM Departments) AS Departments,
(SELECT COUNT(*) FROM Employees) AS Employees,
(SELECT COUNT(*) FROM Projects) AS Projects,
(SELECT COUNT(*) FROM Assignments) AS Assignments;





Oracle SQL Queries

1. Creating Tables

CREATE TABLE Departments (
Dept_ID NUMBER PRIMARY KEY,
Dept_Name VARCHAR2(40) NOT NULL UNIQUE
);

CREATE TABLE Employees (
Emp_ID NUMBER PRIMARY KEY,
Emp_Name VARCHAR2(40) NOT NULL,
Dept_ID NUMBER NOT NULL,
Salary NUMBER(10,2) NOT NULL,
FOREIGN KEY (Dept_ID) REFERENCES Departments(Dept_ID)
);

CREATE TABLE Projects (
Project_ID NUMBER PRIMARY KEY,
Project_Name VARCHAR2(60) NOT NULL,
Dept_ID NUMBER NOT NULL,
Budget NUMBER(12,2) NOT NULL,
FOREIGN KEY (Dept_ID) REFERENCES Departments(Dept_ID)
);

CREATE TABLE Assignments (
Emp_ID NUMBER NOT NULL,
Project_ID NUMBER NOT NULL,
Hours NUMBER NOT NULL,
PRIMARY KEY (Emp_ID, Project_ID),
FOREIGN KEY (Emp_ID) REFERENCES Employees(Emp_ID),
FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID)
);

2. Inserting Records into Tables

INSERT ALL
INTO Departments VALUES (10,'Development')
INTO Departments VALUES (20,'Testing')
INTO Departments VALUES (30,'HR')
INTO Departments VALUES (40,'Research')
SELECT 1 FROM DUAL;

INSERT ALL
INTO Employees VALUES (101,'Arun',10,60000)
INTO Employees VALUES (102,'Priya',10,75000)
INTO Employees VALUES (103,'Ravi',20,50000)
INTO Employees VALUES (104,'Sneha',20,55000)
INTO Employees VALUES (105,'Kiran',30,45000)
INTO Employees VALUES (106,'Divya',40,90000)
INTO Employees VALUES (107,'Rahul',10,65000)
SELECT 1 FROM DUAL;

INSERT ALL
INTO Projects VALUES (201,'Web Portal',10,300000)
INTO Projects VALUES (202,'Mobile App',10,450000)
INTO Projects VALUES (203,'QA Automation',20,200000)
INTO Projects VALUES (204,'AI Prototype',40,600000)
INTO Projects VALUES (205,'Recruitment Portal',30,120000)
SELECT 1 FROM DUAL;

INSERT ALL
INTO Assignments VALUES (101,201,30)
INTO Assignments VALUES (102,201,25)
INTO Assignments VALUES (102,202,35)
INTO Assignments VALUES (103,203,40)
INTO Assignments VALUES (104,203,20)
INTO Assignments VALUES (106,204,45)
INTO Assignments VALUES (107,202,30)
SELECT 1 FROM DUAL;

COMMIT;

3. INNER JOIN: Employees and Departments

SELECT e.Emp_Name, d.Dept_Name
FROM Employees e
INNER JOIN Departments d
ON e.Dept_ID = d.Dept_ID
ORDER BY e.Emp_ID;

4. JOIN Three Tables: Project Assignments

SELECT e.Emp_Name, p.Project_Name, a.Hours
FROM Assignments a
JOIN Employees e ON a.Emp_ID = e.Emp_ID
JOIN Projects p ON a.Project_ID = p.Project_ID
ORDER BY a.Emp_ID, a.Project_ID;

5. LEFT JOIN: All Employees Including Unassigned Employees

SELECT e.Emp_Name, p.Project_Name
FROM Employees e
LEFT JOIN Assignments a ON e.Emp_ID = a.Emp_ID
LEFT JOIN Projects p ON a.Project_ID = p.Project_ID
ORDER BY e.Emp_ID, p.Project_ID;

6. RIGHT JOIN: All Projects Including Unassigned Projects

SELECT p.Project_Name, e.Emp_Name
FROM Assignments a
RIGHT JOIN Projects p ON a.Project_ID = p.Project_ID
LEFT JOIN Employees e ON a.Emp_ID = e.Emp_ID
ORDER BY p.Project_ID, e.Emp_ID;

7. CROSS JOIN: Department and Project Combinations

SELECT d.Dept_Name, p.Project_Name
FROM Departments d
CROSS JOIN Projects p
WHERE d.Dept_ID = 30
ORDER BY p.Project_ID;

8. SELF JOIN: Employees Working in the Same Department

SELECT a.Emp_Name AS Employee1,
b.Emp_Name AS Employee2
FROM Employees a
JOIN Employees b
ON a.Dept_ID = b.Dept_ID
AND a.Emp_ID < b.Emp_ID
ORDER BY a.Emp_ID, b.Emp_ID;

9. Scalar Subquery: Employees Earning Above Average Salary

SELECT Emp_Name, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees)
ORDER BY Salary DESC;

10. IN Subquery: Employees in Departments with Projects Having a Budget of at Least 400000

SELECT Emp_Name, Dept_ID
FROM Employees
WHERE Dept_ID IN (
SELECT Dept_ID
FROM Projects
WHERE Budget >= 400000
)
ORDER BY Emp_ID;

11. EXISTS: Employees Assigned to a Project

SELECT e.Emp_Name
FROM Employees e
WHERE EXISTS (
SELECT 1
FROM Assignments a
WHERE a.Emp_ID = e.Emp_ID
)
ORDER BY e.Emp_ID;

12. NOT EXISTS: Employees Without Project Assignments

SELECT e.Emp_Name
FROM Employees e
WHERE NOT EXISTS (
SELECT 1
FROM Assignments a
WHERE a.Emp_ID = e.Emp_ID
);

13. Correlated Subquery: Employees Earning Above Their Department Average

SELECT e.Emp_Name, e.Dept_ID, e.Salary
FROM Employees e
WHERE e.Salary > (
SELECT AVG(x.Salary)
FROM Employees x
WHERE x.Dept_ID = e.Dept_ID
)
ORDER BY e.Emp_ID;

14. MAX Subquery: Highest-Paid Employee

SELECT Emp_Name, Salary
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);

15. JOIN with GROUP BY: Number of Employees Assigned to Each Project

SELECT p.Project_Name, COUNT(a.Emp_ID) AS Staff
FROM Projects p
LEFT JOIN Assignments a
ON p.Project_ID = a.Project_ID
GROUP BY p.Project_ID, p.Project_Name
ORDER BY p.Project_ID;

16. NOT EXISTS: Projects Without Employees

SELECT p.Project_Name
FROM Projects p
WHERE NOT EXISTS (
SELECT 1
FROM Assignments a
WHERE a.Project_ID = p.Project_ID
);

17. Verifying the Number of Records

SELECT
(SELECT COUNT(*) FROM Departments) AS Departments,
(SELECT COUNT(*) FROM Employees) AS Employees,
(SELECT COUNT(*) FROM Projects) AS Projects,
(SELECT COUNT(*) FROM Assignments) AS Assignments
FROM DUAL;
