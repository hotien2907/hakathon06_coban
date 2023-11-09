CREATE DATABASE QUANLYDIEMTHI;
USE QUANLYDIEMTHI;
-- Tạo bảng student
CREATE TABLE student
(
    studentId   VARCHAR(4) PRIMARY KEY NOT NULL,
    studentName VARCHAR(100)           NOT NULL,
    birthday    DATE                   NOT NULL,
    gender      BIT(1)                 NOT NULL,
    address     TEXT                   NOT NULL,
    phoneNumber VARCHAR(45)

);
-- Tạo bảng SUBJECT
CREATE TABLE subject
(
    subjectId   VARCHAR(4) PRIMARY KEY,
    subjectName VARCHAR(45) NOT NULL,
    priority    INT(11)     NOT NULL
);
-- Tạo bảng mark
CREATE TABLE mark
(
    studentId VARCHAR(4) NOT NULL,
    subjectId VARCHAR(4) NOT NULL,
    point     FLOAT      NOT NULL,
    FOREIGN KEY (studentId) REFERENCES student (studentId),
    FOREIGN KEY (subjectId) REFERENCES SUBJECT (subjectId)
);

INSERT INTO student
VALUES ('S001', 'Nguyễn Thế Anh', '1999-01-11', 1, 'Hà Nội', '984678082'),
       ('S002', 'Đặn Bảo Trâm', '1999-01-11', 0, 'Hà Nội', '984678082'),
       ('S003', 'Trần Hà Phương', '2000-05-05', 0, 'Nghệ An', '947645363'),
       ('S004', 'Đỗ Tiến Mạnh', '1999-03-26', 1, 'Hà Nội', '983665252'),
       ('S005', 'Phạm Duy Nhất', '1998-10-04', 1, 'Tuyên Quang', '987242678'),
       ('S006', 'Mai Văn Thái', '2002-06-22', 1, 'Nam Định', '984678082'),
       ('S007', 'Giang Gia Hân', '1996-11-10', 0, 'Phú Thọ', '982364753'),
       ('S008', 'Nguyễn Ngọc Bảo My', '1999-01-22', 0, 'Hà Nam', '927867453'),
       ('S009', 'Nguyễn Tiến Đạt', '1998-08-07', 1, 'Tuyên Quang', '98924673'),
       ('S010', 'Nguyễn Thiều Quang', '2000-09-18', 1, 'Hà Nội', '984678082');

-- Bảng SUBJECT
INSERT INTO SUBJECT (subjectId, subjectName, priority)
VALUES ('MH01', 'Toán', 2),
       ('MH02', 'Vật Lý', 2),
       ('MH03', 'Hóa Học', 1),
       ('MH04', 'Ngữ Văn', 1),
       ('MH05', 'Tiếng Anh', 2);


-- Bảng mark
INSERT INTO mark (studentId, subjectId, point)
VALUES ('S001', 'MH01', 8.5),
       ('S001', 'MH02', 7),
       ('S001', 'MH03', 9),
       ('S001', 'MH04', 9),
       ('S001', 'MH05', 5),
       ('S002', 'MH01', 9),
       ('S002', 'MH02', 8),
       ('S002', 'MH03', 6.5),
       ('S002', 'MH04', 8),
       ('S002', 'MH05', 6),
       ('S003', 'MH01', 7.5),
       ('S003', 'MH02', 6.5),
       ('S003', 'MH03', 8),
       ('S003', 'MH04', 7),
       ('S003', 'MH05', 7),
       ('S004', 'MH01', 6.0),
       ('S004', 'MH02', 7.0),
       ('S004', 'MH03', 5),
       ('S004', 'MH04', 6.5),
       ('S004', 'MH05', 8),
       ('S005', 'MH01', 5.5),
       ('S005', 'MH02', 8),
       ('S005', 'MH03', 7.5),
       ('S005', 'MH04', 8.5),
       ('S005', 'MH05', 9),


       ('S006', 'MH01', 8),
       ('S006', 'MH02', 10),
       ('S006', 'MH03', 9),
       ('S006', 'MH04', 7.5),
       ('S006', 'MH05', 6.5),

       ('S007', 'MH01', 9.5),
       ('S007', 'MH02', 9),
       ('S007', 'MH03', 6),
       ('S007', 'MH04', 9),
       ('S007', 'MH05', 4),

       ('S008', 'MH01', 10),
       ('S008', 'MH02', 8.5),
       ('S008', 'MH03', 8.5),
       ('S008', 'MH04', 6),
       ('S008', 'MH05', 9.5),

       ('S009', 'MH01', 7.5),
       ('S009', 'MH02', 7),
       ('S009', 'MH03', 9),
       ('S009', 'MH04', 5),
       ('S009', 'MH05', 10),

       ('S010', 'MH01', 6.5),
       ('S010', 'MH02', 8),
       ('S010', 'MH03', 5.5),
       ('S010', 'MH04', 4),
       ('S010', 'MH05', 7);
# BÀI 2
-- sửa tên sv
UPDATE student
SET studentName ='Đỗ Đức Mạnh'
WHERE studentId = 'S004';
-- sửa tên mh va hsmh
UPDATE subject
SET subjectName = 'Ngoại Ngữ',
    priority    = 1
WHERE subjectId = 'MH05';
-- sửa lại điểm
UPDATE mark
SET point = 8.5
WHERE studentId = 'S009'
  AND subjectId = 'MH01';
