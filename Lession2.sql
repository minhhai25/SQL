--use QLBH
--select * from VATTU


--insert VATTU ([MaVTu],[TenVTu],[DvTinh],[PhanTram]) values
--('VT01',N'Tủ lạnh Toshiba 204',N'cái',50),
--('VT02',N'Tủ lạnh Toshiba 205',N'cái',50),
--('VT03',N'Tủ lạnh Toshiba 206',N'cái',80),
--('VT04',N'Tủ lạnh Toshiba 207',N'cái',60)
----ghi chú
--khi xáo dữu liệu trên bảng mà có liên kết đến bảng bên nhiều
--thì chú ý đến điều kiện tham chiếu (ON DELETE NO ACTION)
--3.5 xóa sạch đến điều kiện 


CREATE DATABASE DEMO2
ON PRIMARY (
    NAME = DEMO2_Data,
    FILENAME = 'E:\DevMaster\DATABASE\DEMO2_Data.mdf',  -- Đường dẫn tới tệp dữ liệu
    SIZE = 50MB,
    FILEGROWTH = 10MB,
    MAXSIZE = 200MB
)
LOG ON (
    NAME = DEMO2_Log,
    FILENAME = 'E:\DevMaster\DATABASE\DEMO2_Log.ldf',  -- Đường dẫn tới tệp nhật ký
    SIZE = 10MB,
    FILEGROWTH = 5MB
);

4 cách đặt tên cột
select 'devmaster acdemy ' as [company]
go
select 'devmaster acdemy ' as 'company'
go
select 'devmaster acdemy '  [company]
go
select 'devmaster acdemy ' = 'company'
go
--truy vấn dữ liệu từ 1 bảng sử dụng dấu * 
-- liệt kê tất cả các dữu liệu trong bảng khoa (*)
-- 4.lựa chọn các cột trong tập kết quả 
-- liệt ke các thông tin msv,hosv, tensv,ngaysinh 
 --5.sử dụng biểu mẫu trong select 
 --hoten được gộp từ hovs và ténv
 select MaSV,HoSV+''+TenSV as HoTen from SinhVien
 select MaSV,concat(HoSV ,'',TenSV) from SinhVien
 --liệt kê các thông tin masv
 --liệt kê sinh viên cso học bổng trong khoảng 10.000 đến 100.000
 select * from SinhVien
 where HocBong>= 10000 and HocBong <=100000
--  where HocBong between 10000 and 100000
 ---so sánh tương đối (LIKE /NOT LIKE) 
 --liệt kê sinhh viên có tên bắt đầu bằng 'T'
 select * from SinhVien 
 where TenSV like N'T%'
 --Liệt kê sinh viên có chứa chữ 'u'
  select * from SinhVien 
  where TenSV like '%u%'
 --liệt kê sinh viên cso tên thứ tự thứ 2 là 'u'
  select * from SinhVien 
  where TenSV like '_u%'
 --liệt kê sinh viên có chứa 3 ký tự
  select * from SinhVien 
    where TenSV like '___'
--c2
  select * from SinhVien 
  where len(TenSV)=3
  --liệt kê sinh viên có chưa ký tự đầu tiên trong khoảng a-m
    select * from SinhVien 
	where TenSV like '[a-m]%'
	

--sử dụng tập hợp 
--liệt kê --sinh viên có tháng sinh là tháng 2 và tháng 8
select * from SinhVien where month(NgaySinh) in (2,8)
--select * from SinhVien where month(NgaySinh)=2 or month(NgaySinh)=8
select * from SinhVien where month(NgaySinh) not in (1,3,4,5,6,7,8,10,11,12)

--7 SẮP XẾP DỮU LIỆU
--ORDER BY<column_Name> | <index> |<alise name> ASC (mặc định)

select * from SinhVien order by HoSV 
select MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong from SinhVien order by 5

--LIỆT KÊ SINH VIÊN , DỮ LIỆU SẮP XẾP THEO TÊN TĂNG DẦN NẾU TRÙNG THFI SẮP XẾP THEO HOVS GIẢM DẦN
select* from SinhVien 
order by TenSV ASC,HoSV DESC
--LUYỆN TẬP
 --15 cho biết các sinh viên sau nagyf 20/12/1998 gồm các thông tin :họ và tên , ngày sinh, nơi sinh,học bổng danh sách đưuọc sắp xếp 
 --theo thứu tự ngày sinh giảm dần

 select  concat(HoSV,'', TenSV) as HoTen, NgaySinh, NoiSinh, HocBong from SinhVien
 where NgaySinh > '1998-12-20'
 order by NgaySinh DESC


 --===========================================================
 --7. sử dụng từ khóa top trong select 
 --TOP: trích ra số bản ghi đầu tiên trong tập kết quả
 select top 1 * from SinhVien 
 --top1 with ties (nhiều bản ghi hơn có những phần cao nhất bằng nhau)

 --8  từ khóa DISTINICT trong select
 --distinict:loại bỏ dòng trùng lặp (giữu lại 1)

 --9 case ...when...then trong select
 --liệt kê sinh viên trong phai hiện thị 1~nuwx,0~ nam,null~khacs

 select MaSV,HoSV,TenSV,
 case Phai when 1 then N'Nữ'
			when 0 then N'Nam'
			else N'Khác' end as Phai
 from SinhVien
 -- 10. sử dụng hàm IIF =>IIF (boolean_expression,true_value,false_value)
 select  MaSV,HoSV,TenSV,IIF(Phai=1,N'Nữ',IIF(Phai=0,N'Nam',N'Khác'))as Phai
 from SinhVien
 --========================
 --truy vấn dữu liệu kết hơp 2 hay nhiều bảng(join)
 --inner join
 select * from SinhVien 
 inner join Khoa on SinhVien.MaKH= Khoa.MaKH
 select * from Khoa
 --left join 
 --right join 
 --full join
 --liệt kê các thông tin :MaKH,TenKH,MaSV,HoSV,TenSV, Phai,Diem
 --khoa, sinh viên, KETQUA
 select Khoa.MaKH, TenKH,Sinhvien.MaSV,HoSV,TenSV,Phai,Diem
 from Khoa left join SinhVien on SinhVien.MaKH = Khoa.MaKH join Ketqua on Ketqua.MaSV= SinhVien.MaSV   