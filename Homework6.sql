-- Создайте процедуру ИЛИ функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER $$
CREATE FUNCTION IF NOT EXISTS times(seconds INT) RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE message VARCHAR(255);

    
    SET days = seconds DIV (60 * 60 * 24);
    SET seconds = seconds MOD (60 * 60 * 24);
    
    SET hours = seconds DIV (60 * 60);
    SET seconds = seconds MOD (60 * 60);
    
    SET minutes = seconds DIV (60);
    SET seconds = seconds MOD (60);
    
    SET message = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
    
    RETURN message;
    
END $$
DELIMITER ;

SELECT times(123456);

-- Выведите только четные числа от 1 до 10 (Через цикл).
-- Пример: 2,4,6,8,10

DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS numbers()
BEGIN
    DECLARE n INT default 0;
    DROP TABLE IF EXISTS nums;
    CREATE TABLE nums (n INT);

    WHILE n < 10 DO
		SET n = n + 2;
		INSERT INTO nums VALUES(n);
    END WHILE;

    SELECT * FROM nums;
END $$
DELIMITER ;

CALL numbers();

