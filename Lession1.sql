--biến - kiểu giá trị 
--1.1tên biến:
--+không phân biệt chữ hoa chữ thường
--+không bắt đầu bằng các ký tự đặc biệt tên biến đưuọc sửa dựng ký tuwh _ hoặc số 
-- 1.2:Kiểu giá trị
--kiểu số:
--+ số nguyên :BIT,smallint,INT,BIGINT,TINYINT
--+số thực: NUMBERIC,MONEY,FLOAT,REAL,DOUBLE
--kiểu chữ:
--+ chữ latinh:char,varchar
--+chữ unicode: nchar,nvarchar
--kiểu bit: binary, image
--thời gian:date, datetime

--TẠO CƠ SỞ DỮ LIỆU 

CREATE DATABASE DEMO

USE DEMO
GO

CREATE TABLE KHACHHANG(
Ma_KH INT NOT NULL,
Ten_KH NVARCHAR(50),

)
go
SELECT * FROM KHACHHANG
GO
--INSERT GIÁ TRỊ
--INSERT [dbo].[SANPHAM] VALUES
--(1,N'sẢN PHẨM 01', 6000)
--INSERT [dbo].[SANPHAM] VALUES
--(2,N'SẢN PHẨM 02', 6000)
--INSERT [dbo].[SANPHAM] VALUES
--(3,N'sẢN PHẨM 03', 6000)
--INSERT [dbo].[SANPHAM] VALUES
--(4,N'sẢN PHẨM 04', 6000)
--Select * from SANPHAM
--go

--INSERT [dbo].[SANPHAM]([Ma_SP],[Ten_SP]) VALUES
--(5,N'sẢN PHẨM 05' )

--drop table SanPham

CREATE TABLE SANPHAM(
Ma_SP INT Identity(1,1) ,
Ten_SP NVARCHAR(50),
GIA money
)
go
INSERT [dbo].[SANPHAM]([Ten_SP],[Gia]) VALUES
(N'sản phẩm 01', 6000),
(N'sản phẩm 02', 6000),
(N'sản phẩm 03', 6000),
(N'sản phẩm 04', 6000)
go
Select * from SANPHAM
--sửa bảng
--alter table tên _table
--câu lệnh sửa
alter table SANPHAM
add Active bit DEFAULT(1)
go
select * from SANPHAM
go
--PRIMARY KEY/ UNIQUE/check
--thêm khóa chính vào bảng
alter table SANPHAM
add constraint PK_Ma_SP primary key (Ma_SP) 
CREATE TABLE GIOHANG(
MA_ĐONANG INT PRIMARY KEY,
MA_SP INT constraint FK_Ma_SP FOREIGN KEY REFERENCES SANPHAM(Ma_SP),
SL int CHECK(SL>0)
)
go 
select * from GIOHANG
go 
CREATE TABLE GIOHANG(
MA_DONHANG INT Identity(1,1) PRIMARY KEY,
MA_SP INT constraint FK_Ma_SP FOREIGN KEY REFERENCES SANPHAM(Ma_SP),
SL int CHECK(SL>0)
)
go
 select* from GIOHANG
 insert GIOHANG ([MA_SP],[SL]) values
 (1,5)