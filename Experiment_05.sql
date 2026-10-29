Experiment 5 – Advanced SQL Queries and Set Operators

MySQL SQL Queries

1. Create and Select Database

CREATE DATABASE IF NOT EXISTS LibraryExp5;
USE LibraryExp5;


2. Create Books Table

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(80) NOT NULL,
    category VARCHAR(30) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    copies INT NOT NULL,
    CHECK (price >= 0),
    CHECK (copies >= 0)
);


3. Create Members Table

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(60) NOT NULL,
    department VARCHAR(20) NOT NULL
);


4. Create Loans Table

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);


5. Insert Book Records

INSERT INTO Books VALUES
(1, 'SQL Basics', 'Database', 400, 5),
(2, 'Advanced SQL', 'Database', 650, 3),
(3, 'Python Guide', 'Programming', 550, 4),
(4, 'Java Handbook', 'Programming', 700, 2),
(5, 'Data Science', 'Analytics', 900, 2),
(6, 'Statistics 101', 'Analytics', 450, 6),
(7, 'Web Design', 'Web', 300, 5),
(8, 'Cloud Computing', 'Cloud', 800, 3);


6. Insert Member Records

INSERT INTO Members VALUES
(101, 'Asha', 'CSE'),
(102, 'Bala', 'ECE'),
(103, 'Charan', 'CSE'),
(104, 'Deepa', 'AIML'),
(105, 'Esha', 'MECH');


7. Insert Loan Records

INSERT INTO Loans VALUES
(201, 1, 101, '2026-09-01'),
(202, 3, 101, '2026-09-02'),
(203, 2, 102, '2026-09-03'),
(204, 5, 104, '2026-09-04'),
(205, 4, 103, '2026-09-05');


8. IN Operator

SELECT book_id, title
FROM Books
WHERE category IN ('Database', 'Analytics')
ORDER BY book_id;


9. ANY Operator

SELECT book_id, title, price
FROM Books
WHERE price > ANY (
    SELECT price
    FROM Books
    WHERE category = 'Database'
)
ORDER BY book_id;


10. ALL Operator

SELECT book_id, title, price
FROM Books
WHERE price > ALL (
    SELECT price
    FROM Books
    WHERE category = 'Database'
)
ORDER BY book_id;


11. EXISTS Operator

SELECT m.member_id, m.member_name
FROM Members m
WHERE EXISTS (
    SELECT 1
    FROM Loans l
    WHERE l.member_id = m.member_id
)
ORDER BY m.member_id;


12. NOT EXISTS Operator

SELECT m.member_id, m.member_name
FROM Members m
WHERE NOT EXISTS (
    SELECT 1
    FROM Loans l
    WHERE l.member_id = m.member_id
)
ORDER BY m.member_id;


13. IN Subquery

SELECT book_id, title
FROM Books
WHERE book_id IN (
    SELECT book_id
    FROM Loans
)
ORDER BY book_id;


14. UNION Operator

SELECT member_name
FROM Members
WHERE department = 'CSE'

UNION

SELECT member_name
FROM Members
WHERE department = 'AIML'

ORDER BY member_name;


15. INTERSECT Operator

SELECT member_id
FROM Members
WHERE department = 'CSE'

INTERSECT

SELECT member_id
FROM Loans

ORDER BY member_id;


16. UNION Operator with Price Conditions

SELECT title
FROM Books
WHERE price < 500

UNION

SELECT title
FROM Books
WHERE price > 750

ORDER BY title;


17. INTERSECT Programming Books with Loans

SELECT book_id
FROM Books
WHERE category = 'Programming'

INTERSECT

SELECT book_id
FROM Loans

ORDER BY book_id;


18. Find Books Never Borrowed

SELECT b.book_id, b.title
FROM Books b
WHERE NOT EXISTS (
    SELECT 1
    FROM Loans l
    WHERE l.book_id = b.book_id
)
ORDER BY b.book_id;


19. Test CHECK Constraint

INSERT INTO Books VALUES
(9, 'Invalid Price', 'Test', -50, 2);


20. Test Foreign Key Constraint

INSERT INTO Loans VALUES
(206, 999, 101, '2026-09-06');


21. Verify Table Counts

SELECT
    (SELECT COUNT(*) FROM Books) AS books,
    (SELECT COUNT(*) FROM Members) AS members,
    (SELECT COUNT(*) FROM Loans) AS loans;





Oracle SQL Queries

1. Create Books Table

CREATE TABLE Books (
    book_id NUMBER(5) PRIMARY KEY,
    title VARCHAR2(80) NOT NULL,
    category VARCHAR2(30) NOT NULL,
    price NUMBER(8,2) NOT NULL CHECK (price >= 0),
    copies NUMBER(5) NOT NULL CHECK (copies >= 0)
);


2. Create Members Table

