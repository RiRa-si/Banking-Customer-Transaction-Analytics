-- =====================================================
-- Q9: CUSTOMER AND ACCOUNT ANALYSIS
-- =====================================================

-- Business Scenario:
-- The bank wants to view customer details along with
-- their associated bank account information.

-- Requirements:
-- 1. Display customer_id.
-- 2. Display customer first_name and last_name.
-- 3. Display account_id.
-- 4. Display account_type.
-- 5. Display account_balance.
-- 6. Display branch_id.
-- 7. Include only customers who have an account.
-- 8. Sort by customer_id in ascending order.

-- SQL Concepts:
-- INNER JOIN, ON, SELECT, ORDER BY

-- Write your query below:

select * from customers;
select * from branches;
select * from accounts;
select * from loans;
select * from transactions;

select c.customer_id , c.first_name , c.last_name , a.account_id , a.account_type , a.account_balance , a.branch_id 
from accounts as a 
inner join customers as c 
on a.customer_id = c.customer_id ; 


-- =====================================================
-- Q10: CUSTOMERS WITH MULTIPLE ACCOUNTS
-- =====================================================

-- Business Scenario:
-- The bank wants to identify customers who maintain
-- more than one bank account.

-- Requirements:
-- 1. Display customer_id.
-- 2. Display customer first_name and last_name.
-- 3. Display the total number of accounts per customer.
-- 4. Include only customers having more than one account.
-- 5. Sort by total number of accounts in descending order.

-- SQL Concepts:
-- INNER JOIN, GROUP BY, COUNT(), HAVING, ORDER BY

-- Write your query below:

select * from customers;
select * from accounts;

select c.customer_id , c.first_name , c.last_name , count(a.account_id) as total_cust
from customers as c 
inner join accounts as a 
on c.customer_id  = a.customer_id
group by c.customer_id , c.first_name , c.last_name 
having count(a.account_id) > 1
order by total_cust desc;

-- =====================================================
-- Q11: CUSTOMERS WITHOUT ANY LOANS
-- =====================================================

-- Business Scenario:
-- The bank wants to identify customers who do not
-- currently have any loan records.

-- Requirements:
-- 1. Display customer_id.
-- 2. Display customer first_name and last_name.
-- 3. Include only customers who have no matching
--    record in the loans table.
-- 4. Sort by customer_id in ascending order.

-- SQL Concepts:
-- LEFT JOIN, IS NULL, ORDER BY

-- Write your query below:
select  c.customer_id , c.first_name , c.last_name 
from customers as c
left join loans as l
on c.customer_id = l.customer_id 
where l.loan_id is null
order by customer_id ;


-- =====================================================
-- Q12: CUSTOMERS WITH ABOVE-AVERAGE ACCOUNT BALANCES
-- =====================================================

-- Business Scenario:
-- The bank wants to identify accounts whose balance
-- is greater than the average balance of all accounts.

-- Requirements:
-- 1. Display customer_id.
-- 2. Display account_id.
-- 3. Display account_type.
-- 4. Display account_balance.
-- 5. Include only accounts with a balance above the
--    overall average account balance.
-- 6. Sort by account_balance in descending order.

-- SQL Concepts:
-- Subquery, AVG(), WHERE, ORDER BY

-- Write your query below:

select c.customer_id , a.account_id , a.account_type , a.account_balance 
from customers as c
inner join accounts as a 
on c.customer_id = a.customer_id
where a.account_balance > (
                           select avg(a.account_balance) 
                           from accounts as a
                           )
order by a.account_balance desc;

-- =====================================================
-- Q13: CUSTOMER BALANCE CATEGORIZATION
-- =====================================================

-- Business Scenario:
-- The bank wants to categorize customers based on
-- their combined balance across all their accounts.

-- Requirements:
-- 1. Display customer_id.
-- 2. Calculate each customer's total account balance.
-- 3. Categorize customers using CASE:
--      - High Balance: Total balance >= 100000
--      - Medium Balance: Total balance >= 50000
--      - Low Balance: Total balance < 50000
-- 4. Sort by total account balance in descending order.

-- SQL Concepts:
-- GROUP BY, SUM(), CASE, ORDER BY

-- Write your query below:
WITH cte1 AS (
    SELECT
        a.customer_id,
        SUM(a.account_balance) AS total_bal
    FROM accounts AS a
    GROUP BY a.customer_id
)
SELECT *,
    CASE
        WHEN total_bal >= 100000 THEN 'High Balance'
        WHEN total_bal >= 50000 THEN 'Medium Balance'
        ELSE 'Low Balance'
    END AS customer_category
FROM cte1
ORDER BY total_bal DESC;
