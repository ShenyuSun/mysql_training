-- First Store Procedure

SELECT * FROM sakila.language;

-- Change Delimiter
DELIMITER //
-- Create Stored Procedure
CREATE PROCEDURE GetLanguage()
BEGIN
	SELECT * FROM language;
END//
-- Change Delimiter again
DELIMITER ;

-- Call Stored Procedure
CALL GetLanguage();

DROP PROCEDURE GetLanguage;

-- -------------
-- While Loop
-- -------------

-- Change Delimiter
DELIMITER //
-- Create stored procedure
CREATE PROCEDURE WhileLoop()
BEGIN
	DECLARE i INT DEFAULT 1;
    WHILE i < 6 DO
		SELECT POW(i,i);
        SET i = i + 1;
	END WHILE;
END//
-- Change Delimiter again
DELIMITER ;

-- Call Stored Procedure
CALL WhileLoop();

DROP PROCEDURE WhileLoop;


-- ---------------------------------------
-- Stored Procedure taking parameters
-- ---------------------------------------

-- Change Delimiter
DELIMITER //
-- Create Stored Procedure
CREATE PROCEDURE ConcatName (FirstName VARCHAR(100), LastName VARCHAR(100))
BEGIN
	DECLARE FullName VARCHAR(200);
    SET FullName = CONCAT(FirstName, ' ', LastName);
    SELECT FullName;
END//
-- Change Delimiter again
DELIMITER ;

-- Call Stored Procedure
CALL ConcatName('Shen-Yu', 'Sun');
CALL ConcatName('Lulu', 'Hang');
CALL ConcatName('Tom', 'Cruise');

DROP PROCEDURE ConcatName;