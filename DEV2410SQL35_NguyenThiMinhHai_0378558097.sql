create database DEV2010SQL35_NguyenThiMinhHai_0378558097
use DEV2010SQL35_NguyenThiMinhHai_0378558097
create table SalesPerson (
SisPerID nvarchar(10) primary key,
PerName nvarchar(50) 
)
create table Customer(
CustID nvarchar(10) primary key,
CusName nvarchar(50) ,

)
create table Inventory (
InvtID nvarchar(10) primary key,
Descr nvarchar(100) ,
StkBasePrc money,

)
create table xswSalesOrd(
OrderNbr nvarchar(5) primary key,
OrderDate Datetime,
SisPerID nvarchar(10) constraint FK_SisPerID FOREIGN KEY REFERENCES SalesPerson(SisPerID),
CustID nvarchar(10) constraint FK_CustID foreign key references Customer(CustID),
OrdAmt money ,
)
create table xswSisOrdDet(
OrderNbr nvarchar(5) constraint FK_OrderNbr foreign key references xswSalesOrd(OrderNbr),
InvtID nvarchar(10) constraint FK_InvtID foreign key references Inventory(InvtID),

LineQty int ,
LineAmt money,
SisPrice money
)


insert [dbo].[Customer](CustID, CusName) values(
'KH01',N'Nguyễn Thị Minh'),
('KH02',N'Nguyễn Việt Hoàng')
select * from [Customer]
go
insert [dbo].[SalesPerson] (SisPerID, PerName) values
('NV01',N'Hứa Minh Anh'),
('NV02',N'Bùi Quỳnh Hoa')
go
insert [dbo].[Inventory](InvtID, Descr, StkBasePrc) values
('HH03',N'Bút chì',50000),
('HH04',N'sổ tay',5000),
('HH01',N'Vở học sinh',50000),
('HH02',N'Sách giáo khoa',1000000)
go
insert [dbo].[xswSalesOrd] (OrderNbr, OrderDate, SisPerID, CustID, OrdAmt) values
('HD01','20240305','NV01','KH02',200000),
('HD02','20240505','NV01','KH01',300000),
('HD03','20240505','NV02','KH02',300000)
select * from [xswSalesOrd]
go
insert [dbo].[xswSisOrdDet] (OrderNbr, InvtID, LineQty,LineAmt, SisPrice) values
( 'HD01','HH01',2,100000,50000),
( 'HD01','HH02',1,100000,100000),
( 'HD02','HH02',3,300000,100000),
( 'HD03','HH01',6,300000,50000)
select * from [xswSisOrdDet]
go

--cau 4 
--4.1 hiển thị mặt hàng không bán được trong khu vực hà nội trong năm 2012
select  Inventory.InvtID, Descr, StkBasePrc
from Inventory
inner join xswSisOrdDet on xswSisOrdDet.InvtID= Inventory.InvtID
inner join xswSalesOrd on xswSalesOrd.OrderNbr= xswSisOrdDet.OrderNbr
where YEAR(OrderDate) != '2010'
--4.2 Những nhân viên nào không bán được bất kỳ gói OMO nào trong năm 2010
select DISTINCT SalesPerson.SisPerID, PerName
from SalesPerson
inner join xswSalesOrd on xswSalesOrd.SisPerID= SalesPerson.SisPerID
 inner join xswSisOrdDet on xswSisOrdDet.OrderNbr= xswSalesOrd.OrderNbr
 inner join Inventory on Inventory.InvtID= xswSisOrdDet.InvtID
 where Inventory.Descr not in (select Descr from Inventory inner join xswSisOrdDet on xswSisOrdDet.InvtID= Inventory.InvtID
															inner join xswSalesOrd on xswSalesOrd.OrderNbr= xswSisOrdDet.OrderNbr
															where Descr =N'OMO' and xswSisOrdDet.OrderNbr != null )
		and YEAR(OrderDate) = '2010'
--4.3. cho biết nahan viên nào có doanh số bán hàng lớn nhất trong quý 1 và quý 3
select DISTINCT top 1 SalesPerson.SisPerID, PerName
from SalesPerson
inner join xswSalesOrd on xswSalesOrd.SisPerID= SalesPerson.SisPerID
 inner join xswSisOrdDet on xswSisOrdDet.OrderNbr= xswSalesOrd.OrderNbr


