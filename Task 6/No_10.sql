
---10.	Display Longest Name of Staff and Customer (obtained from CustomerName), Length of Name (obtained from length of customer’s name),
---		Status as ‘Customer’ for every customer who has the longest name.

USE OOVEO_Salon

SELECT
	MsCustomer.CustomerName AS 'Longest Name Of Staff and Customer',
	LEN(MsCustomer.CustomerName) AS 'Length Of Name',
	'Customer' AS 'Status'

FROM
	MsCustomer

WHERE
	LEN(MsCustomer.CustomerName) = (SELECT MAX(LEN(MsCustomer.CustomerName)) 
FROM
	MsCustomer)

UNION
	
SELECT
	MsStaff.StaffName AS 'Longest Name Of Staff and Customer',
	LEN(MsStaff.StaffName) AS 'Length Of Name',
	'Staff' As 'Status'

FROM
	MsStaff

WHERE
	LEN(MsStaff.StaffName) = (SELECT MAX(LEN(MsCustomer.CustomerName))
FROM
	MsCustomer)
