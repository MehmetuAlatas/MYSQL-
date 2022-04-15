-- ---------------------------------------------------------------------------
--       4.Day
-- ---------------------------------------------------------------------------
-- Constraints
-- a) Unique
-- b) Not Null
-- c) Primary Key
-- d) Foreign Key
-- e) Check
use practice;
CREATE TABLE students06(
student_id INT PRIMARY KEY, -- student_id ==> it cannot have nullvalues and duplications
student_name VARCHAR(50) NOT NULL, -- student_name cannot have null values
student_age INT,
student_dob DATE UNIQUE -- => No duplications, it can be NULL, you can have multiple NULL values
);

INSERT INTO students06 VALUES (101, 'John Walker', 28, '1994-05-05');
INSERT INTO students06 VALUES (102, NULL, 28, '1994-05-10');
INSERT INTO students06 VALUES (103, 'John Walk', 28, '1994-10-10');
INSERT INTO students06 VALUES (104, 'Mary Star', 28, NULL);
INSERT INTO students06 VALUES (105, 'Leo Ocean', 30, NULL);

SELECT * FROM students06;

-- Check Constraint
-- For a table, I just want students age between 21 and 25 => inclusive

CREATE TABLE students07(
student_id INT PRIMARY KEY,
student_name VARCHAR(50),
student_age INT,
CONSTRAINT student_age_check CHECK(student_age BETWEEN 21 AND 25)
);
INSERT INTO students07 VALUES (101, 'Ali Can', 21);
INSERT INTO students07 VALUES (102, 'Aliye Can', 12);
SELECT * FROM students07;

-- --------------------------------------------------------------------------
CREATE TABLE people(
ssn INT PRIMARY KEY,
name VARCHAR(50),
address VARCHAR(80)
);
INSERT INTO people VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO people VALUES(234567890, 'Angie Way', 'Virginia');
INSERT INTO people VALUES(345678901, 'Maryy Tien', 'New Jersey');

INSERT INTO people(ssn, address) VALUES(456789012, 'Michigan');-- we just create records for ssn and address
INSERT INTO people(ssn, address) VALUES(567890123, 'California'); -- we just create records for ssn and address
INSERT INTO people(ssn, name) VALUES(567890124, 'California');  -- we just create records for ssn and name

SELECT * FROM people;

-- when we want to update a value, UPDATE tablename SET columnname
-- Update null values ==> Name will be inserted later
UPDATE people SET name = 'Name will be inserted later' WHERE name IS NULL;
UPDATE people SET name = 'Name will be inserted later' WHERE address IS NULL;





