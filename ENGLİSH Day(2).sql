-- ---------------------------------------------
--                2 DAY
-- ---------------------------------------------

-- CREATE TABLE
CREATE TABLE students02(
std_id INT (3) PRIMARY KEY,
std_name VARCHAR (20),
std_dob DATE 
);

INSERT INTO students02 VALUES (101,'Ali Can','2000-08-02');
INSERT INTO students02 VALUES (102,'Veli Han','2000-08-02');-- we cannot insert null or repeated values because primary key

SELECT * FROM students02;

-- Create table by using reference of other tables
CREATE TABLE student_name_age AS SELECT std_name, std_dob FROM students02;
SELECT * FROM student_name_age;

-- How to create a new table with primary key using naming convention
-- Create primary key with a different name

CREATE TABLE students03(
std_id INT(3),
std_name VARCHAR (20),
std_dob DATE,
CONSTRAINT student_id_pk PRIMARY KEY(std_id)
);
INSERT INTO students03 VALUES (101,'Ali Can','2000-07-01');
SELECT*FROM students03;

-- Create a new table by using unique constraint it means this field can be null, it can not be duplicated
CREATE TABLE students04(
std_id INT(3) UNIQUE,
std_name VARCHAR (20),
std_dob DATE
);
INSERT INTO students04 VALUES (101,'Ali Can','2000-07-01');
INSERT INTO students04 VALUES (101,'Aliye Can','2000-07-01');-- NOT ADDED
INSERT INTO students04 VALUES (NULL,'Aliye Canan','2000-07-01');
SELECT*FROM students04 ;

