--khai báo biến
--DECLARE @ten_BIẾN kiểu dữ liệu = gán_giá _trị(có thể có/không)
DECLARE @ten varchar(30)='Devmaster'
--seclect gọi theo cột và dòng
SELECT N'họ và tên' ,@ten
--print gọi theo giá trị
PRINT N'họ và tên :'+ @ten

--gán giá trị 
--set @ten_bien = gán_giá_trị
SET @ten= 'Devmaster 02'
SELECT N'họ và tên' ,@ten

DECLARE @KHACHHANG TABLE (
Ma_KH int identity(1,1),
Ten_KH nvarchar(50)
)
INSERT @KHACHHANG Values
(N'Khách hàng 01'),
(N'Khách hàng 02'),
(N'Khách hàng 03')
select* from @KHACHHANG

select * into #KHACHHANG from @KHACHHANG
select * from #KHACHHANG
go