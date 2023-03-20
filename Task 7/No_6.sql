
--- No 6.	Display CustomerName, CustomerPhone, and CustomerAddress for every customer that was served by staff whose  name’s length is an odd number.
--- (exists, len)

SELECT
	MsCustomer.CustomerName,
	MsCustomer.CustomerPhone,
	MsCustomer.CustomerAddress

FROM
	MsCustomer

WHERE
	EXISTS
	(
	SELECT
		MsStaff.StaffName
	FROM
		MsStaff,HeaderSalonServices
	WHERE
		MsStaff.StaffId = HeaderSalonServices.StaffId
		AND
		MsCustomer.CustomerId = HeaderSalonServices.CustomerId	
		AND
		LEN(MsStaff.StaffName) % 2 = 1
	)

