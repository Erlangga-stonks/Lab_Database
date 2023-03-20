
---8 Display StaffName, CustomerName, CustomerPhone 

USE OOVEO_Salon

SELECT
	StaffName,Mc.CustomerName,
	REPLACE(CustomerPhone, '08', '+628') AS CustomerPhone,
	Mc.CustomerAddress

FROM
	MsStaff AS Ms
	JOIN
	HeaderSalonServices AS Hss

ON
	Ms.StaffId = Hss.StaffId
	JOIN
	MsCustomer AS Mc

ON
	Mc.CustomerId = Hss.CustomerI

WHERE
	Mc.CustomerName LIKE '%[A,I,U,E,O]%'
	AND
	Ms.StaffName LIKE '% % %'
