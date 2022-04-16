-- -----------------------------------------------------------------------------------------
--                            9.Day
-- -----------------------------------------------------------------------------------------
CREATE TABLE workers03(
id INT,
name VARCHAR(50),
state VARCHAR(50),
salary INT,
company VARCHAR(20)
);
INSERT INTO workers03 VALUES (123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers03 VALUES (234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers03 VALUES (345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers03 VALUES (456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers03 VALUES (567890123, 'Eddie Murphy', 'Texas', 7200, 'MICROSOFT');
INSERT INTO workers03 VALUES (678901234, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers03 VALUES (278634823, 'Mark Stone', 'Pennysylvania', 2500, 'IBM');

SELECT * FROM workers03;
-- UNION: Collects the result of 2 queries, it will collect just unique values
-- UNION ALL : Collect the result of queries, it will collect duplications

-- Find the state whose salary is greater than 3000, 
-- worker names whose salaries are less than 2000 without duplication
SELECT state AS State_Or_Worker_Name
FROM workers03
WHERE salary > 3000
UNION
SELECT name AS State_Or_Worker_Name
FROM workers03
WHERE salary < 2000;
-- ---------------------------------------------------------------------
-- Find the state whose salary is greater than 3000, 
-- worker names whose salaries are less than 2000 with duplication
SELECT state AS State_Or_Worker_Name
FROM workers03
WHERE salary > 3000
UNION ALL
SELECT name AS State_Or_Worker_Name
FROM workers03
WHERE salary < 2000;
-- ---------------------------------------------------------------------------------------
-- JOINS
-- INNER JOIN
-- LEFT JOIN
-- RIGHT JOIN
-- SELF JOIN

CREATE TABLE my_companies(    
company_id INT,
company_name VARCHAR(20)
);
INSERT INTO my_companies VALUES (100, 'IBM');
INSERT INTO my_companies VALUES (101, 'GOOGLE');
INSERT INTO my_companies VALUES (102, 'MICROSOFT');
INSERT INTO my_companies VALUES (103, 'APPLE');

CREATE TABLE orders(
order_id INT,
company_id INT,
order_date DATE
);
INSERT INTO orders VALUES (11, 101, '2020-04-18');
INSERT INTO orders VALUES (22, 102, '2020-04-19');
INSERT INTO orders VALUES (33, 103, '2020-04-20');
INSERT INTO orders VALUES (44, 104, '2020-04-21');
INSERT INTO orders VALUES (55, 105, '2020-04-22');

SELECT * FROM my_companies;
SELECT * FROM orders;

-- INNER JOIN: All common records from both table will be selected
-- LEFT JOIN: ALL records will be selected from LEFT TABLE and all matching records from RIGHT table
-- RIGHT JOIN: All records will be selected from RIGHT table and all matching records from LEFT table

-- Select company_id, company name, order id, order date for common companies
SELECT my_companies.company_id, my_companies.company_name, orders.order_id, orders.order_date
FROM my_companies INNER JOIN orders
ON my_companies.company_id = orders.company_id;

-- with aliases
SELECT mc.company_id, mc.company_name, o.order_id, o.order_date
FROM my_companies mc INNER JOIN orders o
ON mc.company_id = o.company_id;

-- ----------------------------------------------------
-- LEFT JOIN
-- Select company_id, company name, order id, order date for LEFT table and matching records from the Right Table
SELECT * FROM my_companies;
SELECT * FROM orders;

SELECT mc.company_id, mc.company_name, o.order_id, o.order_date
FROM my_companies mc LEFT JOIN orders o    -- Get all the records from my companies and matching ones from orders
ON mc.company_id = o.company_id;
-- -----------------------------------------------------
-- RIGHT JOIN
-- Select company_id, company name, order id, order date for RIGHT table and matching records from the LEFT Table
SELECT mc.company_id, mc.company_name, o.order_id, o.order_date
FROM my_companies mc RIGHT JOIN orders o   -- Get all the records from orders table and matching ones from my_companies
ON mc.company_id = o.company_id;

SELECT * FROM orders;
-- -----------------------------------------------------------
-- LEFT JOIN  UNION  RIGHT JOIN
SELECT mc.company_id, mc.company_name, o.order_id, o.order_date
FROM my_companies mc LEFT JOIN orders o    -- Get all the records from my companies and matching ones from orders
ON mc.company_id = o.company_id

UNION

SELECT mc.company_id, mc.company_name, o.order_id, o.order_date
FROM my_companies mc RIGHT JOIN orders o   -- Get all the records from orders table and matching ones from my_companies
ON mc.company_id = o.company_id;

-- ------------------------------------------------------------------------------------------------------------

-- SELF JOIN:
CREATE TABLE workers04 (  
id INT, 
name varchar(20),
title varchar(60),
manager_id INT
);
    
INSERT INTO workers04 VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers04 VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers04 VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers04 VALUES(4, 'Amy Sky', 'CEO', 5);

SELECT * FROM workers04;
-- SELF JOIN: If we make an inner joın with just one table => SELF JOIN
-- Create a table which displays the employees and manager of employees.
-- Without using Aliases
SELECT workers04.name AS employee_name, workers04.name AS manager_name
FROM workers04  INNER JOIN workers04 
ON workers04.manager_id = workers04.id;

-- With using aliases
SELECT employee.name AS employee_name, manager.name AS manager_name
FROM workers04 employee INNER JOIN workers04 manager
ON employee.manager_id = manager.id;
-- -----------------------------------------------------------------------
-- Interview Question: Select all data about the worker whose salary is the highest from workers table
SELECT * FROM workers;
-- 1.way:
SELECT * FROM workers
WHERE worker_salary = (SELECT MAX(worker_salary) FROM workers);
-- 2.way:
SELECT * FROM workers
ORDER BY worker_salary DESC
LIMIT 1; 
-- ------------------------------------------------------------------------

SELECT * FROM workers
ORDER BY worker_salary DESC
LIMIT 2; -- We can see highest and we can see second highest salary
-- --------------------------------------------------------------------------

-- 2) Interview Question: Select all data about the worker whose salary is the second highest
-- 1.Way:
SELECT * FROM workers 
ORDER BY worker_salary DESC
LIMIT 1
OFFSET 1;

--
SELECT * FROM workers 
ORDER BY worker_salary DESC
LIMIT 1
OFFSET 2;  -- third highest salary
-- -------------------------------------------------------------------------------
-- 2) Interview Question: Select all data about the worker whose salary is the second highest
-- 2.Way:
SELECT * FROM workers
WHERE worker_salary = ( SELECT MAX(worker_salary) AS SECOND_MAX_SALARY FROM workers
						WHERE worker_salary < (SELECT MAX(worker_salary) FROM workers));

