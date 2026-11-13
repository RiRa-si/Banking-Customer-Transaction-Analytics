-- Q4: Total Deposits and Withdrawals
-- Objective: Calculate the number and total value
-- of successful deposits and withdrawals.

select * from transactions;

select transaction_type , count(transaction_id) as total_transaction , 
sum(amount) as total_amount
from transactions
where transaction_status = "Success"
group by transaction_type
order by total_amount desc;

-- =====================================================
-- Q5: TRANSACTION STATUS ANALYSIS
-- =====================================================

-- Business Scenario:
-- The bank's management wants to understand the
-- distribution of successful, failed and pending
-- transactions.

-- Requirements:
-- 1. Display transaction_status.
-- 2. Calculate the total number of transactions
--    for each status.
-- 3. Calculate the total transaction amount for
--    each status.
-- 4. Calculate the average transaction amount
--    for each status.
-- 5. Group the results by transaction_status.
-- 6. Sort by total number of transactions
--    in descending order.

-- SQL Concepts:
-- GROUP BY, COUNT(), SUM(), AVG(), ORDER BY

select transaction_status , count(transaction_id) as total_transactions , sum(amount) as total_amount , 
avg(amount) as avg_amount
from transactions
group by transaction_status
order by total_transactions desc;


-- =====================================================
-- Q6: TRANSACTION AMOUNT SUMMARY
-- =====================================================

-- Business Scenario:
-- The bank wants to understand the distribution
-- of transaction amounts.

-- Requirements:
-- 1. Calculate the highest transaction amount.
-- 2. Calculate the lowest transaction amount.
-- 3. Calculate the average transaction amount.
-- 4. Calculate the total transaction amount.
-- 5. Consider only successful transactions.

-- SQL Concepts:
-- MAX(), MIN(), AVG(), SUM(), ROUND(), WHERE

-- Write your query below:
select * from transactions;

select max(amount) as high_transaction, min(amount) as low_transaction , round(avg(amount),2) as avg_transaction , sum(amount) as total_transaction,
COUNT(transaction_id) AS total_transactions
from transactions
where transaction_status = "Success";

-- =====================================================
-- Q7: HIGH-VALUE TRANSACTION ANALYSIS
-- =====================================================

-- Business Scenario:
-- The bank wants to identify high-value transactions
-- for monitoring and analysis.

-- Requirements:
-- 1. Display transaction_id.
-- 2. Display account_id.
-- 3. Display transaction_type.
-- 4. Display amount.
-- 5. Display transaction_date.
-- 6. Consider only successful transactions.
-- 7. Find transactions with an amount greater than 10000.
-- 8. Sort by amount in descending order.

-- SQL Concepts:
-- SELECT, WHERE, AND, ORDER BY

-- Write your query below:

select transaction_id , account_id , transaction_type , amount , transaction_date 
from transactions 
where amount > 10000 and transaction_status = "success"
order by amount desc;


-- =====================================================
-- Q8: TRANSACTION CHANNEL ANALYSIS
-- =====================================================

-- Business Scenario:
-- The bank wants to understand which transaction
-- channels generate the highest transaction value.

-- Requirements:
-- 1. Display the transaction channel.
-- 2. Calculate the total number of transactions.
-- 3. Calculate the total transaction amount.
-- 4. Calculate the average transaction amount.
-- 5. Consider only successful transactions.
-- 6. Group the results by channel.
-- 7. Sort by total transaction amount in descending order.

-- SQL Concepts:
-- WHERE, GROUP BY, COUNT(), SUM(), AVG(), ORDER BY

-- Write your query below:

select channel , count(transaction_id) as total_transaction , sum(amount) as total_amount , avg(amount) as avg_amount 
from transactions 
where transaction_status = "success"
group by channel 
order by total_amount desc;



















