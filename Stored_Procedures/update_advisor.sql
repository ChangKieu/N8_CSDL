--  12. Cập nhật thông tin của 1 cố vấn
DELIMITER ??
CREATE PROCEDURE update_advisor (
	IN new_iID VARCHAR(5),
    	IN sID VARCHAR(11)
)
BEGIN
	UPDATE advisor
    	SET i_ID = new_iID
    WHERE s_ID = sID;
END ??
DELIMITER ;
--  cập nhật thông tin của một cố vấn cho sinh viên có mã sinh viên là 'B21DCCB010'
CALL update_advisor ('GV005','B21DCCB010');
