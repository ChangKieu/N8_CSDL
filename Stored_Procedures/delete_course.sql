--  3. Xóa  các khóa học của một khoa
DELIMITER $$
CREATE PROCEDURE delete_course (IN p_deptname varchar(50))
BEGIN
    DELETE FROM course
    WHERE
        dept_name = p_deptname;
END$$
DELIMITER ;
-- Xóa các khóa học của “Khoa cơ bản’
CALL delete_course ('Khoa Cơ bản');
