
---9 Delete Data On HeaderSalonServices

DELETE

FROM
	HeaderSalonServices

FROM 
	HeaderSalonServices JOIN MsCustomer

ON
	HeaderSalonServices.CustomerId = MsCustomer.CustomerId

WHERE
	CHARINDEX(' ',CustomerName) = 0

SELECT * FROM HeaderSalonServices