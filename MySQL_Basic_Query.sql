-- Retrieve static value --

SELECT 'MyFirstValue' AS SomeValue;

SELECT 1+1 AS TWO;

SELECT NOW() AS NOW;
SELECT CURDATE();
SELECT CURTIME();

SELECT PI();

SELECT MOD(45, 7);

SELECT SQRT(25);

-- Retrieve all the data from table --

SELECT *
FROM sakila.actor;

SELECT *
FROM sakila.city;

USE sakila;
SELECT *
FROM city;

-- Retrieve all the data ordered by single column

SELECT * 
FROM actor 
ORDER BY first_name;

SELECT *
FROM actor
ORDER BY last_name;

SELECT *
FROM actor
ORDER BY first_name DESC;

SELECT *
FROM actor
ORDER BY last_name DESC;

-- Retrieve selected columns from table

SELECT first_name, last_name
FROM actor;

SELECT first_name, last_name
FROM actor
ORDER BY first_name DESC;

-- Retrieve the data with filter condition

SELECT *
FROM actor
WHERE actor_id > 100;

SELECT * 
FROM actor
WHERE actor_id < 100
ORDER BY first_name;

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'Nick'
ORDER BY actor_id;

SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id > 100
ORDER BY first_name, last_name DESC;

-- Retrieve empty result set to get the table attributes

SELECT *
FROM sakila.address
WHERE 1=2;

-- Retrieve column names using aliases

SELECT rental_date, inventory_id, return_date
FROM sakila.rental;

SELECT rental_date AS RentalDate,
	   inventory_id AS FilmListID,
       return_date AS ReturnDate
FROM sakila.rental;

-- Retrieve value based on arithmetic expressions

SELECT replacement_cost-rental_rate AS CostDiff,
	   film_id AS FilmID,
	   length/60 AS TimeinHour
FROM film;

SELECT rental_rate AS RentalRate,
	   rental_rate + 3 * 4 - 1 AS Result1,
	   (rental_rate + 3) * 4 - 1 AS Result2,
       (rental_rate + 3) * (4 - 1) AS Result3,
       rental_rate + (3 * 4) - 1 AS Result4
FROM film;

SELECT replacement_cost AS ReplacementCost,
       replacement_cost / 5 AS DecimalRentalRate,
       replacement_cost DIV 5 AS IntegerRentalRate,
       replacement_cost % 5 AS ReminderRentalRate
FROM film;

-- ---------------------
-- Integer Operations
-- ---------------------

SELECT amount,
	   ROUND(amount) Amnt, ROUND(amount,1) Amnt1,
	   FLOOR(amount) FloorAmnt, CEILING(amount) CeilingAmnt
FROM payment;

-- ---------------------
-- String Operations
-- ---------------------

-- Concat function:

SELECT CONCAT(first_name, ' ', last_name) AS FullName
FROM actor;

-- LEFT function , ex: initial:

SELECT CONCAT(first_name, ' ', last_name) AS FullName,
       CONCAT(LEFT(first_name,1), LEFT(last_name,1)) AS Initial
FROM actor;

-- LENGTH function

SELECT CONCAT(first_name, ' ', last_name) AS FullName,
       LENGTH(CONCAT(first_name, ' ', last_name)) AS Length,
	   CONCAT(LEFT(first_name,1), LEFT(last_name,1)) AS Initial
FROM actor;

-- Various functions

SELECT CONCAT(first_name, ' ', last_name) AS FullName,
	   REVERSE(CONCAT(first_name, ' ', last_name)) AS ReverseFullName,
	   REPLACE(CONCAT(first_name, ' ', last_name), 'S', '@') AS ReplaceExample
FROM actor;

-- Data Operations

SELECT CONCAT(first_name, ' ', last_name) AS FullName,
	   DATE_FORMAT(last_update, '%m/%d/%y') AS LastUpdated1,
       DATE_FORMAT(last_update, '%m-%d-%y') AS LastUpdated2,
       DATE_FORMAT(last_update, '%W %d %b %Y %T:%f') AS LastUpdated3
FROM actor;

-- DAYOFWEEK, QUARTER, WEEK, Month

SELECT rental_date,
	   DAYOFWEEK(rental_date) AS DayOfWeek,
       QUARTER(rental_date) AS Quarter,
       WEEK(rental_date) AS Week,
       MONTHNAME(rental_date) AS MonthName
FROM rental;

-- ---------------------
-- DISTINCT Operations
-- ---------------------

SELECT DISTINCT first_name
FROM sakila.actor 
ORDER BY first_name;

-- WHERE clause Comparision Operators

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name > 'Nick' AND actor_id < 100;

SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id <> 100;

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name != 'Nick';

-- ---------------------
-- Logical Operators
-- ---------------------
SELECT *
FROM actor
WHERE first_name = 'KENNETH' AND actor_id < 100 OR last_name = 'TEMPLE';

SELECT *
FROM actor
WHERE first_name = 'KENNETH' AND (actor_id < 100 OR last_name = 'TEMPLE');

-- IN
SELECT *
FROM actor
WHERE first_name IN ('NICK', 'JOHNNY')
ORDER BY first_name;

SELECT *
FROM actor
WHERE actor_id IN (55,1,2,3);

-- In Subquery
SELECT *
FROM actor
WHERE first_name IN ('NICK', 'JOHNNY', 'JOE', 'VIVIEN')
		OR actor_id IN
					(SELECT actor_id
                    FROM actor
                    WHERE last_name = 'DEGENERS');

SELECT *
FROM actor
WHERE first_name IN ('NICK', 'JOHNNY', 'JOE', 'VIVIEN')
		AND actor_id IN
					(SELECT actor_id
                    FROM actor
                    WHERE last_name = 'DEGENERES');

-- BETWEEN
SELECT *
FROM actor
WHERE actor_id BETWEEN 10 AND 30;

SELECT *
FROM actor
WHERE actor_id NOT BETWEEN 10 AND 30;

-- LIKE
SELECT *
FROM actor
WHERE first_name LIKE 'N%';

SELECT *
FROM actor
WHERE first_name LIKE 'A__E';

SELECT *
FROM actor
WHERE first_name LIKE 'A__E%';

SELECT *
FROM actor
WHERE first_name LIKE 'A%E%';

-- NULL

SELECT *
FROM address
WHERE address2 IS NULL;

SELECT *
FROM address
WHERE address2 IS NOT NULL;

-- ORDER BY

SELECT actor_id, CONCAT(first_name, ' ', last_name) AS FullName
FROM actor
ORDER BY CONCAT(first_name, ' ', last_name);
-- ABOVE IS SAME AS USING ALIAS NAME ******
SELECT actor_id, CONCAT(first_name, ' ', last_name) AS FullName
FROM actor
ORDER BY FullName;
-- SAME AS BELOW, 2 Means Column 2
SELECT actor_id, CONCAT(first_name, ' ', last_name) AS FullName
FROM actor
ORDER BY 2;


-- LIMIT

SELECT *
FROM actor
ORDER BY actor_id
LIMIT 12;

SELECT *
FROM actor
ORDER BY actor_id
LIMIT 15, 10;   -- First is off set, which mean it starts from line 15, and then retrieve 10 row

SELECT *
FROM actor
ORDER BY actor_id
LIMIT 25, 5;  -- This will return #26 to #30 

-- INSERT Statement

CREATE TABLE ActorSample (
	actor_id smallint(5) unsigned NOT NULL auto_increment,
    first_name varchar(45) NOT NULL,
    last_name varchar(45) NULL,
    last_update timestamp NOT NULL DEFAULT current_timestamp
		ON UPDATE current_timestamp,
	PRIMARY KEY (actor_id)
);

-- Insert Single Row

INSERT INTO ActorSample (first_name, last_name, last_update)
VALUE ('Shen', 'Sun', '2016-08-01');

-- Above is same as below but blow query needs to be same order as Columns
INSERT INTO ActorSample
VALUE (default, 'Xiaohang', 'Li', '2016-07-31');

SELECT *
FROM ActorSample
ORDER BY actor_id DESC;

-- Clean up
DROP TABLE ActorSample;

-- Insert Multiple Values

INSERT INTO ActorSample (first_name, last_name)
VALUES ('Shen-Yu', 'Sun'),
	   ('Lulu', 'Hang'),
	   ('Sai', 'Liu');

-- Subquery

INSERT INTO actorsample (first_name, last_name, last_update)
SELECT first_name, last_name, last_update
FROM actor
WHERE first_name = 'Nick';


-- INSERT all people from actor to ActorSample tables
INSERT INTO ActorSample (first_name, last_name, last_update)
SELECT first_name, last_name, last_update
FROM actor;

-- Update Single Row Single Column

UPDATE ActorSample
SET first_name = 'Shen', last_name = 'Sun'
WHERE actor_id = 200;

-- Update Multiple Rows Single Column

UPDATE ActorSample
SET first_name = 'Super'
WHERE actor_id IN (3,4,5);

-- Update using SELECT Statement

UPDATE ActorSample
SET first_name = 'Nupur'
WHERE actor_id IN (SELECT actor_id
					FROM film_actor
					WHERE film_id = 1);
             
-- DELETE Statement

