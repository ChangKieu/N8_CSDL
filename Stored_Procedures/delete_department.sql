--  4. Xóa  một khoa
DELIMITER $$
CREATE PROCEDURE delete_department (IN p_dept_name varchar(50))
BEGIN
    DELETE FROM department
    WHERE
        dept_name = p_dept_name;
END $$
DELIMITER ;
