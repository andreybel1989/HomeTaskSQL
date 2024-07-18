USE seminar_6;
DELIMITER $$

CREATE FUNCTION fun(value INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;

    
    SET days = FLOOR(value / 86400);
    SET value = value % 86400;
    SET hours = FLOOR(value / 3600);
    SET value = value % 3600;
    SET minutes = FLOOR(value / 60);
    SET seconds = value % 60;

    
    RETURN CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
END $$
DELIMITER ;

SELECT fun(123456);



DELIMITER $$

CREATE FUNCTION fun1(N INT) 
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(100);
    DECLARE i INT DEFAULT 2; 

    SET result = '';

    WHILE i <= N DO
        IF i % 2 = 0 THEN
            SET result = CONCAT(result, i, ', ');
        END IF;
        SET i = i + 2; 
    END WHILE;

    
    IF LENGTH(result) > 0 THEN
        SET result = SUBSTRING(result, 1, LENGTH(result) - 2);
    END IF;

    RETURN result;
END $$

DELIMITER ;
SELECT fun1(11);
