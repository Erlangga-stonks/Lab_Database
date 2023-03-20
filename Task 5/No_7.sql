
--- 7 Display TransactionDate & CustomerName obtaining Last Character

USE OOVEO_Salon

SELECT
	Hss.TransactionDate,
	RIGHT
	(CustomerName,CHARINDEX(' ',REVERSE(CustomerName)) AS CustomerName)

FROM
	MsCustomer AS Mc
	JOIN
		HeaderSalonServices AS Hss

ON
	Mc.CustomerId = Hss.CustomerId

WHERE
	CustomerName LIKE '% %'
	AND
	DATENAME(WEEKDAY,Hss.TransactionDate) = 'Saturday'