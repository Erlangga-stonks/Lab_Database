
--- 3.	Display CustomerName, CustomerPhone, and CustomerAddress for every customer whose name is more than 8 charactes and did transaction on Friday.
--- (len, in, datename, weekday)

SELECT
	MsCustomer.CustomerName,
	MsCustomer.CustomerPhone,
	MsCustomer.CustomerAddress
	
FROM
	MsCustomer,HeaderSalonServices

WHERE
	MsCustomer.CustomerId = HeaderSalonServices.CustomerId
	AND
	LEN(MsCustomer.CustomerName) > 8
	AND
	DATENAME(Weekday,HeaderSalonServices.TransactionDate) = 'Friday'
