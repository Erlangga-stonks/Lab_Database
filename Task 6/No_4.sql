
--- 4 Display New Transaction Date

USE OOVEO_Salon

SELECT
	DATEADD(DAY,5,HeaderSalonServices.TransactionDate) AS 'New Transaction ID',
	HeaderSalonServices.TransactionDate AS 'Old Transaction ID',
	MsCustomer.CustomerName

FROM
	HeaderSalonServices
	JOIN
	MsCustomer

ON
	MsCustomer.CustomerId = HeaderSalonServices.CustomerId

WHERE
	DATEPART(DAY, HeaderSalonServices.TransactionDate) !=20

