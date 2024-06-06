--  10. Thêm 1 khoa mới
DELIMITER ??
CREATE PROCEDURE insert_department (
	IN new_deptname VARCHAR(50),
    	IN new_building VARCHAR(5),
    	IN new_budget DECIMAL(12,2)
)
BEGIN
INSERT INTO department (dept_name, building, budget)
    	VALUES (new_deptname, new_building, new_budget);
END ??
DELIMITER ;
