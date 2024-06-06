--  7. Xóa một sinh viên dựa vào mã sinh viên
DELIMITER $$
CREATE PROCEDURE delete_student (IN p_ID varchar(11))
BEGIN
    DELETE FROM student
    WHERE
        ID = p_ID;
END$$
DELIMITER ;
