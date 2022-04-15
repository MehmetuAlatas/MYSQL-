-- ---------------------------------------------------------------------------------------------
--                             3.Day
-- ---------------------------------------------------------------------------------------------
USE techproed;
CREATE TABLE students05(
std_id INT PRIMARY KEY,
std_name VARCHAR (20),
std_dob DATE
);

SELECT * FROM students05;

-- How to drop table?
DROP TABLE students05;

-- How to create records?
-- 1.way:
INSERT INTO students05 VALUES(101, 'Ali Can' , '2005-03-25');
INSERT INTO students05 VALUES(102, 'Veli Han' , '2005-02-24');
INSERT INTO students05 VALUES(103, 'John Case' , '1999-03-25');
INSERT INTO students05 VALUES(104, 'Merry Johnson' , '2007-04-25');

-- 2.way:
INSERT INTO students05 (std_id, std_name) VALUES (108, 'Elif');
SELECT * FROM students05;

-- How to update a specific record in a table?
-- Ali Can => Leo Ocean
UPDATE students05 SET std_name = 'Leo Ocean' WHERE std_id = 101;
UPDATE students05 SET std_name = 'Fatma' WHERE std_name = 'Elif';


-- How can we update all birth dates for people who have an id more than 101?
UPDATE students05 SET std_dob = '2002-02-02' WHERE std_id > 101;

-- Create workers table whose fields are worker_id, worker_name, worker_salary.
-- worker_id will have primary key with the name worker_id_pk
-- Insert 4 records into the workers table
-- See the table on the console

CREATE TABLE workers(
worker_id INT,
worker_name VARCHAR(25),
worker_salary INT,
CONSTRAINT worker_id_pk PRIMARY KEY (worker_id)
);
select*from workers;
drop table workers;
INSERT INTO workers VALUES('101','Ali Can', 12000);
INSERT INTO workers VALUES('102','Veli Han', 2000);
INSERT INTO workers VALUES('103','Ayse Kan', 7000);
INSERT INTO workers VALUES('104','Angie Ocean', 8500);

-- To get all records from table
SELECT * FROM workers;

-- To get a specific column from table => worker_name
SELECT worker_name FROM workers;

-- To get a specific data from a column
SELECT worker_name FROM workers WHERE worker_id = 101;

-- To get a specific record from a column
SELECT * FROM workers WHERE worker_id = 102;

-- Select all records whose names lengths are greater than 8
SELECT * FROM workers WHERE LENGTH(worker_name) > 8;

-- How to get MAX salary from workers table?
SELECT MAX(worker_salary) FROM workers;

-- How to get MIN salary from workers table?
SELECT MIN(worker_salary) FROM workers;

-- Interview QUESTION: How to get the records of the person who has the minimum salary? 
SELECT * FROM workers WHERE worker_salary = (SELECT MIN(worker_salary) FROM workers);


-- How to get sum of the salaries?
SELECT SUM(worker_salary) FROM workers;

-- How to get average of salaries?
SELECT AVG(worker_salary) FROM workers;

-- How to get te count of salaries?
SELECT COUNT(worker_salary) FROM workers;

-- Select id of the workers whose salary is 7000 AND name is Ayse Kan
SELECT worker_id FROM workers WHERE worker_salary = 7000 AND worker_name = 'Ayse Kan';

-- Select name and salary of the workers whose salary is 2000 OR 7000
SELECT worker_name, worker_salary FROM workers WHERE worker_salary = 2000 OR worker_salary = 7000;

-- Select name and salary of workers whose salary is the highest or the lowest.
SELECT worker_name, worker_salary FROM workers WHERE worker_salary = (SELECT MAX(worker_salary) FROM workers) OR 
                                                     worker_salary = (SELECT MIN(worker_salary) FROM workers); 