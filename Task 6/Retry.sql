use OOVEO_Salon
--1
select MsTreatmentType.TreatmentTypeName,MsTreatment.TreatmentName,MsTreatment.Price
from MsTreatment
inner join MsTreatmentType on MsTreatmentType.TreatmentTypeId=MsTreatment.TreatmentTypeId
where (
MsTreatmentType.TreatmentTypeName like '%hair%' 
or 
MsTreatmentType.TreatmentTypeName like '%nail%'
)
and
MsTreatment.Price < 100000

--2
select distinct MsStaff.StaffName,
lower(left(MsStaff.StaffName,1)) + lower(right(MsStaff.StaffName,CHARINDEX(' ',reverse(MsStaff.StaffName)) -1)) + '@oosalon.com' as StaffEmail 
from MsStaff
inner join HeaderSalonServices on HeaderSalonServices.StaffId=MsStaff.StaffId
where datename(weekday,HeaderSalonServices.TransactionDate)='Thursday'

--3
select replace(HeaderSalonServices.TransactionId,'TR','Trans') as 'New Transcation ID',
	HeaderSalonServices.TransactionId as 'Old Transcation ID',
	HeaderSalonServices.TransactionDate,
	MsStaff.StaffName,
	MsCustomer.CustomerName
from HeaderSalonServices
inner join MsStaff on MsStaff.StaffId=HeaderSalonServices.StaffId
inner join MsCustomer on MsCustomer.CustomerId=HeaderSalonServices.CustomerId
where datediff(day,HeaderSalonServices.TransactionDate,'2012/12/24')='2'

--4
select dateadd(day,5,HeaderSalonServices.TransactionDate) as 'New Transcation Date',
		HeaderSalonServices.TransactionDate as 'Old Transcation Date',
		MsCustomer.CustomerName
	from HeaderSalonServices
	inner join MsCustomer on MsCustomer.CustomerId=HeaderSalonServices.CustomerId
	where datepart(day,HeaderSalonServices.TransactionDate) != 20

--5

select datename(weekday,HeaderSalonServices.TransactionDate) as 'Day',
MsCustomer.CustomerName,
MsTreatment.TreatmentName
from HeaderSalonServices
inner join MsCustomer on MsCustomer.CustomerId=HeaderSalonServices.CustomerId
inner join DetailSalonServices on DetailSalonServices.TransactionId= HeaderSalonServices.TransactionId
inner join MsTreatment on MsTreatment.TreatmentId=DetailSalonServices.TreatmentId
inner join MsStaff on MsStaff.StaffId=HeaderSalonServices.StaffId
where MsStaff.StaffGender in ('Female') 
 and 
 MsStaff.StaffPosition like '%top%'

order by MsCustomer.CustomerName asc

--6
select  top 1 MsCustomer.CustomerId,
		MsCustomer.CustomerName,
	HeaderSalonServices.TransactionId,
	count(DetailSalonServices.TreatmentId) as 'Total Treatment'

from MsCustomer
inner join HeaderSalonServices on HeaderSalonServices.CustomerId= MsCustomer.CustomerId
inner join DetailSalonServices on DetailSalonServices.TransactionId=HeaderSalonServices.TransactionId
group by MsCustomer.CustomerId,
MsCustomer.CustomerName,
HeaderSalonServices.TransactionId
order by 'Total Treatment' desc

--7
select MsCustomer.CustomerId,
HeaderSalonServices.TransactionId,
MsCustomer.CustomerName,
sum(MsTreatment.Price) as 'Total Price' 
from Mscustomer
inner join HeaderSalonServices on HeaderSalonServices.CustomerId = MsCustomer.CustomerId
inner join DetailSalonServices on DetailSalonServices.TransactionId =  HeaderSalonServices.TransactionId
inner join MsTreatment on MsTreatment.TreatmentId = DetailSalonServices.TreatmentId
group by MsCustomer.CustomerId,
HeaderSalonServices.TransactionId,
MsCustomer.CustomerName
having sum(MsTreatment.Price) > (
		select avg(ratarata.Total)
		from(
		select  sum(MsTreatment.Price) as Total
		from MsTreatment
		inner join DetailSalonServices on DetailSalonServices.TreatmentId= MsTreatment.TreatmentId
		group by  DetailSalonServices.TransactionId)
		as ratarata)
order by    'Total Price' desc;


--ini buat ngitung total masing masing baris
SELECT TransactionId, SUM(Price) AS Total
	FROM DetailSalonServices INNER JOIN MsTreatment ON DetailSalonServices.TreatmentId = MsTreatment.TreatmentId
		GROUP BY TransactionId

--ini buat ngitung rata ratanya
SELECT AVG (Average.Total) FROM
	(SELECT SUM(Price) AS Total FROM DetailSalonServices INNER JOIN MsTreatment ON DetailSalonServices.TreatmentId = MsTreatment.TreatmentId GROUP BY TransactionId) AS Average


--7
select MsCustomer.CustomerId,
HeaderSalonServices.TransactionId,
MsCustomer.CustomerName,
sum(MsTreatment.Price) as 'Total Price' 
from Mscustomer
inner join HeaderSalonServices on HeaderSalonServices.CustomerId = MsCustomer.CustomerId
inner join DetailSalonServices on DetailSalonServices.TransactionId =  HeaderSalonServices.TransactionId
inner join MsTreatment on MsTreatment.TreatmentId = DetailSalonServices.TreatmentId
group by MsCustomer.CustomerId,
HeaderSalonServices.TransactionId,
MsCustomer.CustomerName
having sum(MsTreatment.Price) > (
  select sum(a.result) from (
   select avg(MsTreatment.Price) as result
  ) as a
) 
order by    'Total Price' desc;



--8
select 'Mr. ' + MsStaff.StaffName as 'Name',
MsStaff.StaffPosition as 'StaffPosition',
MsStaff.StaffSalary 
from MsStaff
where MsStaff.StaffGender in ('Male')
union 
select 'Ms. ' + MsStaff.StaffName as 'Name',
		MsStaff.StaffPosition,
		MsStaff.StaffSalary
from MsStaff
where MsStaff.StaffGender in ('Female')

order by 'Name','StaffPosition'  asc


--9
select MsTreatment.TreatmentName,
		'Rp '+ cast(MsTreatment.Price as varchar) as Price  ,
		'Minimum Price' as 'Status'
from MsTreatment
where Price = (
	select min(Price) from MsTreatment
)
union 
select MsTreatment.TreatmentName,
		'Rp '+ cast(MsTreatment.Price as varchar) as Price ,
		'Maximum Price' as 'Status'
from MsTreatment
where Price = (
	select max(Price) from MsTreatment
)




--10
select MsCustomer.CustomerName as 'Longest Name of Staff and Customer',
		len(MsCustomer.CustomerName) as 'Length of Name',
		'Customer' as 'Status'
from MsCustomer
where len(MsCustomer.CustomerName) = (
select max(len(MsCustomer.CustomerName)) from MsCustomer
)
union
select MsStaff.StaffName as 'Longest Name of Staff and Customer',
		len(MsStaff.StaffName) as 'Length of Name',
		'Staff' as 'Status'
from MsStaff
where len(MsStaff.StaffName) = (
select max(len(MsCustomer.CustomerName)) from MsCustomer
)


