--  14. Cập nhật số tín chỉ của sinh viên theo mã sinh viên và khoa
DELIMITER ??
CREATE PROCEDURE update_totcred(
    IN p_id VARCHAR(11),
    IN p_deptname VARCHAR(50),
    IN p_new_totcred DECIMAL(3,0)
)
BEGIN
    UPDATE student
    SET tot_cred = p_new_totcred
    WHERE
        id = p_id
    AND 
        dept_name = p_deptname;
END ??
DELIMITER ;

-- Cập nhật số tín chỉ lên 50 cho sinh viên có mã sinh viên là 'B23DCCN017' thuộc 'Khoa Công nghệ thông tin'
CALL update_totcred('B23DCCN017', 'Khoa Công nghệ thông tin', 50);
