-- 1. Sắp xếp danh sách người hướng dẫn có lương từ 5000.00 đến 5500.00 theo thứ tự lương tăng dần
SELECT 
    *
FROM
    instructor
WHERE
    salary BETWEEN 5000.00 AND 5500.00
ORDER BY salary ASC;

-- 2. Lấy ra thông tin những phòng ban có số lượng mã khóa học >= 20 sắp xếp theo thứ tự tăng dần của mã khóa học
SELECT dept_name, COUNT(course_id)
FROM course
GROUP BY dept_name
HAVING COUNT(course_id) >= 20
ORDER BY COUNT(course_id) ASC;

-- 3. Thống kê ngân sách các tòa nhà của phòng ban 
SELECT 
    building,
    SUM(budget) TongNgansach,
    AVG(budget) TrungbinhNgansach,
    MAX(budget) NgansachLonnhat,
    MIN(budget) NgansachNhonhat
FROM
    department
GROUP BY building;

-- 4. Danh sách sinh viên đang học lớp 'INT1358'
SELECT s.ID, s.name
FROM student s
JOIN takes t ON s.ID = t.ID
WHERE t.course_id = 'INT1358';

-- 5. Hiển thị thông tin gồm: ID, tên giảng viên, tiền lương, số lớp dạy với tên khoa là Khoa Đa phương tiện 
SELECT i.ID, 
       i.name, 
       i.salary, 
       COUNT(t.course_id) AS num_classes
FROM instructor i
LEFT JOIN teaches t ON i.ID = t.ID
WHERE i.dept_name = 'Khoa Đa phương tiện'
GROUP BY i.ID, i.name, i.salary;

-- 6. Tìm khoa có mức lương trung bình cao nhất
SELECT 
    dept_name
FROM
    instructor
GROUP BY dept_name
HAVING AVG(salary) = (
    SELECT MAX(avg_salary)
    FROM (
        SELECT AVG(salary) AS avg_salary
        FROM instructor
        GROUP BY dept_name
    ) AS subquery
);
 
-- 7. Tìm tổng số sinh viên (riêng biệt) đã tham gia các phần khóa học do giảng viên có ID GV056 giảng dạy 	
SELECT 
    COUNT(DISTINCT ID)
FROM
    takes
WHERE
    EXISTS
    ( SELECT 
            course_id, class_id, semester, year
        FROM
            teaches
        WHERE
            teaches.ID = 'GV056'
                AND takes.course_id = teaches.course_id
                AND takes.class_id = teaches.class_id
                AND takes.semester = teaches.semester
                AND takes.year = teaches.year);

-- 8. Sắp xếp số lượng giảng viên trong mỗi bộ môn giảng dạy một khóa học vào học kỳ mùa đông năm 2023 theo thứ tự giảm dần

SELECT 
    instructor.ID,
    instructor.name,
    instructor.dept_name, 
    COUNT(teaches.ID) AS instr_count
FROM
    instructor
JOIN
    teaches ON instructor.ID = teaches.ID
WHERE
    teaches.year = 2023
    AND teaches.semester = 'Winter'
GROUP BY 
    instructor.ID, 
    instructor.name, 
    instructor.dept_name
ORDER BY 
    instr_count DESC;

-- 9. Tổng số sinh viên khoá 2023
SELECT 
    COUNT(*) AS total_students
FROM
    student
WHERE
    ID LIKE 'B23%';


-- 10. Tìm tất cả các phòng ban có tổng mức lương là lớn hơn mức trung bình của tổng tiền lương ở tất cả các bộ phận. 
WITH dept_total (dept_name, VALUE) AS
	(SELECT 
           dept_name, sum(salary)
	 FROM 
          instructor
     GROUP BY dept_name),
dept_total_AVG(VALUE) AS
	(SELECT 
           AVG(VALUE)
     FROM dept_total)
SELECT 
      dept_name
FROM 
      dept_total, dept_total_avg
WHERE dept_total.VALUE > dept_total_avg.VALUE;


-- 11. Tìm sinh viên của khóa học có điểm nhỏ hơn 4

SELECT s.ID, s.name, s.dept_name, t.course_id, t.class_id, t.semester, t.year, t.grade
FROM student s
JOIN takes t ON s.ID = t.ID
JOIN class c ON t.course_id = c.course_id 
            AND t.class_id = c.class_id 
            AND t.semester = c.semester 
            AND t.year = c.year
WHERE t.grade < 4;

-- 12. Hiển thị danh sách học viên mà giảng viên có ID là 'GV005' đang cố vấn theo ID của học viên tăng dần
SELECT s.ID, s.name, s.dept_name, s.tot_cred
FROM student s
JOIN advisor a ON s.ID = a.s_ID
WHERE a.i_ID = 'GV005'
ORDER BY s.ID;

-- 13. Hiển thị danh sách các lớp học có điểm trung bình trên 7.0 trong học kỳ mùa đông năm 2023
SELECT 
    c.course_id, 
    c.class_id, 
    c.semester, 
    c.year, 
    AVG(t.grade) AS average_grade
FROM 
    class c
JOIN 
    takes t ON c.course_id = t.course_id AND c.class_id = t.class_id AND c.semester = t.semester AND c.year = t.year
WHERE 
    c.semester = 'Winter' AND c.year = 2023
GROUP BY 
    c.course_id, c.class_id, c.semester, c.year
HAVING 
    AVG(t.grade) > 7.0
ORDER BY 
    c.course_id, c.class_id;

-- 14. Hiển thị danh sách 10 sinh viên có điểm cao nhất môn 'MUL1454'
SELECT s.ID, s.name, AVG(t.grade) AS avg_grade
FROM student s, takes t
WHERE s.ID = t.ID
  AND t.course_id = 'MUL1454'
GROUP BY s.ID, s.name
ORDER BY avg_grade DESC
LIMIT 10;

-- 15. Hiển thị danh sách lớp trong học kỳ hè năm 2022 có điểm trung bình học viên trên 7.0
SELECT DISTINCT c.course_id, c.class_id, c.semester, c.year, AVG(t.grade)
FROM class c
JOIN takes t ON c.course_id = t.course_id AND c.class_id = t.class_id AND c.semester = t.semester AND c.year = t.year
JOIN student s ON t.ID = s.ID
WHERE c.semester = 'Summer' AND c.year = 2022
GROUP BY c.course_id, c.class_id, c.semester, c.year
HAVING AVG(t.grade) > 7.0
ORDER BY AVG(t.grade);
