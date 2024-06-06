--  2. Xóa một phòng học cụ thể từ bảng classroom dựa trên các tham số đầu vào là building và room_number
DELIMITER $$
CREATE PROCEDURE delete_classroom (
	IN p_building varchar(5),
	IN p_room_number varchar(5))
BEGIN
    DELETE FROM classroom
    WHERE
        building = p_building AND 
	room_number = p_room_number;
END$$
DELIMITER ;
-- Xóa phòng 101 ở tòa A1
CALL delete_classroom('A1', '101');