CREATE TABLE Members (
    member_id NUMBER(5) PRIMARY KEY,
    member_name VARCHAR2(60) NOT NULL,
    department VARCHAR2(20) NOT NULL
);


3. Create Loans Table

CREATE TABLE Loans (
    loan_id NUMBER(5) PRIMARY KEY,
    book_id NUMBER(5) NOT NULL,
    member_id NUMBER(5) NOT NULL,
    loan_date DATE NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);


4. Insert Book Records

INSERT ALL
    INTO Books VALUES (1, 'SQL Basics', 'Database', 400, 5)
    INTO Books VALUES (2, 'Advanced SQL', 'Database', 650, 3)
    INTO Books VALUES (3, 'Python Guide', 'Programming', 550, 4)
    INTO Books VALUES (4, 'Java Handbook', 'Programming', 700, 2)
    INTO Books VALUES (5, 'Data Science', 'Analytics', 900, 2)
    INTO Books VALUES (6, 'Statistics 101', 'Analytics', 450, 6)
    INTO Books VALUES (7, 'Web Design', 'Web', 300, 5)
    INTO Books VALUES (8, 'Cloud Computing', 'Cloud', 800, 3)
SELECT 1 FROM DUAL;


5. Insert Member Records

INSERT ALL
    INTO Members VALUES (101, 'Asha', 'CSE')
    INTO Members VALUES (102, 'Bala', 'ECE')
    INTO Members VALUES (103, 'Charan', 'CSE')
    INTO Members VALUES (104, 'Deepa', 'AIML')
    INTO Members VALUES (105, 'Esha', 'MECH')
SELECT 1 FROM DUAL;


6. Insert Loan Records

INSERT ALL
    INTO Loans VALUES (201, 1, 101, DATE '2026-09-01')
    INTO Loans VALUES (202, 3, 101, DATE '2026-09-02')
    INTO Loans VALUES (203, 2, 102, DATE '2026-09-03')
    INTO Loans VALUES (204, 5, 104, DATE '2026-09-04')
    INTO Loans VALUES (205, 4, 103, DATE '2026-09-05')
SELECT 1 FROM DUAL;


7. IN Operator

SELECT book_id, title
FROM Books
WHERE category IN ('Database', 'Analytics')
ORDER BY book_id;


8. ANY Operator

SELECT book_id, title, price
FROM Books
WHERE price > ANY (
    SELECT price
    FROM Books
    WHERE category = 'Database'
)
ORDER BY book_id;


9. ALL Operator

SELECT book_id, title, price
FROM Books
WHERE price > ALL (
    SELECT price
    FROM Books
    WHERE category = 'Database'
)
ORDER BY book_id;


10. EXISTS Operator

SELECT m.member_id, m.member_name
FROM Members m
WHERE EXISTS (
    SELECT 1
    FROM Loans l
    WHERE l.member_id = m.member_id
)
ORDER BY m.member_id;


11. NOT EXISTS Operator

SELECT m.member_id, m.member_name
FROM Members m
WHERE NOT EXISTS (
    SELECT 1
    FROM Loans l
    WHERE l.member_id = m.member_id
)
ORDER BY m.member_id;


12. IN Subquery

SELECT book_id, title
FROM Books
WHERE book_id IN (
    SELECT book_id
    FROM Loans
)
ORDER BY book_id;


13. UNION Operator

SELECT member_name
FROM Members
WHERE department = 'CSE'

UNION

SELECT member_name
FROM Members
WHERE department = 'AIML'

ORDER BY member_name;


14. INTERSECT Operator

SELECT member_id
FROM Members
WHERE department = 'CSE'

INTERSECT

SELECT member_id
FROM Loans

ORDER BY member_id;


15. UNION Operator with Price Conditions

SELECT title
FROM Books
WHERE price < 500

UNION

SELECT title
FROM Books
WHERE price > 750

ORDER BY title;


16. INTERSECT Programming Books with Loans

SELECT book_id
FROM Books
WHERE category = 'Programming'

INTERSECT

SELECT book_id
FROM Loans

ORDER BY book_id;


17. Find Books Never Borrowed

SELECT b.book_id, b.title
FROM Books b
WHERE NOT EXISTS (
    SELECT 1
    FROM Loans l
    WHERE l.book_id = b.book_id
)
ORDER BY b.book_id;


18. Test CHECK Constraint

INSERT INTO Books VALUES
(9, 'Invalid Price', 'Test', -50, 2);


19. Test Foreign Key Constraint

INSERT INTO Loans VALUES
(206, 999, 101, DATE '2026-09-06');


20. Verify Table Counts

SELECT
    (SELECT COUNT(*) FROM Books) AS books,
    (SELECT COUNT(*) FROM Members) AS members,
    (SELECT COUNT(*) FROM Loans) AS loans
FROM DUAL;