DELETE
FROM ActorSample
WHERE actor_id = 1;

DELETE
FROM ActorSample
WHERE actor_id IN (SELECT actor_id
				   FROM actor);
                   

-- ------------
-- Join
-- ------------

CREATE TABLE table1
(ID INT, Value VARCHAR(10));

CREATE TABLE table2
(ID INT, Value VARCHAR(10));

INSERT INTO Table1 (ID, Value)
SELECT 1, 'First'
UNION ALL
SELECT 2, 'Second'
UNION ALL
SELECT 3, 'Third'
UNION ALL
SELECT 4, 'Fourth'
UNION ALL
SELECT 5, 'Fifth';

INSERT INTO Table2 (ID, Value)
SELECT 1, 'First'
UNION ALL
SELECT 2, 'Second'
UNION ALL
SELECT 3, 'Third'
UNION ALL
SELECT 6, 'Sixth'
UNION ALL
SELECT 7, 'Seventh'
UNION ALL
SELECT 8, 'Eight';

/* INNER JOIN */

SELECT t1.*, t2.*
FROM table1 t1
INNER JOIN Table2 t2 ON t1.ID = t2.ID;

SELECT t1.ID AS T1id, t1.Value AS T1value,
	   t2.ID AS T2id, t2.Value AS T2value
FROM table1 t1
INNER JOIN Table2 t2 ON t1.ID = t2.ID;

/* LEFT JOIN */

SELECT t1.ID AS t1ID, t1.value AS t1Value,
       t2.ID as t2ID, t2.value AS t2Value
FROM table1 t1
LEFT JOIN table2 t2 ON t1.ID = t2.ID;

/* RIGHT JOIN */

SELECT t1.ID AS t1ID, t1.value AS t1Value,
       t2.ID AS t2ID, t2.value AS t2Value
FROM table1 t1
RIGHT JOIN table2 t2 ON t1.ID = t2.ID;

/* Full Outer Join */
-- MySQL doesn't supprt Full outer join.
-- We need to use left and right join, and use UNION to put them together

SELECT t1.ID AS T1id, t1.value AS T1value,
	   t2.ID as T2id, t2.value AS T2value
FROM table1 t1
LEFT JOIN table2 t2 ON t1.ID = t2.ID
UNION
SELECT t1.ID AS T1id, t1.value AS T1value,
	   t2.ID as T2id, t2.value AS T2value
FROM table1 t1
RIGHT JOIN table2 t2 ON t1.ID = t2.ID;

/* CROSS JOIN */

SELECT t1.ID AS T1id, t1.value AS T1value,
       t2.ID AS T2id, t2.value AS T2value
FROM table1 t1
CROSS JOIN table2 t2;

-- --------------
-- PROBLEM SOLVE
-- --------------

-- Create tables for problem

CREATE Table Students (StudentID INT, StudentName VARCHAR(10));
CREATE Table Classes (ClassID INT, ClassName VARCHAR(10));
CREATE Table StudentClass (StudentID INT, ClassID INT);

INSERT INTO Students (StudentID, StudentName)
SELECT 1, 'John'
UNION ALL
SELECT 2, 'Matt'
UNION ALL
SELECT 3, 'James';

INSERT INTO Classes (ClassID, ClassName)
SELECT 1, 'Maths'
UNION ALL
SELECT 2, 'Arts'
UNION ALL
SELECT 3, 'History';


INSERT INTO StudentClass(StudentID, ClassID)
SELECT 1, 1
UNION ALL
SELECT 1, 2
UNION ALL
SELECT 3, 1
UNION ALL
SELECT 3, 2
UNION ALL
SELECT 3, 3;

SELECT *
FROM Students;
SELECT *
FROM Classes;
SELECT *
FROM StudentClass;

/* Question 1: What will be the best possible join if we want to retrieve
all the students who have signed up for the classes in the summer?
*/

SELECT st.StudentName, cl.ClassName
FROM StudentClass sc
INNER JOIN Classes cl ON cl.ClassID = sc.ClassID
INNER JOIN Students st ON st.StudentID = sc.StudentID;

/* Question 2: What will be the best possible join if we want to retrieve
all the students who have signed up fro no classes in summer? */

SELECT st.StudentName, cl.ClassName
FROM Students st
LEFT JOIN StudentClass sc ON st.StudentID = sc.StudentID
LEFT JOIN Classes cl ON cl.ClassID = sc.ClassID
WHERE cl.ClassName IS NULL;

-- Better version

SELECT st.StudentName
FROM Students st
LEFT JOIN StudentClass sc ON st.StudentID = sc.StudentID
WHERE sc.ClassID IS NULL;

