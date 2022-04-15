CREATE TABLE customers_likes
    
    (
    
    product_id INT(10),
    customer_name VARCHAR(50),
    liked_product VARCHAR(50)
    
  
    );
    
    
    
    INSERT INTO customers_likes VALUES (10, 'Ali Can', 'Orange');
    INSERT INTO customers_likes VALUES (50, 'Mark', 'Pineapple');
    INSERT INTO customers_likes VALUES (60, 'Lary', 'Avocado');
    INSERT INTO customers_likes VALUES (30, 'Hulya Guler', 'Strawberry');
    INSERT INTO customers_likes VALUES (20, 'Yesim Yilmaz', 'Apple');
    INSERT INTO customers_likes VALUES (10, 'Ali Can', 'Orange');
    INSERT INTO customers_likes VALUES (40, 'John', 'Apricot');
    INSERT INTO customers_likes VALUES (20, 'Yesim Yilmaz', 'Apple');
    
     CREATE TABLE customer_products
    
    (
    
    product_id CHAR(3),
    customer_name VARCHAR(50),
    product_name VARCHAR(50),
    
    CONSTRAINT product_id_pk PRIMARY KEY (product_id)
    
    );
    INSERT INTO customer_products VALUES ('10' , 'Ali Can' , 'Orange');
    INSERT INTO customer_products VALUES ('11' , 'Veli Han' , 'Cherry');
    INSERT INTO customer_products VALUES ('20' , 'Yesim Yilmaz' , 'Apple');
    INSERT INTO customer_products VALUES ('25' , 'Tugba Ilhan' , 'Pink');
    INSERT INTO customer_products VALUES ('30' , 'Hulya Guler' , 'Strawberry');
    INSERT INTO customer_products VALUES ('35' , 'Busranur Kodas' , 'Banana');
    
    
  SELECT product_id, customer_name
    FROM customer_products
    WHERE EXISTS (SELECT product_id FROM customers_likes    WHERE  customer_products.product_id = customers_likes.product_id);
    
     -- Select customer names if the ids are the same in customer_products and customers_likes
    -- viceversa
    
    SELECT product_id, customer_name
    FROM customers_likes
    WHERE EXISTS (SELECT product_id FROM customer_products    WHERE  customer_products.product_id = customers_likes.product_id);
    
    -- The negative scenario
    
    SELECT product_id, customer_name
    FROM customers_likes
    WHERE EXISTS (SELECT product_id FROM customer_products    WHERE  customer_products.product_id = 37);
   CREATE TABLE employeees
    
    (
    
    id INT (10),
    name VARCHAR(50),
    state VARCHAR(50),
    salary INT(20),
    company VARCHAR(50)
    );
    
    
    INSERT INTO employeees VALUES (123456789, 'John Walker', 'Florida', 2500, 'IBM');
    INSERT INTO employeees VALUES (234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
    INSERT INTO employeees VALUES (345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
    INSERT INTO employeees VALUES (456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
    INSERT INTO employeees VALUES (567890123, 'Eddie Murphy', 'Texas', 7200, 'MICROSOFT');
    INSERT INTO employeees VALUES (678901234, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
    INSERT INTO employeees VALUES (278634823, 'Mark Stone', 'Pennysylvania', 2500, 'IBM');
    -- create a second table called companies
    
    CREATE TABLE companies
    
    (
    
    company_id INT(10),
    company VARCHAR(50),
    number_of_employees INT(20)
    
    
    
    );
    
    INSERT INTO companies VALUES (100, 'IBM', 12000);
    INSERT INTO companies VALUES (101, 'GOOGLE', 18000);
    INSERT INTO companies VALUES (102, 'MICROSOFT', 10000);
    INSERT INTO companies VALUES (103, 'APPLE', 21000);
   
    -- Find the employee and company names whose company has more than 15000 employees
    
    
    SELECT * FROM employeees;
    
    
    
    SELECT name, company
    FROM employeees
    WHERE company IN (SELECT company FROM companies WHERE companies.number_of_employees > 15000);
    
      -- Find the company ids and company names that are in Florida
    SELECT company_id, company
    FROM companies
    WHERE company IN (SELECT company from employeees WHERE employeees.state = 'Florida');
      -- Find the employee name and state which has companies whose company ids are greater than 100
  
    SELECT name, state
    FROM employeees
    WHERE company IN (SELECT   company    FROM companies WHERE companies.company_id > 100);
    
    -- How to give temporary names to columns?
       SELECT MAX(salary)  AS MAX_SALARY FROM employeees;
     -- Find the name of comapnies, company ids, maximum and minimum salaries per company
    
    SELECT company, company_id, (SELECT MAX(salary) 
                                FROM employeees WHERE employeees.company = companies.company) AS max_salary,
                                (SELECT MIN(salary) 
                                FROM employeees WHERE employeees.company = companies.company) AS min_salary
    
    FROM companies;
    
  
     -- LIKE CONDITION: it is used with wildcards
    -- we will learn about 2 wildcards
    -- 1) wildcard % : it represents zero or multiple
    
    -- Select employee names which starts with E
    
    SELECT * 
    FROM employeees;
    
    SELECT name
    FROM employeees
    WHERE name LIKE 'E%'; -- this gives me starting point
    
    -- Select names ending with 'e'
    SELECT name 
    FROM employeees
    WHERE name LIKE '%e'; -- I can have multiple letters before e
    
    -- Lets find the name that contains alk
    
    SELECT name 
    FROM employeees
    WHERE name LIKE '%a%l%k%';
    
    
    -- select names that contain ad
    
    SELECT name 
    FROM employeees
    WHERE name LIKE '%ad%';
    
    
    -- select names that have 'e' and 'r' in any position
    
    SELECT name 
    FROM employeees
    WHERE name LIKE '%e%r%' OR name LIKE '%r%e%';
    
    
    SELECT * 
    FROM employeees;
    
    -- 2) wildcard: _ it represents a single character
    -- Select a state whose second character is 'e' and forth char is 'n'
    
    SELECT state 
    FROM employeees
    WHERE state LIKE '_e_n%';
    
    -- Select a state whose second character from last is i
    
    SELECT state 
    FROM employeees
    WHERE state LIKE '%i_';
    
    
    -- Select a state whose second char is 'e' but it has at least 6 chars
    SELECT state 
    FROM employeees
    WHERE state LIKE '_e____%';
    
    
    -- Select a state that has 'i' in any position after the second char
    
    SELECT state 
    FROm employeees
    WHERE state LIKE '__%i%';
    
    -- REGEXP_LIKE Conditions: Regular expressions are used with REGEXP_LIKE
    
      
    
    -- Create a new table called words
    
    CREATE TABLE words
    (
    
    word_id INT(10) UNIQUE,
    word VARCHAR(50)NOT NULL,
    number_of_letters INT (6)
    
    
    
    );
    
    
    
    INSERT INTO words VALUES (1001,'hot', 3);
    INSERT INTO words VALUES (1002,'hat', 3);
    INSERT INTO words VALUES (1003,'hit', 3);
    INSERT INTO words VALUES (1004,'hbt', 3);
    INSERT INTO words VALUES (1005,'hct', 4);
    INSERT INTO words VALUES (1006,'adem',4);
    INSERT INTO words VALUES (1007,'selena', 6);
    INSERT INTO words VALUES (1008,'yusuf', 5);
   
    SELECT * FROM words;
    -- Select words whose length is 3,  first character is 'h' and the last char is 't' and in the middle we should have 'o', 'a' or 'i'
    SELECT word
    FROM words
    WHERE word LIKE 'hot' OR word LIKE 'hat' OR word LIKE 'hit';
    
    
    -- 2. way
    SELECT word
    FROM words
    WHERE REGEXP_LIKE (word,'h[oai]t');
    
    
    -- Select words whose length is 3,  first character is 'h' and the last char is 't' and in the middle we should have from a to v
    
    SELECT word
    FROM words
    WHERE REGEXP_LIKE (word,'h[a-v]t'); -- [a-d] this means it will take from a till v all chars a, b, c d
    
    -- Selet words whose first char is 'a', 's' or  'y' % * .
    
    SELECT word
    FROM words
    WHERE REGEXP_LIKE (word, '^[asy] *'); -- optional this means after it, it may take zero or more letters
   
    
    -- Selet words whose last char is  'f' % * .
    
     SELECT word
    FROM words
    WHERE REGEXP_LIKE (word, '[f]$');
    
    SELECT * FROM words;
    
    -- Select words whose first char is 's' and last char is 'a'      
    
    
    SELECT word
    FROM words
    WHERE REGEXP_LIKE (word, '^[s](.*)[a]$');
    
    
    
    -- Select words which have chars from 'd' to l at the beginning and followed by any chars then 't'
    
    SELECT word
    FROM words
    WHERE REGEXP_LIKE (word, '^[d-l].[t]$');
    
    
    -- Select words which have chars from d to t at the beginning followed by by any 2 chars then e
    
     SELECT word
    FROM words
    WHERE REGEXP_LIKE (word, '^[d-t]..[e]');   -- .* zero or all multiple chars  .. __
    
    -- NOT LIKE Condition: 
    
    -- Select words that does not have h 
    SELECT word
    FROM words 
    WHERE word NOT LIKE '%h%';
    
    
    -- Select the words which do not end with t and f
    
    
    SELECT word
    FROM words 
    WHERE word NOT LIKE '%t' AND word NOT LIKE '%f';
    
    -- Select words which start with any character, not followed by 'a', not followed by 'e'
    SELECT word
    FROM words 
    WHERE word NOT LIKE '_a%' AND word NOT LIKE '_e%'; -- NOT LIKE  !=
    
    
    
    SELECT * FROM students;
    
     -- 12 / 18 / 2021 
    
    --  Create a new table called points and have the fields as 
    
    
    CREATE TABLE points
    
    (
    
    name VARCHAR(50),
    point INT(3)
    
    
    );
    
    INSERT INTO points VALUES('Ali', 25);
    INSERT INTO points VALUES('Veli', 37);
    INSERT INTO points VALUES('Kemal', 43);
    INSERT INTO points VALUES('Ali', 36);
    INSERT INTO points VALUES('Veli', 29);
    INSERT INTO points VALUES('Ali', 45);
    INSERT INTO points VALUES('Veli', 11);
    INSERT INTO points VALUES('Ali', 125);
    SELECT *
    FROM points;
    
    -- Put the names in ascending order and points in descending order, 
   
    
    SELECT *
    FROM points
    ORDER BY name ASC,
    point DESC;
    
    
    -- Put the names in descending order and points in ascending order, 
    
     SELECT *
    FROM points
    ORDER BY name DESC,
    point ;  
    -- When we are using ORDER BY in SQL, BY default it will order the fields in Ascending order, but WHen you want to use descending order
                -- we need to explicitly type DESC order
    
    
    --
    SELECT point AS new_point, name AS new_name
    FROM points
    ORDER BY name ASC,
    point DESC;
    
    
    
    CREATE TABLE employeees
    
    (
    
    employee_id INT(9),
    employee_first_name VARCHAR(20),
    employee_last_name VARCHAR(20)
    );
    
    INSERT INTO employeees VALUES (14,'Chris', 'Tae');
    INSERT INTO employeees VALUES (11,'John', 'Walker');
    INSERT INTO employeees VALUES (12,'Amy', 'Star');
    INSERT INTO employeees VALUES (13,'Brad', 'Pitt');
    INSERT INTO employeees VALUES (15,'Chris', 'Way');
     CREATE TABLE addresses
    
    (
    
    employee_id INT(9),
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
    SELECT * FROM addresses;
    
    
     --  Create a new table called points and have the fields as 
    
    
    CREATE TABLE points
    
    (
   
    name VARCHAR(50),
    point INT(3)
  
    );
    
    INSERT INTO points VALUES('Ali', 25);
    INSERT INTO points VALUES('Veli', 37);
    INSERT INTO points VALUES('Kemal', 43);
    INSERT INTO points VALUES('Ali', 36);
    INSERT INTO points VALUES('Veli', 29);
    INSERT INTO points VALUES('Ali', 45);
    INSERT INTO points VALUES('Veli', 11);
    INSERT INTO points VALUES('Ali', 125);
    SELECT *
    FROM points;
    
     -- Put the names in ascending order and points in descending order, 
     
     SELECT * 
     FROM points
     ORDER BY point ASC;
     
       SELECT * 
     FROM points
     ORDER BY point DESC;
     
     
     
      CREATE TABLE employeees
    
    (
    
    employee_id INT(9),
    employee_first_name VARCHAR(20),
    employee_last_name VARCHAR(20)
    );
    
    INSERT INTO employeees VALUES (14,'Chris', 'Tae');
    INSERT INTO employeees VALUES (11,'John', 'Walker');
    INSERT INTO employeees VALUES (12,'Amy', 'Star');
    INSERT INTO employeees VALUES (13,'Brad', 'Pitt');
    INSERT INTO employeees VALUES (15,'Chris', 'Way');
     
     
     CREATE TABLE addresses
    
    (
    
    employee_id INT(9),
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
    SELECT * FROM addresses;
    SELECT * FROM employeees;
    
    -- ALIASES
    
    -- How to make 
    
    