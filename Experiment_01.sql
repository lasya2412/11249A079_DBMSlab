Experiment 1: Basic SQL Queries

MySQL Queries
1. Create Database
CREATE DATABASE UniversityDB;
2. Select Database
USE UniversityDB;
3. Create Student Table
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50) NOT NULL,
    Department VARCHAR(20) NOT NULL,
    Year INT NOT NULL,
    Age INT,
    Gender VARCHAR(10),
    Marks DECIMAL(5,2),
    City VARCHAR(30)
);
4. Describe Student Table
DESC Student;
5. Insert Student Records
INSERT INTO Student VALUES
(101, 'Arun', 'CSE', 2, 19, 'Male', 85, 'Chennai'),
(102, 'Priya', 'ECE', 3, 20, 'Female', 92, 'Hyderabad'),
(103, 'Ravi', 'CSE', 2, 19, 'Male', 67, 'Vijayawada'),
(104, 'Sneha', 'AIML', 1, 18, 'Female', 88, 'Bengaluru'),
(105, 'Kiran', 'EEE', 4, 21, 'Male', 56, 'Chennai'),
(106, 'Divya', 'CSE', 3, 20, 'Female', 94, 'Tirupati'),
(107, 'Rahul', 'MECH', 2, 19, 'Male', 72, 'Nellore'),
(108, 'Anjali', 'AIML', 1, 18, 'Female', 81, 'Hyderabad'),
(109, 'Naveen', 'ECE', 4, 21, 'Male', 63, 'Guntur'),
(110, 'Kavya', 'CSE', 3, 20, 'Female', 90, 'Chennai');
6. Display All Student Records
SELECT *
FROM Student
ORDER BY Student_ID;
7. Display Selected Columns
SELECT Student_ID, Student_Name, Department
FROM Student
ORDER BY Student_ID;
8. Retrieve Students from CSE Department
SELECT Student_ID, Student_Name, Department
FROM Student
WHERE Department = 'CSE'
ORDER BY Student_ID;
9. Retrieve CSE Students Scoring Above 80
SELECT Student_Name, Department, Marks
FROM Student
WHERE Department = 'CSE' AND Marks > 80
ORDER BY Student_ID;
10. Retrieve Students from AIML or ECE
SELECT Student_Name, Department
FROM Student
WHERE Department = 'AIML' OR Department = 'ECE'
ORDER BY Student_ID;
11. Display Unique Departments
SELECT DISTINCT Department
FROM Student
ORDER BY Department;
12. Sort Students by Marks in Ascending Order
SELECT Student_Name, Marks
FROM Student
ORDER BY Marks ASC;
13. Sort Students by Marks in Descending Order
SELECT Student_Name, Marks
FROM Student
ORDER BY Marks DESC;
14. Retrieve Students Scoring Between 70 and 90
SELECT Student_Name, Marks
FROM Student
WHERE Marks BETWEEN 70 AND 90
ORDER BY Marks ASC;
15. Retrieve Students Whose Names Start with A
SELECT Student_ID, Student_Name
FROM Student
WHERE Student_Name LIKE 'A%'
ORDER BY Student_ID;
16. Retrieve Students from Selected Departments Using IN
SELECT Student_Name, Department
FROM Student
WHERE Department IN ('CSE', 'ECE', 'AIML')
ORDER BY Student_ID;
17. Retrieve Students Whose City Is NULL
SELECT Student_ID, Student_Name, City
FROM Student
WHERE City IS NULL;
18. Retrieve the Top Three Students by Marks
SELECT Student_Name, Department, Marks
FROM Student
ORDER BY Marks DESC, Student_ID ASC
LIMIT 3;
19. Count Total Students
SELECT COUNT(*) AS Total
FROM Student;
20. Count Distinct Departments
SELECT COUNT(DISTINCT Department) AS Departments
FROM Student;
21. Find the Highest and Lowest Marks
SELECT MAX(Marks) AS Highest, MIN(Marks) AS Lowest
FROM Student;