UPDATE mark
SET point = 7
WHERE studentId = 'S009'
  AND subjectId = 'MH02';
UPDATE mark
SET point = 5.5
WHERE studentId = 'S009'
  AND subjectId = 'MH03';
UPDATE mark
SET point = 6
WHERE studentId = 'S009'
  AND subjectId = 'MH04';
UPDATE mark
SET point = 9
WHERE studentId = 'S009'
  AND subjectId = 'MH05';


SELECT *
FROM student;
select *
from subject;
SELECT *
FROM mark;


-- Xoá điểm của học sinh có mã S010
DELETE
FROM mark
WHERE studentId = 'S010';

-- Xoá học sinh có mã S010
DELETE
FROM student
WHERE studentId = 'S010';

-- BÀI 3: Truy vấn dữ liệu
-- 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student
SELECT * FROM student;
-- 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1
SELECT subjectName, subjectId
FROM SUBJECT
WHERE priority = 1;
-- 3. Hiển thị thông tin học sinh bao gồm: mã học sinh, tên học sinh, tuổi, giới tính và quê quán
SELECT studentId,
       studentName,
       YEAR(CURRENT_DATE) - YEAR(birthday)           AS age,
       CASE WHEN gender = 1 THEN 'Nam' ELSE 'Nữ' END AS gender,
       address
FROM student;
-- 4.Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn
# Toán và sắp xếp theo điểm giảm dần.
SELECT S.studentName, SB.subjectName, M.point
FROM student S
         JOIN mark M ON S.studentId = M.studentId
         JOIN SUBJECT SB ON M.subjectId = SB.subjectId
WHERE SB.subjectId = 'MH01'
ORDER BY M.point DESC;


-- 5. Thống kê số lượng học sinh theo giới tính
SELECT (CASE WHEN s.gender = 1 THEN 'Nam' ELSE 'Nữ' END) AS GioTinh, COUNT(1) AS SoLuong
FROM student s
GROUP BY gender;


-- 6.Tính tổng điểm của từng học sinh
SELECT S.studentId,
       S.studentName,
       SUM(M.point) AS TongDiem
FROM student S
         LEFT JOIN mark M ON S.studentId = M.studentId
GROUP BY S.studentId, S.studentName;
-- Tính điểm trung bình của từng học sinh
SELECT S.studentId,
       S.studentName,
       AVG(M.point) AS DiemTrungBinh
FROM student S
         LEFT JOIN mark M ON S.studentId = M.studentId
GROUP BY S.studentId, S.studentName;

# Bài 4: Tạo View, Index, Procedure
-- 1. Tạo VIEW STUDENT_VIEW
CREATE VIEW STUDENT_VIEW AS
SELECT studentId, studentName, CASE WHEN gender = 1 THEN 'Nam' ELSE 'Nữ' END AS gender, address
FROM student;
SELECT * FROM STUDENT_VIEW;
-- 2 tạo view AVERAGE_MARK_VIEW
CREATE VIEW AVERAGE_MARK_VIEW AS
SELECT S.studentId, S.studentName, AVG(M.point) AS DiemTrungBinh
FROM student S
         LEFT JOIN mark M ON S.studentId = M.studentId
GROUP BY S.studentId, S.studentName;

SELECT * FROM AVERAGE_MARK_VIEW;


-- 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT
CREATE INDEX idx_phoneNumber ON student (phoneNumber);

-- 4. Tạo PROCEDURE PROC_INSERTSTUDENT
DELIMITER $$
CREATE PROCEDURE PROC_INSERTSTUDENT(
    IN studentIdParam VARCHAR(4),
    IN studentNameParam VARCHAR(100),
    IN birthdayParam DATE,
    IN genderParam BIT(1),
    IN addressParam TEXT,
    IN phoneNumberParam VARCHAR(45)
)
BEGIN
    INSERT INTO STUDENT (studentId, studentName, birthday, gender, address, phoneNumber)
    VALUES (studentIdParam, studentNameParam, birthdayParam, genderParam, addressParam, phoneNumberParam);
END$$
DELIMITER ;
CALL  PROC_INSERTSTUDENT('S011', 'Nguyễn Thế A', '1999-01-11', 1, 'Hà Nội', '084678082');

-- 5. Tạo PROCEDURE PROC_UPDATESUBJECT
DELIMITER $$
CREATE PROCEDURE PROC_UPDATESUBJECT(
    IN subjectIdParam VARCHAR(4),
    IN subjectNameParam VARCHAR(45)
)
BEGIN
    UPDATE SUBJECT
    SET subjectName = subjectNameParam
    WHERE subjectId = subjectIdParam;
END$$
DELIMITER ;
CALL PROC_UPDATESUBJECT ('MH04','Âm nhạc');

-- 6. Tạo PROCEDURE PROC_DELETEMARK
DELIMITER $$
CREATE PROCEDURE PROC_DELETEMARK(
    IN studentIdParam VARCHAR(4),
    OUT countRows  INT
)
BEGIN
    DELETE FROM mark WHERE studentId = studentIdParam;
    SET countRows = ROW_COUNT();
END$$
DELIMITER ;
CALL PROC_DELETEMARK('S003', @countRows);
-- In ra số bản ghi đã xóa
SELECT @countRows AS countRows;