
---6 Change CustomerName

UPDATE 
	MsCustomer

SET
	CustomerName = LEFT(CustomerName,CHARINDEX(' ',CustomerName))

FROM
	MsCustomer JOIN HeaderSalonServices

ON
	MsCustomer.CustomerId = HeaderSalonServices.CustomerId

WHERE
	DATEPART(day,TransactionDate) = 24

SELECT * FROM MsCustomer