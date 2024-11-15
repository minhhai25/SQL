--VIEW 

--CREATE VIEW <ten_VIEW> AS <câu_lệnh_select>
CREATE VIEW vw_KETQUA
AS 
SELECT MaSV, MaMH, Diem FROM Ketqua 

--sử dụng view
select MaSV, MaMH, Diem from vw_KETQUA
--cập nhật view
alter VIEW vw_KETQUA
AS 
SELECT MaSV, TenMH, Diem FROM Ketqua 
inner join MonHoc on MonHoc.MaMH=Ketqua.MaMH
go      
select * from vw_KETQUA
--xóa view
drop view vw_KETQUA 

sp_helptext vw_KETQUA

--PROCEDURE
--tạo procedure
--create procedure <ten_procedure> AS <tham_bie
--đưua ra danh sách điểm của môn học nhâp từ bàn phím và điểm > number??
Alter procedure  sp_Diem
	@TenMon nvarchar(50) ,
	@Diem float
AS
BEGIN
		SELECT TenSV, TenMH, Diem FROM Ketqua 
		inner join MonHoc on MonHoc.MaMH=Ketqua.MaMH
		inner join SinhVien on Ketqua.MaSV=SinhVien.MaSV
		where TenMH=@TenMon and Diem>@Diem
END
go
EXEC sp_Diem @TenMon=N'Cơ sở dữ liệu', @Diem=2
-- chú ý sp khi  gán giá trị default sẽ không cần khai báo tham số khi sử dụng
drop proc sp_Diem

--đưa ra tên sinh viên có học bổng lớn nhất của khoa nào
alter proc sp_SinhVien
@TenKhoa nvarchar(50),
@TenSV nvarchar(50) output
as
begin 
	set @TenSV = (select top 1 TenSV from SinhVien where MaKH in (Select MaKH from Khoa Where TenKH=@TenKhoa)order by HocBong desc)
	print @TenSV 
	
	end 
	go 
Declare @TenSV nvarchar(50)
exec sp_SinhVien @TenKhoa = N'Anh Văn', @TenSV=@TenSV output
select @TenSV

select * from SinhVien where MaKH='AV'


--TRIGGER 
go
alter trigger trg_InsertSinhVien on SinhVien
for insert 
as 
begin 
	if(Select HocBong from inserted )<0
	begin
		print N'Học bổng lơn hơn 0'
		rollback transaction 
	end
end

insert SinhVien values 
('TS',N'Nguyễn Văn',' A',0,'20010301','BĐ','AV',-1000,'')

insert SinhVien values 
('TS1',N'Nguyễn Văn',' A',0,'20010301','BĐ','AV',1000,'')
select * from SinhVien

--update 
go
create trigger trg_UpdateSinhVien on SinhVien
for update 
as 
begin 
	if(Select HocBong from inserted )<0
	begin
		print N'Học bổng lơn hơn 0'
		rollback transaction 
	end
end
go 
update sinhvien set HocBong = -1000 where MaSV ='TS1'
go
update sinhvien set HocBong = 2000 where MaSV ='TS1'
select * from SinhVien
--delete
create trigger trg_DleteSinhVien on SinhVien
for delete 
as 
begin 
	if(Select HocBong from deleted )>0--lớn hơn 0 thì được delete <0 thì k được xóa
	begin
		print N'Học bổng lơn hơn 0 không được xóa'
		rollback transaction 
	end
end
go 
delete SinhVien where MaSV='TS1'


