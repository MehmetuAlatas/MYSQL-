use techproed;
-- --------------------------------------------------
--                  8.Day
-- --------------------------------------------------
-- How to create primary and foreign key?
CREATE TABLE parents (
student_id INT,    
parent_name VARCHAR(50),
phone_number CHAR(10),
CONSTRAINT student_id_pk PRIMARY KEY (student_id)
);
INSERT INTO parents VALUES ('101', 'VELI CAN', '2024993748');
INSERT INTO parents (student_id, parent_name) VALUES ('102','Ayse Kan');
INSERT INTO parents VALUES ('103', 'Osman Can', null); 

CREATE TABLE students09(
student_id INT,
student_name VARCHAR(50),
student_grade INT,
student_age INT,
CONSTRAINT student_id_fk FOREIGN KEY (student_id) REFERENCES parents(student_id)
);
INSERT INTO students09 VALUES ('101', 'Ahmet CAN', 10, 15); 
INSERT INTO students09 VALUES ('102', 'Mehmet Kan', 10, 15); 
INSERT INTO students09 VALUES ('103', 'Nesli CAN', 10, 15);

SELECT * FROM parents;
SELECT * FROM students09;

-- Print on the console student name, age and related parent name
SELECT students09.student_name, students09.student_age, parents.parent_name
FROM students09, parents
WHERE students09.student_id = parents.student_id;

SELECT s.student_name, s.student_age, p.parent_name
FROM students09 s, parents p
WHERE s.student_id = p.student_id;

DROP TABLE parents;
DROP TABLE students09;
-- Firstly we should drop child table, after that we can drop parent table..
-- ---------------------------------------------------------------------------
-- ALTER TABLE 
-- ALTER TABLE is used to add, modify, drop/delete columns in a table.
-- ALTER TABLE is also used to rename a table.

-- How to add a new field to a table using Alter Table?
-- Create a table as my_companies and ADD a new field to my companies
CREATE TABLE my_companies(    
company_id INT,
company_name VARCHAR(20)
);
INSERT INTO my_companies VALUES (100, 'IBM');
INSERT INTO my_companies VALUES (101, 'GOOGLE');
INSERT INTO my_companies VALUES (102, 'MICROSOFT');
INSERT INTO my_companies VALUES (103, 'APPLE');
SELECT * FROM my_companies;

-- Add company_address field to our my_companies table
ALTER TABLE my_companies
ADD company_address VARCHAR(80);

-- Update just company address for company with id 101
UPDATE my_companies
SET company_address = 'Florida'
WHERE company_id = 101;
SELECT * FROM my_companies;

-- How to add a new column and with default value as IT => add a new column company_profession
ALTER TABLE my_companies
ADD company_profession VARCHAR(50) DEFAULT 'IT';

-- How to add multiple fields to a table => company_ceo, number_of_workers
ALTER TABLE my_companies
ADD (company_ceo VARCHAR(50), number_of_workers INT DEFAULT 0);
SELECT * FROM my_companies;

-- How to DROP fields from a table => remove company_ceo
ALTER TABLE my_companies
DROP COLUMN company_ceo;

-- How to rename a field/column? company_profession => company_industry
ALTER TABLE my_companies
RENAME COLUMN company_profession TO company_industry;


-- How to rename a table? my_companies => our_companies
ALTER TABLE my_companies
RENAME TO our_companies;
-- The name changed and there is not my_companies table now.
SELECT * FROM our_companies;

-- How to modify a field? (add constraints, change data type, change the size)
-- How to add constraints?
ALTER TABLE our_companies
MODIFY number_of_workers INT NOT NULL;

-- How to change size or data type of a field?

-- When we wanto to make changes on size or data type, our field values should be NULL
-- Some value size can be longer than expected.

UPDATE our_companies
SET company_industry = NULL;

-- How to change the size of a field? company_industry => 50
--                                    company_industry => 25

ALTER TABLE our_companies
MODIFY company_industry VARCHAR(25);

SELECT * FROM our_companies;

-- How to change data types of columns?
-- company_industry VARCHAR => INT
UPDATE our_companies
SET company_industry = NULL;

ALTER TABLE our_companies
MODIFY company_industry INT;

