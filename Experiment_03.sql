Experiment 3: DCL and TCL Commands

MySQL Queries

1. Create Database and BankAccount Table
CREATE DATABASE IF NOT EXISTS BankDB;
USE BankDB;

CREATE TABLE BankAccount (
    Account_ID INT PRIMARY KEY,
    Holder_Name VARCHAR(50) NOT NULL,
    Branch VARCHAR(30) NOT NULL,
    Balance DECIMAL(12,2) NOT NULL CHECK (Balance >= 0),
    Account_Type VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

2. Insert Five Bank Accounts
INSERT INTO BankAccount VALUES
(201, 'Anand', 'Chennai', 50000, 'Savings'),
(202, 'Bhavya', 'Hyderabad', 35000, 'Savings'),
(203, 'Charan', 'Vijayawada', 20000, 'Current'),
(204, 'Deepa', 'Chennai', 45000, 'Savings'),
(205, 'Eshan', 'Bengaluru', 60000, 'Current');

3. Display Account Balances
SELECT Account_ID, Holder_Name, Balance
FROM BankAccount
ORDER BY Account_ID;

4. Create a Bank Teller User
CREATE USER 'lab_teller3'@'localhost'
IDENTIFIED BY 'LabDemo_ChangeMe_2026!';

5. Grant Read Access
GRANT SELECT ON BankDB.BankAccount
TO 'lab_teller3'@'localhost';

6. Verify Assigned Privileges
SHOW GRANTS FOR 'lab_teller3'@'localhost';

7. Test Teller Permissions
SELECT Account_ID, Balance
FROM BankDB.BankAccount;

UPDATE BankDB.BankAccount
SET Balance = Balance + 100
WHERE Account_ID = 201;

8. Revoke Read Access
REVOKE SELECT ON BankDB.BankAccount
FROM 'lab_teller3'@'localhost';

SHOW GRANTS FOR 'lab_teller3'@'localhost';

9. Commit a Deposit
START TRANSACTION;

UPDATE BankAccount
SET Balance = Balance + 5000
WHERE Account_ID = 201;

COMMIT;

SELECT Account_ID, Balance
FROM BankAccount
WHERE Account_ID = 201;

10. Rollback a Withdrawal
START TRANSACTION;

UPDATE BankAccount
SET Balance = Balance - 3000
WHERE Account_ID = 202;

ROLLBACK;

SELECT Account_ID, Balance
FROM BankAccount
WHERE Account_ID = 202;

11. Savepoint and Partial Rollback
START TRANSACTION;

UPDATE BankAccount
SET Balance = Balance + 1000
WHERE Account_ID = 203;

SAVEPOINT after_first_change;

UPDATE BankAccount
SET Balance = Balance + 2000
WHERE Account_ID = 204;

ROLLBACK TO SAVEPOINT after_first_change;

COMMIT;

SELECT Account_ID, Balance
FROM BankAccount
WHERE Account_ID IN (203, 204)
ORDER BY Account_ID;

12. Transfer Funds Between Accounts
START TRANSACTION;

UPDATE BankAccount
SET Balance = Balance - 4000
WHERE Account_ID = 201
AND Balance >= 4000;

UPDATE BankAccount
SET Balance = Balance + 4000
WHERE Account_ID = 202;

COMMIT;

SELECT Account_ID, Balance
FROM BankAccount
WHERE Account_ID IN (201, 202)
ORDER BY Account_ID;

13. Release Savepoint
START TRANSACTION;
SAVEPOINT test_point;
RELEASE SAVEPOINT test_point;
ROLLBACK;

14. Remove the Test User
DROP USER 'lab_teller3'@'localhost';

15. Display All Account Balances
SELECT Account_ID, Balance
FROM BankAccount
ORDER BY Account_ID;

16. Calculate Total Bank Balance
SELECT SUM(Balance) AS Total_Balance
FROM BankAccount;




Oracle SQL Queries

1. Create BankAccount Table
CREATE TABLE BankAccount (
Account_ID NUMBER PRIMARY KEY,
Holder_Name VARCHAR2(50) NOT NULL,
Branch VARCHAR2(30) NOT NULL,
Balance NUMBER(12,2) NOT NULL CHECK (Balance >= 0),
Account_Type VARCHAR2(20) NOT NULL
);

2. Insert Five Bank Accounts
INSERT ALL
INTO BankAccount VALUES (201, 'Anand', 'Chennai', 50000, 'Savings')
INTO BankAccount VALUES (202, 'Bhavya', 'Hyderabad', 35000, 'Savings')
INTO BankAccount VALUES (203, 'Charan', 'Vijayawada', 20000, 'Current')
INTO BankAccount VALUES (204, 'Deepa', 'Chennai', 45000, 'Savings')
INTO BankAccount VALUES (205, 'Eshan', 'Bengaluru', 60000, 'Current')
SELECT 1 FROM DUAL;
COMMIT;

3. Display Account Balances
SELECT Account_ID, Holder_Name, Balance
FROM BankAccount
ORDER BY Account_ID;

4. Create a Bank Teller User
CREATE USER lab_teller3 IDENTIFIED BY "LabDemo_ChangeMe_2026!";

5. Grant Read Access
GRANT SELECT ON BankAccount TO lab_teller3;

6. Verify Assigned Privileges
SELECT GRANTEE, TABLE_NAME, PRIVILEGE
FROM USER_TAB_PRIVS_MADE
WHERE GRANTEE = 'LAB_TELLER3';

7. Test Teller Permissions
SELECT Account_ID, Balance
FROM BankAccount;

UPDATE BankAccount
SET Balance = Balance + 100
WHERE Account_ID = 201;

8. Revoke Read Access
REVOKE SELECT ON BankAccount FROM lab_teller3;

SELECT GRANTEE, TABLE_NAME, PRIVILEGE
FROM USER_TAB_PRIVS_MADE
WHERE GRANTEE = 'LAB_TELLER3';

9. Commit a Deposit
UPDATE BankAccount
SET Balance = Balance + 5000
WHERE Account_ID = 201;
COMMIT;

SELECT Account_ID, Balance
FROM BankAccount
WHERE Account_ID = 201;

10. Rollback a Withdrawal
UPDATE BankAccount
SET Balance = Balance - 3000
WHERE Account_ID = 202;
ROLLBACK;

SELECT Account_ID, Balance
FROM BankAccount
WHERE Account_ID = 202;

11. Savepoint and Partial Rollback
UPDATE BankAccount
SET Balance = Balance + 1000
WHERE Account_ID = 203;

SAVEPOINT after_first_change;

UPDATE BankAccount
SET Balance = Balance + 2000
WHERE Account_ID = 204;

ROLLBACK TO after_first_change;
COMMIT;

SELECT Account_ID, Balance
FROM BankAccount
WHERE Account_ID IN (203, 204)
ORDER BY Account_ID;

12. Transfer Funds Between Accounts
UPDATE BankAccount
SET Balance = Balance - 4000
WHERE Account_ID = 201
AND Balance >= 4000;

UPDATE BankAccount
SET Balance = Balance + 4000
WHERE Account_ID = 202;
COMMIT;

SELECT Account_ID, Balance
FROM BankAccount
WHERE Account_ID IN (201, 202)
ORDER BY Account_ID;

13. Rollback a Transaction Using a Savepoint
SAVEPOINT test_point;
ROLLBACK TO test_point;
ROLLBACK;

14. Remove the Test User
DROP USER lab_teller3;

15. Display All Account Balances
SELECT Account_ID, Balance
FROM BankAccount
ORDER BY Account_ID;

16. Calculate Total Bank Balance
SELECT SUM(Balance) AS Total_Balance
FROM BankAccount;
