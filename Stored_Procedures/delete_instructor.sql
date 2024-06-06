--  5. Xóa  một giảng viên dưa vào mã giảng viên
DELIMITER $$
CREATE PROCEDURE delete_instructor (IN p_ID varchar(6))
BEGIN
    DELETE FROM instructor
    WHERE
        ID = p_ID;
END$$
DELIMITER ;
-- Xóa giảng viên có mã giảng viên là ('GV001')
CALL delete_instructor ('GV001');
