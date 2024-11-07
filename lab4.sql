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
select * 
from SinhVien
where SUBSTRING (TenSV,2,1) between 'a' and 'm'
go
select * 
from SinhVien
where LEFT(TenSV,1) between 'a'and 'm'
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

--8. Kết quả học tập của sinh viên, gồm các thông tin: Họ tên sinh viên, Mã khoa,  
--Tên môn học, Điểm thi, Loại. Trong đó, Loại sẽ là Giỏi nếu điểm thi > 8, từ 6 đến  8 
--thì Loại là Khá, nhỏ hơn 6 thì loại là Trung Bình

select CONCAT(HoSV,'', TenSV) as HoTen ,  MaKH , KQ.Diem, TenMH,
iif(KQ.Diem>8,N'Giỏi',iiF(KQ.Diem>6,N'Khá',N'Trung Bình'))as Loại
from SinhVien SV
inner join Ketqua KQ on SV.MaSV= KQ.MaSV
inner join MonHoc MH on MH.MaMH=KQ.MaMH

--====================================
--BÀI 3
--1. Cho biết trung bình điểm thi theo từng môn, gồm các thông tin: Mã môn, Tên  môn, Trung bình điểm thi 
select MH.MaMH,TenMH,AVG(KQ.Diem) as DiemTrungBinh
from MonHoc MH
inner join Ketqua KQ on KQ.MaMH=MH.MaMH 
group by MH.MaMH,TenMH
--2. Danh sách số môn thi của từng sinh viên, gồm các thông tin: Họ tên sinh viên,  Tên khoa, Tổng số môn thi 
select  CONCAT(HoSV,'',TenSV) as HoTen, TenKH, count(KetQua.MaMH)as TongSoMH 
from SinhVien 
inner join Khoa on Khoa.MaKH = SinhVien.MaKH 
inner join Ketqua on Ketqua.MaSV= SinhVien.MaSV
group by HoSV,TenSV,TenKH
--3. Tổng điểm thi của từng sinh viên, các thông tin: Tên sinh viên, Tên khoa, Phái,  Tổng điểm thi
select TenSV, Phai, TenKH,sum(Diem)as TongDiem
from SinhVien 
inner join Khoa on Khoa.MaKH = SinhVien.MaKH
inner join Ketqua on Ketqua.MaSV= SinhVien.MaSV
group by TenSV,Phai,TenKH


--4. Cho biết tổng số sinh viên ở mỗi khoa, gồm các thông tin: Tên khoa, Tổng số sinh  viên 


--5. Cho biết điểm cao nhất của mỗi sinh viên, gồm thông tin:Họ tên sinh viên, Điểm  

select CONCAT(HoSV,'',TenSV) as HoTen,Max( Diem)as Diem
from SinhVien 
inner join Ketqua on Ketqua.MaSV= SinhVien.MaSV
group by CONCAT(HoSV,'',TenSV)
--6.Thông tin của môn học có số tiết nhiều nhất: Tên môn học, Số tiết 
--7. Cho biết học bổng cao nhất của từng khoa, gồm Mã khoa, Tên khoa, Học bổng  cao nhất  