--4.4 mặt hàng được mua với số lượng lớn nhất trong 6 tháng đầu năm
select top 1 Inventory.InvtID, Descr, StkBasePrc,max(sum(LineQty)) as SoLuong
from Inventory
inner join xswSisOrdDet on xswSisOrdDet.InvtID= Inventory.InvtID
inner join xswSalesOrd on xswSalesOrd.OrderNbr= xswSisOrdDet.OrderNbr
where MONTH(OrderDate) between 1 and 6 
--4.5 cho biết số hàng nào xuất hiện nhiều nhất trong các đơn hàng trong quý 4 của năm 2010
select top 1 Inventory.InvtID, Descr, StkBasePrc,count(xswSisOrdDet.InvtID)as solanxh
from Inventory
inner join xswSisOrdDet on xswSisOrdDet.InvtID= Inventory.InvtID
inner join xswSalesOrd on xswSalesOrd.OrderNbr= xswSisOrdDet.OrderNbr
where month(OrderDate) between 10 and 12
group by Inventory.InvtID, Descr, StkBasePrc
order by solanxh
--4.7 cho biết khách hàng nào có nhiều hóa đơn mua hàng nhất
select top 1 CusName, count (OrderNbr) as SoLuong
from Customer
inner join xswSalesOrd on xswSalesOrd.CustID= Customer.CustID
group by CusName
order by SoLuong desc
--4.8 mặt hàng nào chỉ được đặt mua nhỏ hơn 5 lần
select  Inventory.InvtID, Descr, StkBasePrc,count(xswSisOrdDet.InvtID)as solanmua
from Inventory
inner join xswSisOrdDet on xswSisOrdDet.InvtID= Inventory.InvtID
inner join xswSalesOrd on xswSalesOrd.OrderNbr= xswSisOrdDet.OrderNbr

group by Inventory.InvtID, Descr, StkBasePrc
having count(xswSisOrdDet.InvtID)<5
--4.9 . cho biết 10 khách hàng đã mua hàn nhiều nhất về mặt giá trị trong quý 1
select top 10 CusName, Customer.CustID, sum(LineAmt)as TongGiaTri
from Customer
inner join xswSalesOrd on xswSalesOrd.CustID= Customer.CustID
inner join xswSisOrdDet on xswSalesOrd.OrderNbr= xswSisOrdDet.OrderNbr
where MONTH(OrderDate) between 1 and 3 
group by CusName, Customer.CustID
order by TongGiaTri
--4.10 mỗi nahan viên của công ty đã bán được bao nhiêu khách hàng (nếu nahan viên chưa bán cho khách hàng nào 
--THÌ kết uqar bằng 0 không tính những đơn hàng có mã nhân viên bán hàng trùng với mã khách hàng)
select  PerName, count (CustID) as SoLuongKH 
from SalesPerson
inner join xswSalesOrd on xswSalesOrd.SisPerID= SalesPerson.SisPerID
group by PerName
order by SoLuongKH desc

--4.11.Tính doanh số bán hàng theo từng tháng
select month(OrderDate) as Tháng, sum(LineAmt)as TongDoanhThu
from xswSalesOrd 
inner join xswSisOrdDet on xswSisOrdDet.OrderNbr= xswSisOrdDet.OrderNbr

group by month(OrderDate)
order by TongDoanhThu
--4.12. só hượng hàng của từng mặt hàng đã bán theo từng tháng
select Descr, sum(LineQty)as SoLuongHang
from xswSisOrdDet 
inner join Inventory on xswSisOrdDet.InvtID= Inventory.InvtID
group by Descr
order by SoLuongHang
--4.13 .Nhân viên nào của công ty bán được nhiều hàng nhất và số lượng hàng đấy là bao nhiêu
select top 1 PerName,xswSalesOrd.SisPerID,sum(LineQty)as Soluonghang
from SalesPerson
inner join xswSalesOrd on xswSalesOrd.SisPerID= SalesPerson.SisPerID
inner join xswSisOrdDet on xswSisOrdDet.OrderNbr= xswSisOrdDet.OrderNbr
group by PerName,xswSalesOrd.SisPerID
order by Soluonghang desc
--4.14.hiển thị thông tn hóa đơn bán hàng 
select xswSalesOrd.OrderNbr ,OrderDate,SisPerID,CustID,xswSisOrdDet.InvtID,Descr,SUM(LineQty)as Soluongtunghang
from xswSalesOrd
inner join xswSisOrdDet on xswSalesOrd.OrderNbr= xswSisOrdDet.OrderNbr
inner join Inventory on Inventory.InvtID= xswSisOrdDet.InvtID
group by xswSalesOrd.OrderNbr ,OrderDate,SisPerID,CustID,xswSisOrdDet.InvtID,Descr

--4.15.Xóa tất cả những mạt hàng không được đặt mua bất cứ đơn hàng nào
delete
from Inventory
where Inventory.InvtID not in (select InvtID from xswSisOrdDet )
--4.16 Hiển thị toàn bộ danh thu theo từng tháng trường hợp nào không có doanh thu thì hiển thị 0
select month(OrderDate) as Tháng, sum(LineAmt)as TongDoanhThu 
from xswSalesOrd 
inner join xswSisOrdDet on xswSisOrdDet.OrderNbr= xswSisOrdDet.OrderNbr
group by month(OrderDate)
order by TongDoanhThu