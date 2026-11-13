
-- =========================================
-- BANKING CUSTOMER & TRANSACTION ANALYTICS
-- =========================================

CREATE DATABASE IF NOT EXISTS banking_analytics_db;

USE banking_analytics_db;

-- =========================================
-- 1. BRANCHES TABLE
-- =========================================

CREATE TABLE branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL
);

INSERT INTO branches VALUES
(1, 'Central Branch', 'Patna', 'Bihar'),
(2, 'City Branch', 'Ranchi', 'Jharkhand'),
(3, 'Main Branch', 'Delhi', 'Delhi'),
(4, 'Business Branch', 'Mumbai', 'Maharashtra'),
(5, 'North Branch', 'Lucknow', 'Uttar Pradesh');


-- =========================================
-- 2. CUSTOMERS TABLE
-- =========================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    city VARCHAR(100),
    registration_date DATE
);

INSERT INTO customers VALUES
(1, 'Aarav', 'Sharma', 'Male', '1995-04-12', 'Patna', '2024-01-15'),
(2, 'Priya', 'Verma', 'Female', '1998-07-22', 'Ranchi', '2024-02-10'),
(3, 'Rahul', 'Kumar', 'Male', '1992-11-05', 'Delhi', '2024-02-18'),
(4, 'Ananya', 'Singh', 'Female', '1997-03-16', 'Mumbai', '2024-03-01'),
(5, 'Rohan', 'Gupta', 'Male', '1994-08-30', 'Lucknow', '2024-03-12'),
(6, 'Sneha', 'Mishra', 'Female', '1999-01-19', 'Patna', '2024-03-25'),
(7, 'Vikram', 'Yadav', 'Male', '1991-06-11', 'Ranchi', '2024-04-02'),
(8, 'Kavya', 'Reddy', 'Female', '1996-09-14', 'Delhi', '2024-04-15'),
(9, 'Arjun', 'Mehta', 'Male', '1993-12-08', 'Mumbai', '2024-05-01'),
(10, 'Neha', 'Jain', 'Female', '1998-05-25', 'Lucknow', '2024-05-14'),
(11, 'Aditya', 'Das', 'Male', '1990-02-17', 'Patna', '2024-05-28'),
(12, 'Isha', 'Agarwal', 'Female', '1997-10-09', 'Ranchi', '2024-06-05'),
(13, 'Karan', 'Malhotra', 'Male', '1995-07-03', 'Delhi', '2024-06-19'),
(14, 'Meera', 'Nair', 'Female', '1992-04-27', 'Mumbai', '2024-07-02'),
(15, 'Sahil', 'Khan', 'Male', '1996-11-21', 'Lucknow', '2024-07-16'),
(16, 'Pooja', 'Roy', 'Female', '1994-01-13', 'Patna', '2024-08-01'),
(17, 'Dev', 'Chopra', 'Male', '1999-08-06', 'Ranchi', '2024-08-12'),
(18, 'Riya', 'Saxena', 'Female', '1993-03-29', 'Delhi', '2024-09-01'),
(19, 'Manish', 'Tiwari', 'Male', '1991-12-15', 'Mumbai', '2024-09-15'),
(20, 'Simran', 'Kaur', 'Female', '1998-06-18', 'Lucknow', '2024-10-01');


-- =========================================
-- 3. ACCOUNTS TABLE
-- =========================================

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    account_type VARCHAR(30),
    opening_date DATE,
    account_balance DECIMAL(12,2),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
);

INSERT INTO accounts VALUES
(1, 1, 1, 'Savings', '2024-01-15', 85000),
(2, 2, 2, 'Current', '2024-02-10', 125000),
(3, 3, 3, 'Savings', '2024-02-18', 45000),
(4, 4, 4, 'Salary', '2024-03-01', 98000),
(5, 5, 5, 'Savings', '2024-03-12', 67000),
(6, 6, 1, 'Current', '2024-03-25', 150000),
(7, 7, 2, 'Savings', '2024-04-02', 52000),
(8, 8, 3, 'Salary', '2024-04-15', 110000),
(9, 9, 4, 'Savings', '2024-05-01', 76000),
(10, 10, 5, 'Current', '2024-05-14', 190000),
(11, 11, 1, 'Savings', '2024-05-28', 62000),
(12, 12, 2, 'Salary', '2024-06-05', 88000),
(13, 13, 3, 'Current', '2024-06-19', 210000),
(14, 14, 4, 'Savings', '2024-07-02', 73000),
(15, 15, 5, 'Salary', '2024-07-16', 95000),
(16, 16, 1, 'Savings', '2024-08-01', 58000),
(17, 17, 2, 'Current', '2024-08-12', 175000),
(18, 18, 3, 'Savings', '2024-09-01', 81000),
(19, 19, 4, 'Salary', '2024-09-15', 105000),
(20, 20, 5, 'Savings', '2024-10-01', 69000),
(21, 1, 2, 'Current', '2024-04-01', 145000),
(22, 2, 3, 'Savings', '2024-05-01', 72000),
(23, 3, 4, 'Salary', '2024-06-01', 92000),
(24, 4, 5, 'Savings', '2024-07-01', 63000),
(25, 5, 1, 'Current', '2024-08-01', 180000),
(26, 6, 2, 'Savings', '2024-09-01', 54000),
(27, 7, 3, 'Salary', '2024-10-01', 102000),
(28, 8, 4, 'Current', '2024-11-01', 160000),
(29, 9, 5, 'Savings', '2024-12-01', 78000),
(30, 10, 1, 'Salary', '2025-01-01', 115000);