select Khoa.MaKH,TenKH,max(HocBong)as HocBongCaoNhat
from Khoa 
join SinhVien on SinhVien.MaKH= Khoa.MaKH
group by Khoa.MaKH,TenKH
--8. Cho biết điểm cao nhất của mỗi môn, gồm: Tên môn, Điểm cao nhất  
--9. Thống kê số sinh viên học của từng môn, thông tin có: Mã môn, Tên môn, Số  sinh viên đang học 
select MonHoc.MaMH,TenMH, count(MaSV)as SoSinhVien 
from MonHoc 
join Ketqua on MonHoc.MaMH = Ketqua.MaMH
group by MonHoc.MaMH,TenMH
--10.Cho biết môn nào có điểm thi cao nhất, gồmcác thông tin: Tên môn, Số tiết, Tên  sinh viên, Điểm  
--11.Cho biết khoa nào có đông sinh viên nhất, gồm Mã khoa, Tên khoa, Tổng số sinh  viên  
--12.Cho biết khoa nào có sinh viên lảnh học bổng cao nhất, gồm các thông tin sau:  Tên khoa, Họ tên sinh viên, Học bổng 
--13.Cho biết sinh viên của khoa Tin học có có học bổng cao nhất, gồm các thông tin:  Mã sinh viên, Họ sinh viên, Tên sinh viên, Tên khoa, Học bổng  
--14.Cho biết sinh viên nào có điểm môn Cơ sở dữ liệu lớn nhất, gồm thông tin: Họ  sinh viên, Tên môn, Điểm  
--15.Cho biết 3 sinh viên có điểm thi môn Đồ hoạthấp nhất, thông tin: Họ tên sinh  viên, Tên khoa, Tên môn, Điểm  
--16.Cho biết nào có nhiều sinh viên nữ nhất, gồm các thông tin: Mã khoa, Tên khoa  
--17.Thống kê sinh viên theo khoa, gồm các thông tin: Mã khoa, Tên khoa, Tổng số  sinh viên, Tổng số sinh viên nữ  
--18.Cho biết kết quả học tập của sinh viên, gồm Họ tên sinh viên, Tên khoa, Kết quả.  Trong đó, Kết quả sẽ là Đậu nếu không có môn nào có điểm nhỏ hơn 4  
--19.Danh sách những sinh viên không có môn nàonhỏ hơn 4 điểm, gồm các thông  tin: Họ tên sinh viên, Tên khoa, Phái  
--20.Cho biết danh sách những môn không có điểm thi nhỏ hơn 4, gồm các thông  tin: Mã môn, Tên Môn  
--21.Cho biết những khoa không có sinh viên rớt, sinh viên rớt nếu điểm thi của môn  nhỏ hơn 5, gồm các thông tin: Mã khoa, Tên khoa  
--22.Thống kê số sinh viên đậu và số sinh viên rớt của từng môn, biết răng sinh viên  rớt khi điểm của môn nhỏ hơn 5, gồm có: Mã môn, Tên môn, Số sinh viên đậu,  Số sinh viên rớt 
--23.Cho biết môn nào không có sinh viên rớt, gồm có: Mã môn, Tên môn 
--24.Danh sách sinh viên không có môn nào rớt, thông tin gồm: Mã sinh viên, Họ tên,  Mã khoa 
--25.Danh sách các sinh viên rớt trên 2 môn, gồm Mã sinh viên, Họ sinh viên, Tên  sinh viên, Mã khoa  
--26.Cho biết danh sách những khoa có nhiều hơn 10 sinh viên, gồm Mã khoa, Tên  khoa, Tổng số sinh viên của khoa  
--27.Danh sách những sinh viên thi nhiều hơn 4 môn, gồm có Mã sinh viên, Họ tên  sinh viên, Số môn thi  
--28.Cho biết khoa có 5 sinh viên nam trở lên, thông tin gồm có: Mã khoa, Tên khoa,  Tổng số sinh viên nam  
--29.Danh sách những sinh viên có trung bình điểm thi lớn hơn 4, gồm các thông tin  sau: Họ tên sinh viên, Tên khoa, Phái, Điểm trung bình các môn  
--30.Cho biết trung bình điểm thi của từng môn, chỉ lấy môn nào có trung bình điểm  thi lớn hơn 6, thông tin gồm có: Mã môn, Tên môn, Trung bình điểm 
--=================================================================
--BÀI 4
--1. Cho biết danh sách những sinh viên của một khoa, gồm: Mã sinh viên, Họ tên  sinh viên, Giới tính, Tên khoa.
--Trong đó, giá trị mã khoa cần xem danh sách sinh  viên sẽ được người dùng nhập khi thực thi câu truy vấn  
declare @MaKH nvarchar(2)
set @MaKH = 'AV'
select concat(HoSV,'', TenSV), Phai as GioiTinh, TenKH
from SinhVien
inner join Khoa on Khoa.MaKH=SinhVien.MaKH
where Khoa.MaKH = @MaKH

