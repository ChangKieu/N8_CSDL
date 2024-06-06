--  9. Thêm 1 khoá học mới
DELIMITER ??
CREATE PROCEDURE insert_course (
	IN new_courseid INT,
    	IN new_title VARCHAR (50),
    	IN new_deptname VARCHAR (50),
    	IN new_credits INT
)
BEGIN
	INSERT INTO course (course_id, title, dept_name, credits)
	VALUES (new_courseid, new_title, new_deptname, new_credits);
END ??
DELIMITER ;