Oracle SQL Queries
1. Create Student Table
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR2(50) NOT NULL,
    Department VARCHAR2(20) NOT NULL,
    Year INT NOT NULL,
    Age INT,
    Gender VARCHAR2(10),
    Marks DECIMAL(5,2),
    City VARCHAR2(30)
);
2. Describe Student Table
DESC Student;
3. Insert Student Records
INSERT ALL
    INTO Student VALUES (101, 'Arun', 'CSE', 2, 19, 'Male', 85, 'Chennai')
    INTO Student VALUES (102, 'Priya', 'ECE', 3, 20, 'Female', 92, 'Hyderabad')
    INTO Student VALUES (103, 'Ravi', 'CSE', 2, 19, 'Male', 67, 'Vijayawada')
    INTO Student VALUES (104, 'Sneha', 'AIML', 1, 18, 'Female', 88, 'Bengaluru')
    INTO Student VALUES (105, 'Kiran', 'EEE', 4, 21, 'Male', 56, 'Chennai')
    INTO Student VALUES (106, 'Divya', 'CSE', 3, 20, 'Female', 94, 'Tirupati')
    INTO Student VALUES (107, 'Rahul', 'MECH', 2, 19, 'Male', 72, 'Nellore')
    INTO Student VALUES (108, 'Anjali', 'AIML', 1, 18, 'Female', 81, 'Hyderabad')
    INTO Student VALUES (109, 'Naveen', 'ECE', 4, 21, 'Male', 63, 'Guntur')
    INTO Student VALUES (110, 'Kavya', 'CSE', 3, 20, 'Female', 90, 'Chennai')
SELECT 1 FROM DUAL;
COMMIT;
4. Display All Student Records
SELECT *
FROM Student
ORDER BY Student_ID;
5. Display Selected Columns
SELECT Student_ID, Student_Name, Department
FROM Student
ORDER BY Student_ID;
6. Retrieve Students from CSE Department
SELECT Student_ID, Student_Name, Department
FROM Student
WHERE Department = 'CSE'
ORDER BY Student_ID;
7. Retrieve CSE Students Scoring Above 80
SELECT Student_Name, Department, Marks
FROM Student
WHERE Department = 'CSE' AND Marks > 80
ORDER BY Student_ID;
8. Retrieve Students from AIML or ECE
SELECT Student_Name, Department
FROM Student
WHERE Department = 'AIML' OR Department = 'ECE'
ORDER BY Student_ID;
9. Display Unique Departments
SELECT DISTINCT Department
FROM Student
ORDER BY Department;
10. Sort Students by Marks in Ascending Order
SELECT Student_Name, Marks
FROM Student
ORDER BY Marks ASC;
11. Sort Students by Marks in Descending Order
SELECT Student_Name, Marks
FROM Student
ORDER BY Marks DESC;
12. Retrieve Students Scoring Between 70 and 90
SELECT Student_Name, Marks
FROM Student
WHERE Marks BETWEEN 70 AND 90
ORDER BY Marks ASC;
13. Retrieve Students Whose Names Start with A
SELECT Student_ID, Student_Name
FROM Student
WHERE Student_Name LIKE 'A%'
ORDER BY Student_ID;
14. Retrieve Students from Selected Departments Using IN
SELECT Student_Name, Department
FROM Student
WHERE Department IN ('CSE', 'ECE', 'AIML')
ORDER BY Student_ID;
15. Retrieve Students Whose City Is NULL
SELECT Student_ID, Student_Name, City
FROM Student
WHERE City IS NULL;
16. Retrieve the Top Three Students by Marks
SELECT Student_Name, Department, Marks
FROM Student
ORDER BY Marks DESC, Student_ID ASC
FETCH FIRST 3 ROWS ONLY;
17. Count Total Students
SELECT COUNT(*) AS Total
FROM Student;
18. Count Distinct Departments
SELECT COUNT(DISTINCT Department) AS Departments
FROM Student;
19. Find the Highest and Lowest Marks
SELECT MAX(Marks) AS Highest, MIN(Marks) AS Lowest
FROM Student;
