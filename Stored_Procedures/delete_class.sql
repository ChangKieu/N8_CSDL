--  6. Xóa một lớp học dựa vào mã lớp và mã khóa học
DELIMITER $$
CREATE PROCEDURE delete_class (
	p_courseid VARCHAR(8),
    	p_classid VARCHAR(8)
)
BEGIN
    DELETE FROM class
    WHERE course_id = p_courseid
	AND class_id = p_classid;
END$$
DELIMITER ;