--2. Liệt kê danh sách sinh viên có điểm môn Cơ sở dữ liệu lớn hơn một giá trị 
--bất  kỳ do người sử dụng nhập vào khi thực thi câu truy vấn, thông tin gồm: Mã sinh  viên, Họ tên sinh viên, Tên môn, Điểm  
declare @Diem real
set @Diem = 3
select SinhVien.MaSV, concat(HoSV,'',TenSV) as HoTen, TenMH, Diem 
from SinhVien
inner join Ketqua on Ketqua.MaSV= SinhVien.MaSV
inner join MonHoc on Ketqua.MaMH=MonHoc.MaMH
where TenMH= N'Cơ sở dữ liệu' and Diem>@Diem
--3. Cho kết quả thi của các sinh viên theo môn, tên môn cần xem kết quả sẽ được  nhập vào khi thực thi câu truy vấn.
--Thông tin hiển thị gồm: Mã sinh viên, Tên  khoa, Tên môn, Điểm
declare @TenMon nvarchar(50)
set @TenMon= N'Cơ sở dữ liệu'
select SinhVien.MaSV, TenKH, TenMH, Diem 
from SinhVien
inner join Khoa on Khoa.MaKH=SinhVien.MaKH
inner join Ketqua on Ketqua.MaSV= SinhVien.MaSV
inner join MonHoc on Ketqua.MaMH=MonHoc.MaMH
where TenMH=@TenMon

--==============
--BÀI 5
--1. Danh sách sinh viên chưa thi môn nào, thông tin gồm: Mã sinh viên, Mã khoa,  Phái  
select MaSV,MaKH, Phai
from SinhVien
where MaSV not in (select MaSV from Ketqua)
--2. Danh sách những sinh viên chưa thi môn Cơsở dữ liệu, gồm các thông tin: Mã  sinh viên, Họ tên sinh viên, Mã khoa  
select MaSV, CONCAT(HoSV,'',TenSV),MaKH
from SinhVien 
where MaSV not in (select MaSV from Ketqua
inner join MonHoc on MonHoc.MaMH=Ketqua.MaMH
where TenMH=N'Cơ sở dữ liệu') 
--3. Cho biết môn nào chưa có sinh viên thi, gồm thông tin về: Mã môn, Tên môn,  Sô tiết 
select MaMH,TenMH ,Sotiet
from MonHoc
where MaMH not in (select MonHoc.MaMH from MonHoc inner join Ketqua on Ketqua.MaMH=MonHoc.MaMH  )
--4. Khoa nào chưa có sinh viên học  
select TenKH
from Khoa 
where MaKH not in (select Khoa.MaKH from SinhVien inner join Khoa on Khoa.MaKH=SinhVien.MaKH)
--5. Cho biết những sinh viên của khoa Anh văn chưa thi môn Cơ sở dữ liệu  
select CONCAT(HoSV,'',TenSV)as TenSVChuaThiMonCSDL 
from SinhVien
inner join Khoa on Khoa.MaKH= SinhVien.MaKH
where TenKH= N'Anh Văn' and MaSV not in 
(select KetQua.MaSV 
from Ketqua inner join MonHoc on MonHoc.MaMH=Ketqua.MaMH
where TenMH= N'Cơ sở dữ liệu'
)
--6. Cho biết môn nào chưa có sinh viên khoa Lý thi  
--7. Danh sách những sinh viên có điểm thi mônĐồ hoạ nhỏ hơn điểm thi môn Đồ  hoạ nhỏ nhất của sinh viên khoa Tin học  

