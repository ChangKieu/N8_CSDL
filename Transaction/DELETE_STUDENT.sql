DELIMITER $$
 
CREATE PROCEDURE DELETE_STUDENT(IN p_ID VARCHAR(25))
BEGIN

START TRANSACTION;

SELECT @flag:=COUNT(ID) FROM  student WHERE ID = p_ID;
DELETE FROM takes WHERE ID = p_ID;
COMMIT;
DELETE FROM advisor WHERE s_ID = p_ID;
COMMIT;
DELETE FROM student WHERE ID = p_ID;

IF (@flag = 0) 
THEN ROLLBACK;
ELSE COMMIT;
END IF;

END$$

DELIMITER ;