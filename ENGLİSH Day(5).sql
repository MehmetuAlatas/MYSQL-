-- -------------------------------------------------
--         5.Day
-- -------------------------------------------------
USE techproed;
CREATE TABLE people02(
ssn INT PRIMARY KEY,
name VARCHAR(50),
address VARCHAR(80)
);
INSERT INTO people02 VALUES(123456789, 'Mark Star', 'FLORIDA');
INSERT INTO people02 VALUES(234567890, 'Angie Way', 'VIRGINIA');
INSERT INTO people02 VALUES(345678901, 'Maryy Tien', 'NEW JERSEY');

INSERT INTO people02(ssn, address) VALUES(456789012, 'MICHINGAN');
INSERT INTO people02(ssn, address) VALUES(567887123, 'CALIFORNIA'); 
INSERT INTO people02(ssn, name) VALUES(567890123, 'CALIFORNIA'); 

SELECT * FROM people02;

-- COALESCE => we can make updates on multiple. It applies for NULL values.
UPDATE people02 SET name = COALESCE(name, 'Name will be inserted later..'),
                    address = COALESCE(address, 'Address will be inserted later..');

-- ------------------------------------------------------------------------------------
SELECT * FROM workers;
-- Increase the salary of people 10 % who have 2000 and 8500;
UPDATE workers SET worker_salary = worker_salary * 1.1 
               WHERE worker_salary IN (2000,8500); -- just these two will be updated
-- -------------------------------------------------------------------------------------
CREATE TABLE students08(
student_id INT PRIMARY KEY,
student_name VARCHAR(50),
student_age INT,
CONSTRAINT student_check_age CHECK(student_age BETWEEN 21 AND 25), -- 21 and 25 are inclusive
CONSTRAINT student_check_name CHECK(BINARY student_name = UPPER(student_name))
);
INSERT INTO students08 VALUES (101, 'Ali Can', 23);
INSERT INTO students08 VALUES (102, 'ALIYE CAN', 20);
INSERT INTO students08 VALUES (103, 'ALIYE CANAN', 21);
SELECT * FROM students08;

-- -------------------------------------------------------------------------------------------------
CREATE TABLE clients(
product_id INT,
client_name VARCHAR(50),
product_name VARCHAR(50)
);
INSERT INTO clients VALUES (10, 'Mark', 'Orange'); 
INSERT INTO clients VALUES (10, 'Mark', 'Orange'); 
INSERT INTO clients VALUES (20, 'John', 'Apple'); 
INSERT INTO clients VALUES (30, 'Amy', 'Palm'); 
INSERT INTO clients VALUES (20, 'Mark', 'Apple'); 
INSERT INTO clients VALUES (10, 'Adem', 'Orange'); 
INSERT INTO clients VALUES (40, 'John', 'Apricot'); 
INSERT INTO clients VALUES (20, 'Eddie', 'Apple');
SELECT * FROM clients;

-- Select just client information based on product_name = Orange, Apple and Apricot
SELECT * FROM clients WHERE product_name = 'Orange' OR product_name = 'Apple' OR product_name = 'Apricot';
-- IN
SELECT * FROM clients WHERE product_name IN ('Orange', 'Apple', 'Apricot');
-- NOT IN 
SELECT * FROM clients WHERE product_name NOT IN ('Palm');


-- Select the items between 20 and 40 product ids ( 20 and 40 inclusive)
SELECT * FROM clients WHERE product_id BETWEEN 20 AND 40; -- 1. way
SELECT * FROM clients WHERE product_id >= 20 AND product_id <= 40; -- 2.way
SELECT * FROM clients WHERE product_id IN (20,30,40); -- 3.way

-- Select all records where the product_id is not between 20 and 40 => just product_id 10 
SELECT * FROM clients WHERE product_id NOT BETWEEN 20 AND 40;

-- -------------------------------------------------------------------------------
CREATE TABLE people03(
ssn INT,
name VARCHAR(50),
address VARCHAR(80)
);
INSERT INTO people03 VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO people03 VALUES(234567890, 'Angie Way', 'Virginia');
INSERT INTO people03 VALUES(345678901, 'Maryy Tien', 'New Jersey');

INSERT INTO people03 (ssn, address) VALUES(456789012, 'Michigan');
INSERT INTO people03 (ssn, address) VALUES(567890123, 'California'); 
INSERT INTO people03 (ssn, name) VALUES(567890123, 'California'); 

SELECT * FROM people03;
DROP TABLE people03; -- Deletes table and records
DELETE FROM people03; -- Deletes the records, it does not delete table

-- Delete records if it has any NULL values
DELETE FROM people03 WHERE name IS NULL OR address IS NULL OR ssn IS NULL;

-- Delete records whose ssn between 123456789 and 345678901
DELETE FROM people03 WHERE ssn BETWEEN 123456789 AND 345678901;