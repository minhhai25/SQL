create database LAB02
USE LAB02
DECLARE @name varchar(30)='Devmaster'
SELECT N'Name:' ,@name
DECLARE @age int=21
SELECT N'Age:' ,@age

Create table Employee(
ID int primary key,
FullName nvarchar(35),
Gender bit,
Birthday datetime,
Address nvarchar(max),
Email nvarchar(50),
Salary float
)
go

alter table Employee
add Phone varchar(20)
go

insert Employee (ID, FullName, Gender, Birthday, Address, Salary, Phone) values
(8,N'Nguyễn  Kim Ngân',1,'19481020 ',N'Hà Nội',7500000,N'012393278643'),
(7,N'Nguyễn  Kim Cúc',1,'20011020 ',N'Hà Nội',7500000,N'012393278643'),
(6,N'Nguyễn  hải',1,'20021025 ',N'Bắc Giang',50000,N'012393278643'),
(1,N'Nguyễn thị minh hải',0,'20020525 ',N'Bắc Giang',2000000,N'012393278643'),
(2,N'Nguyễn thị minh Hà',1,'20020525 ',N'Bắc Giang',5000000,N'012393278643'),
(3,N'Nguyễn thị Vân',1,'20020525 ',N'Bắc Giang',500000,N'012393278643'),
(4,N'Nguyễn  quang hải',1,'20020525 ',N'Bắc Giang',7000000,N'012393278643'),
(5,N'Nguyễn  hải',1,'20020525 ',N'Bắc Giang',50000,N'012393278643')
go
select * from Employee

go
--đưa ra các nhân viên có lương >2000000
select * from Employee
where Salary>2000000
--đưa ra nhân viên có sinh nhật trong tháng này
select * from Employee
where month(Birthday)=10
go
--đưa ra danh sách các nhân viên hiển thị thêm cột tuổi và cột birthday dạng dd/mm/yy
select*,
convert(varchar(10),[Birthday],103)as FormattedBirthday,
datediff(year,Birthday,getdate())as AGE
from Employee;

go
--đưa ra tấ cả các nhân viên có địa chỉ tại hà nội
SELECT * FROM Employee
WHERE Address LIKE '%Hà Nội%';
--sỬA TÊN NHÂN VIÊN CÓ MÃ "nv01" THÀNH TÊN "JOHN"
UPDATE Employee 
SET FullName ='JOHN'
WHERE ID='1'
SELECT * FROM Employee
GO
--XÓA TẤT CẢ NHÂN VIÊN CÓ TUỔI LỚN HƠN 50
DELETE Employee
WHERE DATEDIFF(year,Birthday,getdate())>50
GO
--COPPY NHỮNG NHÂN VIÊN CÓ TUỔI >50 SANG 1 BẢNG MỚI
SELECT *
INTO Employee_Above50
FROM Employee
WHERE DATEDIFF(YEAR, Birthday, GETDATE()) > 50;
SELECT * FROM Employee_Above50
GO
--ĐẾM SỐ NAHAN VIÊN
SELECT COUNT(*) AS TotalEmployye
FROM Employee