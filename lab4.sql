use QLSINHVIEN
go
-- BÀI 1 ===================================================================

/*
1. Cho biết danh sách các môn học, gồm các thông tin sau: Mã môn học, Tên môn
học, Số tiết.
*/
SELECT MaMH, TenMH, Sotiet
FROM MonHoc
/*
2. Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh viên,
Tên sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã sinh viên
tăng dần.
*/
SELECT MaSV, HoSV, TenSV,HocBong
FROM SinhVien
ORDER BY MaSV ASC
/*
3. Danh sách các sinh viên, gồm các thông tin sau: Mã sinh viên, Tên sinh viên,
Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự của tên.
*/
SELECT MaSV, TenSV, Phai, NgaySinh
FROM SinhVien
ORDER BY TenSV ASC
/*
4. Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông tin
sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
*/
SELECT HoSV + ' '+TenSV AS [Họ Tên], NgaySinh, HocBong
FROM SinhVien
ORDER BY NgaySinh ASc , HocBong desc
go
/*
5. Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã môn,
Tên môn, Số tiết.
*/
select MaMH, TenMH, Sotiet
from MonHoc
where TenMH like N'T%'
go

/*
6. Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là i, gồm các
thông tin: Họ tên sinh viên, Ngày sinh, Phái
*/
select HoSV, TenSV, NgaySinh, Phai
from SinhVien
where TenSV like N'%i'
go
/*
7. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm các
thông tin: Mã khoa, Tên khoa.
*/
select MaKH, TenKH
from Khoa
where TenKH like N'_N%'
go
/*
8. Liệt kê những sinh viên mà họ có chứa chữ Thị.
*/
select HoSV, TenSV, NgaySinh, Phai
from SinhVien
where TenSV like N'Thị'
go
/*
9. Cho biết danh sách những sinh viên ký tự đầu tiên của
tên nằm trong khoảng từ a đến m, gồm các thông tin: Mã sinh viên,Họ tên sinh
viên,Phái, Học bổng.
*/
select *
from SinhVien
where TenSV like N'[^a-m]%'
go
/*
10. Cho biết danh sách những sinh viên mà têncó chứa ký tự nằm trong khoảng
từ a đến m, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Nơi sinh, Học
bổng. Danh sách được sắp xếp tăng dần theo họ tên sinh viên.
*/
select *
from SinhVien
where TenSV like N'%[^a-m]%'
go
/*
11. Cho biết danh sách các sinh viên của khoa Anh văn, gồm các thông tin sau: Mã  sinh viên, Họ tên sinh viên, 
Ngày sinh, Mã khoa.  
*/
SELECT MaSV, k.MaKH,HoSV+ ''+TenSV as [họ tên], NgaySinh
FROM SinhVien s inner join Khoa k on s.MaKH = k.MaKH
WHERE k.MaKH LIKE N'AV'
/*
12. Liệt kê danh sách sinh viên của khoa Vật Lý, gồm các thông tin sau: Mã sinh viên,  
Họ tên sinh viên, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Ngày sinh  giảm dần.  
*/
SELECT MaSV, k.MaKH,HoSV+ ''+TenSV as [họ tên], NgaySinh
FROM SinhVien s inner join Khoa k on s.MaKH = k.MaKH
WHERE k.MaKH LIKE N'AV'
ORDER BY S.NgaySinh DESC
/*13. Cho biết danh sách các sinh viên có học bổng lớn hơn 500,000, gồm các thông  tin: Mã sinh viên, 
Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ được sắp  xếp theo thứ tự Mã khoa giảm dần.  
*/
SELECT MaSV, k.MaKH,HoSV+ ''+TenSV as [họ tên], HocBong
FROM SinhVien s inner join Khoa k on s.MaKH = k.MaKH
ORDER BY K.MaKH DESC

