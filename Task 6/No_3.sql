
--- 3 Display New Transaction ID

USE OOVEO_Salon

SELECT
	REPLACE(HeaderSalonServices.TransactionId,'TR','Trans') AS 'New Transaction ID',
	HeaderSalonServices.TransactionId AS 'Old Transaction ID',
	HeaderSalonServices.TransactionDate,
	MsStaff.StaffName,
	MsCustomer.CustomerName

FROM
	HeaderSalonServices
	JOIN
	MsStaff

ON
	MsStaff.StaffId = HeaderSalonServices.StaffId
	JOIN
	MsCustomer
ON
	MsCustomer.CustomerId = HeaderSalonServices.CustomerId

WHERE
	DATEDIFF(DAY,HeaderSalonServices.TransactionDate, '2012/12/24') = 2
