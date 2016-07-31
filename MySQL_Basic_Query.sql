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