/*14.Liệt kê danh sách sinh viên sinh vào ngày 20/12/1987,gồm các thông tin: Họ  tên sinh viên,Mã khoa,Học bổng.  
*/
SELECT MaSV, k.MaKH,HoSV+ ''+TenSV as [họ tên], HocBong
FROM SinhVien s inner join Khoa k on s.MaKH = k.MaKH
WHERE S.NgaySinh = '1987/12/20'
/*15. Cho biết các sinh viên sinh sau ngày 20/12/1977, gồm các thông tin: Họ tên sinh  viên, Ngày sinh, 
Nơi sinh, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự  ngày sinh giảm dần.  
*/
SELECT MaSV, HoSV+ ''+TenSV as [họ tên], HocBong
FROM SinhVien
WHERE NgaySinh = '1977/12/20'
ORDER BY NgaySinh DESC
/*16. Liệt kê các sinh viên có học bổng lớn hơn 100,000 và sinh ở Tp HCM, gồm các  thông tin: Họ tên sinh viên, 
Mã khoa, Nơi sinh, Học bổng.  
*/
SELECT MaSV, k.MaKH,HoSV+ ''+TenSV as [họ tên], HocBong, NoiSinh
FROM SinhVien s inner join Khoa k on s.MaKH = k.MaKH
WHERE s.HocBong > 100000 and s.NoiSinh = N'Tp. HCM'
/*17. Danh sách các sinh viên của khoa Anh văn và khoa Triết, gồm các thông tin: Mã  sinh viên, Mã khoa, Phái. 
*/
SELECT MaSV, k.MaKH,HoSV+ ''+TenSV as [họ tên], NgaySinh
FROM SinhVien s inner join Khoa k on s.MaKH = k.MaKH
WHERE k.MaKH LIKE N'AV' or k.MaKH LIKE N'TR'
/*
18. Cho biết những sinh viên có ngày sinh từ ngày 01/01/1986 đến ngày  05/06/1992, gồm các thông tin: 
Mã sinh viên, Ngày sinh, Nơi sinh, Học bổng.  
*/
SELECT MaSV, HoSV+ ''+TenSV as [họ tên], HocBong, NgaySinh, NoiSinh
FROM SinhVien
WHERE NgaySinh between '1986/01/01' and '1992/06/05'
/*19. Danh sách những sinh viên có học bổng từ 200,000 đến 800,000, gồm các thông  tin: Mã sinh viên, Ngày sinh,
Phái, Mã khoa.  
*/
SELECT MaSV, k.MaKH,HoSV+ ''+TenSV as [họ tên], NgaySinh,Phai
FROM SinhVien s inner join Khoa k on s.MaKH = k.MaKH
WHERE s.HocBong between 200000 and 800000
/*20. Cho biết những môn học có số tiết lớn hơn 40 và nhỏ hơn 60, gồm các thông  tin: Mã môn học, Tên môn học, 
Số tiết.  
*/
SELECT MaMH, TenMH, Sotiet
FROM MonHoc
where Sotiet > 40 and Sotiet <60 
/*21. Liệt kê những sinh viên nam của khoa Anh văn, gồm các thông tin: Mã sinh viên,  Họ tên sinh viên, Phái.  
*/
SELECT MaSV, k.MaKH,HoSV+ ''+TenSV as [họ tên], NgaySinh,  Phai = CASE Phai
								when 1 then N'nam'
								end
FROM SinhVien s inner join Khoa k on s.MaKH = k.MaKH
WHERE k.MaKH LIKE N'AV' and s.Phai = 1
/*22. Danh sách sinh viên có nơi sinh ở Hà Nội và ngày sinh sau ngày 01/01/1990,  gồm các thông tin: 
Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.  
*/
SELECT MaSV, HoSV+ ''+TenSV as [họ tên], NgaySinh, NoiSinh
FROM SinhVien
WHERE NoiSinh = N'Hà Nội' and NgaySinh < '1990/01/01'
/*23. Liệt kê những sinh viên nữ, tên có chứa chữ N.  
*/
select MaSV, TenSV , Phai = CASE Phai
								when 0 then N'nữ'
							end
from SinhVien
where TenSV = N'%'
/*24. Danh sách các nam sinh viên khoa Tin Học có ngày sinh sau ngày 30/5/1986.  
*/
SELECT MaSV, k.MaKH,HoSV+ ''+TenSV as [họ tên], NgaySinh,  Phai = CASE Phai
								when 1 then N'nam'
								end
FROM SinhVien s inner join Khoa k on s.MaKH = k.MaKH
WHERE k.MaKH LIKE N'TH' and s.NgaySinh > 1986/05/30
/*25. Liệt kê danh sách sinh viên gồm các thông tin sau: Họ và tên sinh viên, Giới tính,  Ngày sinh. 
Trong đó Giới tính hiển thị ở dạng Nam/Nữ tuỳ theo giá trị của field  Phai là True hay False.  
*/
select MaSV, TenSV , Phai = CASE Phai
								when 1 then N'nam'
								when 0 then N'nữ'
								else N'khác'
							end
