-- 1. Xóa một bản ghi cụ thể từ bảng advisor dựa trên hai tham số đầu vào là s_ID và i_ID

DELIMITER $$
CREATE PROCEDURE delete_advisor (
IN p_s_ID VARCHAR (11),
IN p_i_ID VARCHAR(5)
)
BEGIN
    DELETE FROM advisor
    WHERE s_ID = p_s_ID
		AND i_ID = p_i_ID;
END $$
DELIMITER ;
