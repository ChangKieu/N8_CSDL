DELIMITER $$

CREATE PROCEDURE UPDATE_CREDITS(
IN p_ID VARCHAR(11),
IN p_course_id VARCHAR(8),
IN p_class_id VARCHAR(8),
IN p_semester VARCHAR(6),
IN p_year DECIMAL(4,0),
IN p_grade DECIMAL(2,1))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION     
BEGIN
	SHOW ERRORS;  
	ROLLBACK;  
END; 
START TRANSACTION;

SELECT @flag_fi := COUNT(course_id) FROM course WHERE course_id = p_course_id;    

SELECT @flag_se := grade FROM takes 
WHERE ID = p_ID AND course_id = p_course_id 
AND class_id = p_class_id AND semester = p_semester AND year = p_year;

SELECT @cred := credits FROM course WHERE course_id = p_course_id;

IF (@flag_fi = 0) THEN 
ROLLBACK;
ELSEIF (@flag_se > 4) THEN
UPDATE student SET tot_cred = tot_cred + @cred WHERE ID = p_ID;
COMMIT;
ELSE COMMIT;
END IF; 

SELECT @flag_fi, @flag_se;
END$$

DELIMITER ;