from SinhVien
/*26. Cho biết danh sách sinh viên gồm các thôngtin sau: Mã sinh viên, Tuổi, Nơi sinh,  Mã khoa. 
Trong đó Tuổi sẽ được tính bằng cách lấy năm hiện hành trừ cho năm  sinh  
*/
SELECT MaSV, k.MaKH, YEAR(GETDATE()) - YEAR(NgaySinh) AS Tuoi,  Phai 
FROM SinhVien s inner join Khoa k on s.MaKH = k.MaKH
/*27. Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh viên,  Tuổi, Học bổng  
*/
SELECT MaSV,  YEAR(GETDATE()) - YEAR(NgaySinh) AS Tuoi,  Phai 
FROM SinhVien
where YEAR(GETDATE()) - YEAR(NgaySinh) >20
/*28. Danh sách những sinh viên có tuổi từ 20 đến 30, thông tin gồm: Họ tên sinh  viên, Tuổi, Tên khoa 
*/
SELECT MaSV,  YEAR(GETDATE()) - YEAR(NgaySinh) AS Tuoi,  Phai 
FROM SinhVien
where YEAR(GETDATE()) - YEAR(NgaySinh) in (20,30)

--==============================================================
-- BÀI 2: Sử dụng hàm trong truy vấn dữ liệu 

/*
1. Liệt kê danh sách sinh viên gồm các thông tin sau: Họ và tên sinh viên, Giới tính,  Tuổi, Mã khoa. 
Trong đó Giới tính hiển thị ởdạng Nam/Nữ tuỳ theo giá trị của  field Phai là True hay False, 
Tuổi sẽ được tính bằng cách lấy năm hiện hành trừ  cho năm sinh. Danh sách sẽ được sắp xếp theo thứ tự Tuổi 
giảm dần  
*/
select MaSV, TenSV , k.MaKH , YEAR(GETDATE()) - YEAR(NgaySinh) AS Tuoi, Phai = CASE Phai
																	when 1 then N'nam'
																	when 0 then N'nữ'
																	else N'khác'
																end
from SinhVien s inner join Khoa k on s.MaKH = k.MaKH
order by  YEAR(GETDATE()) - YEAR(NgaySinh) desc
/*
2. Danh sách sinh viên sinh vào tháng 2 năm 1994, gồm các thông tin: Họ tên sinh  viên, Phái, Ngày sinh. 
Trong đó, Ngày sinh chỉ lấy giá trị ngày của trường NGAYSINH.  
*/
SELECT HoSV, TenSV , DAY(NgaySinh) AS NgaySinh
FROM SinhVien
WHERE MONTH(NgaySinh) = 2 AND YEAR(NgaySinh) = 1994;
/*3. Sắp xếp dữ liệu giảm dần theo cột Ngày sinh  
*/
SELECT HoSV, TenSV , NgaySinh
FROM SinhVien
order by NgaySinh desc
/*4. Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên, Phái,  Mã khoa, Mức học bổng. 
Trong đó, mức học bổng sẽ hiển thị là “Học bổng cao”  nếu giá trị của field học bổng lớn hơn 500,000 
và ngược lại hiển thị là “Mức  trung bình”  
*/
SELECT MaSV, k.MaKH,HoSV, TenSV, NgaySinh,  Phai, HocBong = case --s.HocBong
															when HocBong > 500000 then N'học bổng cao'
															when HocBong < 500000 then N'mức trung bình'
															end
FROM SinhVien s inner join Khoa k on s.MaKH = k.MaKH
/*5. Cho biết điểm thi của các sinh viên, gồm các thông tin: Họ tên sinh viên, Mã  môn học, Điểm. 
Kết quả sẽ được sắp theo thứ tự Họ tên sinh viên và mã môn  học tăng dần  
*/
SELECT MaSV, k.MaKH,HoSV+ ''+TenSV as [họ tên], NgaySinh,  s.DiemTrungBinh
FROM SinhVien s inner join Khoa k on s.MaKH = k.MaKH
order by s.TenSV, k.MaKH asc
/*6. Danh sách sinh viên của khoa Anh văn, điều kiện lọc phải sử dụng tên khoa, gồm  các thông tin sau: 
Họ tên sinh viên, Giới tính, Tên khoa. Trong đó, Giới tính sẽ  hiển thị dạng Nam/Nữ  
*/
SELECT MaSV, k.TenKH,HoSV, TenSV, NgaySinh, Phai = CASE Phai
																	when 1 then N'nam'
																	when 0 then N'nữ'
																	else N'khác'
																end
FROM SinhVien s inner join Khoa k on s.MaKH = k.MaKH
where k.TenKH =N'Anh Văn'
/*7. Liệt kê bảng điểm của sinh viên khoa Tin Học, gồm các thông tin:Tên khoa, Họ  tên sinh viên, 
Tên môn học, Số tiết, Điểm  
*/
SELECT s.TenSV, k.TenKH, h.TenMH, h.Sotiet, s.DiemTrungBinh
FROM Khoa k inner join SinhVien s on k.MaKH = s.MaKH 
	inner join Ketqua kq on s.MaSV = kq.MaSV 
	inner join MonHoc h on kq.MaMH = h.MaMH
where k.MaKH = N'TH'



