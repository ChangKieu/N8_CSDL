--  13. Cập nhật sức chứa của một phòng học 
DELIMITER ??
CREATE PROCEDURE update_capacity (
	IN old_capacity DECIMAL (3,0),
    	IN new_capacity DECIMAL (3,0)
)
BEGIN
	UPDATE classroom
    	SET capacity = new_capacity
    WHERE capacity = old_capacity;
END ??
DELIMITER ;
	--  Cập nhật phòng có sức chứa 55 người lên 60 người
	CALL update_capacity (55,60);