-- =========================================
-- 4. TRANSACTIONS TABLE
-- =========================================

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_type VARCHAR(20) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    transaction_date DATETIME NOT NULL,
    transaction_status VARCHAR(20) NOT NULL,
    channel VARCHAR(30),

    FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
);

-- Generate 100 transactions automatically.
-- MySQL 8.0 recursive CTE.

INSERT INTO transactions (
    transaction_id,
    account_id,
    transaction_type,
    amount,
    transaction_date,
    transaction_status,
    channel
)
WITH RECURSIVE seq AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM seq
    WHERE n < 100
)
SELECT
    n,
    MOD(n - 1, 30) + 1,

    CASE
        WHEN MOD(n, 2) = 0 THEN 'Deposit'
        ELSE 'Withdrawal'
    END,

    ROUND(500 + MOD(n * 137, 20000), 2),

    DATE_ADD(
        '2025-01-01 09:00:00',
        INTERVAL (n * 3) DAY
    ),

    CASE
        WHEN MOD(n, 10) = 0 THEN 'Failed'
        WHEN MOD(n, 7) = 0 THEN 'Pending'
        ELSE 'Success'
    END,

    CASE
        WHEN MOD(n, 3) = 0 THEN 'ATM'
        WHEN MOD(n, 3) = 1 THEN 'Online'
        ELSE 'Branch'
    END

FROM seq;


-- =========================================
-- 5. LOANS TABLE
-- =========================================

CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    loan_type VARCHAR(30),
    loan_amount DECIMAL(12,2),
    interest_rate DECIMAL(5,2),
    loan_date DATE,
    loan_status VARCHAR(30),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
);

INSERT INTO loans VALUES
(1, 1, 1, 'Home Loan', 2500000, 8.50, '2024-02-01', 'Active'),
(2, 2, 2, 'Personal Loan', 300000, 11.00, '2024-03-15', 'Closed'),
(3, 3, 3, 'Car Loan', 800000, 9.25, '2024-04-10', 'Active'),
(4, 4, 4, 'Education Loan', 500000, 7.50, '2024-05-20', 'Active'),
(5, 5, 5, 'Home Loan', 3200000, 8.75, '2024-06-05', 'Pending'),
(6, 6, 1, 'Personal Loan', 250000, 12.00, '2024-06-18', 'Active'),
(7, 7, 2, 'Car Loan', 950000, 9.50, '2024-07-12', 'Closed'),
(8, 8, 3, 'Home Loan', 2800000, 8.25, '2024-08-01', 'Active'),
(9, 9, 4, 'Business Loan', 1500000, 10.50, '2024-08-15', 'Active'),
(10, 10, 5, 'Personal Loan', 400000, 11.50, '2024-09-10', 'Rejected'),
(11, 11, 1, 'Education Loan', 600000, 7.75, '2024-09-25', 'Active'),
(12, 12, 2, 'Home Loan', 3500000, 8.60, '2024-10-05', 'Active'),
(13, 13, 3, 'Car Loan', 1100000, 9.00, '2024-10-20', 'Pending'),
(14, 14, 4, 'Business Loan', 2000000, 10.00, '2024-11-01', 'Active'),
(15, 15, 5, 'Personal Loan', 350000, 11.25, '2024-11-15', 'Closed'),
(16, 16, 1, 'Education Loan', 450000, 7.80, '2024-12-01', 'Active'),
(17, 17, 2, 'Home Loan', 4000000, 8.40, '2024-12-15', 'Active'),
(18, 18, 3, 'Car Loan', 900000, 9.30, '2025-01-05', 'Rejected'),
(19, 19, 4, 'Business Loan', 1800000, 10.25, '2025-01-20', 'Active'),
(20, 20, 5, 'Personal Loan', 275000, 11.75, '2025-02-01', 'Pending');


-- =========================================
-- END OF DATABASE SETUP
-- =========================================


USE banking_analytics_db;


SHOW TABLES;

SELECT 'branches' AS table_name, COUNT(*) AS total_rows
FROM branches

UNION ALL

SELECT 'customers', COUNT(*) FROM customers

UNION ALL

SELECT 'accounts', COUNT(*) FROM accounts

UNION ALL

SELECT 'transactions', COUNT(*) FROM transactions

UNION ALL

SELECT 'loans', COUNT(*) FROM loans;


-- Check transaction statuses
SELECT transaction_status, COUNT(*) AS total
FROM transactions
GROUP BY transaction_status;

-- Check transaction types
SELECT transaction_type, COUNT(*) AS total
FROM transactions
GROUP BY transaction_type;

-- Check transaction date range
SELECT
    MIN(transaction_date) AS first_transaction,
    MAX(transaction_date) AS last_transaction
FROM transactions;

-- Check account distribution
SELECT account_type, COUNT(*) AS total_accounts
FROM accounts
GROUP BY account_type;



