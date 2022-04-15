-- How to create Data Base
CREATE DATABASE techproed;

-- How to use specific Data Base
USE techproed;

-- How to create students table inside the techproed Data Base
CREATE TABLE students(
    std_id INT NOT NULL,
    std_name VARCHAR(25),
    std_dob DATE,
    std_phone CHAR(10),
    std_email VARCHAR(30),
    PRIMARY KEY(std_email)
);

-- How to see table
SELECT * FROM students;

-- How to insert data into students table
INSERT INTO students VALUES
(101,'Ali Can','2002-08-12','5156517145','ac@gmail.com');
INSERT INTO students VALUES
(102,'Veli Han','2002-08-12','5156517145','vh@gmail.com');




