--  8. Thêm một bản ghi mới vào bảng advisor với các giá trị cho các cột s_ID và i_ID
	DELIMITER ??
CREATE PROCEDURE insert_advisor (
	IN sID VARCHAR(11),
    	IN iID VARCHAR(5)
)
BEGIN
	INSERT INTO advisor (s_ID, i_ID)
    	VALUES (sID, iID);
END ??
DELIMITER ;

--  chèn một sinh viên có mã sinh viên là 'B21DCPT100' và do giảng viên có mã 'GV003' cố vấn
CALL insert_advisor ('B21DCPT100', 'GV003');