select CONCAT(HoSV,'',TenSV)
from SinhVien 
inner join Ketqua on Ketqua.MaSV= SinhVien.MaSV
inner join MonHoc on Ketqua.MaMH = MonHoc.MaMH
where TenMH= N'Đồ họa ứng dụng' and
Ketqua.Diem < (select min(Diem)
				from Ketqua inner join MonHoc on MonHoc.MaMH=Ketqua.MaMH
				inner join SinhVien on SinhVien.MaSV=Ketqua.MaSV
				inner join Khoa on SinhVien.MaKH= Khoa.MaKH
				where TenKH= N'Tin học' and TenMH=N'Đồ họa ứng dụng') 
--8. Liệt kê những sinh viên sinh sau sinh viên có tuổi nhỏ nhất trong khoa Anh văn

select CONCAT(HoSV,'',TenSV),YEAR(GETDATE()) - YEAR(NgaySinh) AS Tuoi
from SinhVien
where YEAR(GETDATE()) - YEAR(NgaySinh)  < (select min(YEAR(GETDATE()) - YEAR(NgaySinh))  
													from SinhVien 
													inner join Khoa on khoa.MaKH= SinhVien.MaKH 
													where TenKH= N'Anh văn') 
--những sinh viên có ngày sinh sau sinh viên nhỏ nhất khoa tin
select CONCAT(HoSV,'',TenSV),NgaySinh
from SinhVien
where NgaySinh  < (select min(NgaySinh)  
					from SinhVien 
					inner join Khoa on khoa.MaKH= SinhVien.MaKH 
					where TenKH= N'Anh văn') 
--9. Cho biết những sinh viên có học bổng lớn hơn tổng học bổng của những sinh  viên thuộc khoa Triết 

--10.Danh sách sinh viên có nơi sinh cùng với nơi sinh của sinh viên có học bổng lớn  nhất trong khoa Lý  
--11.Danh sách sinh viên có điểm cao nhất ứng với mỗi môn, gồm thông tin: Mã sinh  viên, Họ tên sinh viên, Tên môn, Điểm  
--12.Các sinh viên có học bổng cao nhất theo từng khoa, gồm Mã sinh viên, Tên khoa,  Học bổng 
--===================================
--BÀI 6 : THÊM DỮ LIỆU VÀO CSDL
--1. Thêm một sinh viên mới gồm các thông tin sau: • Mã sinh viên: C01  
--• Họ sinh viên: Lê Thành  
--• Tên sinh viên: Nguyên  
--• Phái: Nam  
--• Ngày sinh: 20/10/1980  
--•Nơi sinh: Thành phố Hồ Chí Minh  
--•Mã khoa: TH 
--Học bổng: 850,000  
--2. Thêm một môn học mới gồm các thông tin sau:  • Mã môn học: 06  
--• Tên môn học: Xử lý ảnh  
--• Số tiết: 45  
--3. Thêm một khoa mới gồm các thông tin sau:  • Mã khoa: CT  
--• Tên khoa: Công trình  
--4. Thêm một sinh viên mới gồm các thông tin sau:  • Mã sinh viên: C02  
--• Họ sinh viên: Nguyễn Trần  
--• Tên sinh viên: Quân  
--• Phái: Nam  
--• Ngày sinh: lấy ngày hiện hiện  
--• Nơi sinh: Huế  
--• Mã khoa: CT  
--• Học bổng: 950,000 
--5. Thêm vào bảng kết quả gồm các thông tin sau:  
--• Mã sinh viên: lấy tất cả những sinh viên của khoa Tin học  
--• Mã môn học: 06  
--• Điểm: 7  
--6. Thêm vào bảng kết quả gồm các thông tin sau:  
--• Mã sinh viên: C02  
--• Mã môn học: lấy tất cả những môn học có trong bảng môn học  • Điểm: 8 
