USE techproed;
-- ALIASES: SQL aliases are used to give a table, or column in a table,
-- a temporary name.
-- Aliases are mostyly used to make column names more readale.
-- An alias anly exist duration of that query.​
-- Drop employeees table and create one more time
CREATE TABLE employeees( 
employee_id INT,
employee_first_name VARCHAR(20),
employee_last_name VARCHAR(20)
);

INSERT INTO employeees VALUES (14,'Chris', 'Tae');
INSERT INTO employeees VALUES (11,'John', 'Walker');
INSERT INTO employeees VALUES (12,'Amy', 'Star');
INSERT INTO employeees VALUES (13,'Brad', 'Pitt');
INSERT INTO employeees VALUES (15,'Chris', 'Way');
SELECT * FROM employeees;

-- SELECT employee first name and ID, 
-- for employee first name use "firstname" 
-- as field name and for ID use ID as field name

SELECT employee_id AS ID, employee_first_name AS First_Name FROM employeees;
-- ------------------------------------------------------------------------
-- Drop addresses and create one more time lets be on the same boat
CREATE TABLE addresses(
employee_id INT,
street VARCHAR(20),
city VARCHAR(20),
state CHAR(2),
zipcode CHAR(5)
);
INSERT INTO addresses VALUES (11, '32nd Star 1234','Miami', 'FL', '33018');
INSERT INTO addresses VALUES (12, '23rd Rain 567','Jacksonville', 'FL', '32256');
INSERT INTO addresses VALUES (13, '5th Snow 765','Hialeah', 'VA', '20121');
INSERT INTO addresses VALUES (14, '3rd Man 12','Weston', 'MI', '12345');
INSERT INTO addresses VALUES (11, '11th Chris 12','St. Johns', 'FL', '32259');

-- Create a table, get first name from employees table and 
-- get state and city from addresses table when ids are matching 
SELECT * FROM employeees;
SELECT * FROM addresses;

SELECT employeees.employee_first_name, addresses.state, addresses.city
FROM employeees, addresses
WHERE employeees.employee_id = addresses.employee_id;

SELECT * FROM addresses;
-- We can change table names by using ALIASES (temporary)
SELECT e.employee_first_name, a.state, a.city
FROM employeees e, addresses a
WHERE e.employee_id = a.employee_id;

-- ------------------------------------------------------------------------
-- Get the employee_id, use ID as field name,
-- get firstname and lastname and put them together into the same field called as Full Name
SELECT * FROM employeees;

SELECT employee_id AS ID, CONCAT(employee_first_name, " ",employee_last_name) AS Full_Name
FROM employeees;

-- -----------------------------------------------------------------------------
-- Create a table called workers02
CREATE TABLE workers02(
id INT,
name VARCHAR(50),
state VARCHAR(50),
salary INT,
company VARCHAR(20)
);
INSERT INTO workers02 VALUES (123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers02 VALUES (234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers02 VALUES (345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers02 VALUES (456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers02 VALUES (567890123, 'Eddie Murphy', 'Texas', 7200, 'MICROSOFT');
INSERT INTO workers02 VALUES (678901234, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers02 VALUES (278634823, 'Mark Stone', 'Pennysylvania', 2500, 'IBM');

-- GROUP BY
-- When we use GROUP BY we can specify a specific field to get the records around

-- Find the total salary for every worker 
SELECT name, SUM(salary) AS Total_Salary FROM workers02 GROUP BY name;
-- We found the salary of each worker. We make group according to their name


-- Find the number of workers per state
SELECT state, COUNT(name) AS NUMBER_OF_WORKERS
FROM workers02
GROUP BY state;

-- Find the number of workers per state in descending order by number of workers
SELECT state, COUNT(name) AS NUMBER_OF_WORKERS
FROM workers02
GROUP BY state
ORDER BY NUMBER_OF_WORKERS DESC;


-- Find the number of workers whose salary is more than $ 2000 per company  
SELECT * FROM workers02;
SELECT company, COUNT(name) AS NUMBER_OF_WORKERS
FROM workers02
WHERE salary > 2000
GROUP BY company;

-- -----------------------------------------------------------------------------
-- HAVING clause is also used to filter records after GROUP BY
-- Find the number of workers if it is more than 1 per state

SELECT * FROM workers02;
SELECT state, COUNT(state) AS NUMBER_OF_WORKERS
FROM workers02
GROUP BY state
HAVING COUNT(state) > 1;

-- ------------------------------------------------------------------------------
-- HW: Find the minimum salary if the salary is more than 2000 for every state
 SELECT * FROM workers02;
 SELECT state, min(salary) minsalary 
 FROM workers02
 GROUP BY state
 HAVING minsalary >=2000;



